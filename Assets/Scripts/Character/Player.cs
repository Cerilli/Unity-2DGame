using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour, ITakeDamage 
{
	#region Variables
	[HideInInspector]
	public bool isFacingRight;
	private CharacterController2D _controller; 								
	public CameraController cameraController;
	private float _normalizedHorizontalSpeed;  								// Will either be -1 or 1, depending on whether the player is moving left or right

	[HideInInspector]
	public float MovementSpeed							= 10; 	            // Max speed of the player
	public int MaxHealth 								= 100;
	public GameObject OuchEffect;

	public Projectile Projectile; 
	public float FireRate;
	public Transform ProjectileFireLocation;

	public AudioClip PlayerHitSound;
	public AudioClip PlayerShootSound;
	public AudioClip PlayerHealthSound;

	public int Health 	{get; private set;}
	public bool IsDead 	{get; private set;}

	private float _originalGravity;
	private float _originalGroundAccel;
	private float _originalAirAccel;

	private float _canFireIn;
	private bool _jumpButtonPressed;
	//private bool _jumpButtonReleased;
	private float _jumpHeightTimerReset;
	private float _wallDropTimerReset;
	private float _dashDirection = 1f; 
	private float _boostForce;

	public bool Invincible;
	public bool doHandleInput = true;
	#endregion

	public void Awake()
	{
		_controller = GetComponent<CharacterController2D> ();
		Health = MaxHealth; 

	}

	public void Start()
	{
		isFacingRight = transform.localScale.x > 0; // if we are flipped, the localscale.x will be less than one, so we'll know we aren't facing right
		MovementSpeed = _controller.Parameters.generalMovement.WalkSpeed;

		_originalGravity = _controller.Parameters.generalMovement.Gravity;
		_originalGroundAccel = _controller.Parameters.generalMovement.AccelerationOnGround;
		_originalAirAccel = _controller.Parameters.generalMovement.AccelerationInAir;

		_jumpHeightTimerReset = _controller.Parameters.jumpProperties.JumpHeightTimer;	
		_wallDropTimerReset = _controller.Parameters.jumpProperties.wallDropTimer;
		_boostForce = _controller.Parameters.dashProperties.DashForce;

		_controller.State.WallJump = false;
		_controller.State.CanMoveFreely = true;
		_controller.State.AbleToStand = true;
		_controller.State.IsDiving = false;
		_controller.State.IsStomping = false;
		_controller.State.IsSlidingToCrouch  = false;
		_controller.State.IsFalling = false;
		_controller.State.IsJumpPadTraveling = false;
		_controller.State.IsCollidingWithLadder= false;
		_controller.State.IsClimbingLadder = false;
		_controller.State.IsCollidingLadderTop = false;
		_controller.State.JumpPadDisabledControlsTimer = 0.02f;

	}

	public void Update() 
	{
		_canFireIn -= Time.deltaTime;

		if(!doHandleInput)
			ResetInput();

		if(!IsDead && doHandleInput)
		{
			GravityActive(true);
			HandleInput (); 

			if(!_controller.State.IsSlidingToCrouch)
				HorizontalMovement();

			VerticalMovement();
			WallSlide();
			LadderClimb();

			// If the player is dashing, we cancel the gravity
			if (_controller.State.IsDashing) 
			{
				GravityActive(false);
				_controller.SetVerticalForce(0);
			}	

			//Jumping Checks
			if(_controller.State.IsBouncingOnJumpPad)
				_controller.State.DoubleJump = true;		
			
			if(_controller.State.IsJumping 
			   && (!_controller.wasGroundedLastFrame 
			    && _controller.State.IsGrounded) || _controller.State.IsWallSliding ) 
				_controller.State.IsJumping = false;

			if (_controller.Parameters.jumpProperties.canVariableHeightJump  
			    && (_jumpButtonPressed && _controller.State.IsJumping) 
			    && !_controller.State.IsCollidingAbove ) 
				Jump ();
			
			if(!_jumpButtonPressed 
			   && _controller.Parameters.jumpProperties.JumpHeightTimer != _jumpHeightTimerReset) 
				_controller.Parameters.jumpProperties.JumpHeightTimer = _jumpHeightTimerReset;



		}	
		else
			_controller.SetHorizontalForce(0);
	}

	public void LateUpdate()
	{
		if(_controller.State.IsGrounded)
			_controller.State.DoubleJump = false;

		if (_controller.State.IsJumpPadTraveling && _controller.State.IsGrounded)
		{
			if(_controller.State.JumpPadDisabledControlsTimer >=0)
				_controller.State.JumpPadDisabledControlsTimer -= Time.deltaTime;
			else
			{
				_controller.State.IsJumpPadTraveling = false;
				if(!_controller.State.CanMoveFreely)
				_controller.State.CanMoveFreely = true;
				_controller.State.JumpPadDisabledControlsTimer = 0.02f;		
			}
		}

	}

	public void HorizontalMovement()
	{
		if(!_controller.State.CanMoveFreely)
			return;
		
		// Get the desired acceleration
		var movementFactor = 
			_controller.State.IsGrounded ? _controller.Parameters.generalMovement.AccelerationOnGround :
				_controller.Parameters.generalMovement.AccelerationInAir;

		// Every frame will set the x component of the player's velocity to a linear interp between the max speed and current velocity, 
		// using the movement factor (multiplied by deltatime) as the value to interp between		
		_controller.SetHorizontalForce(Mathf.Lerp
		                               (_controller.Velocity.x, _normalizedHorizontalSpeed * MovementSpeed, Time.deltaTime * movementFactor));
	}

	public void VerticalMovement()
	{
		if(!_controller.State.CanMoveFreely)
			return;

		int yDir = YInputDir();

		//Check for crouching
		if(yDir == -1 && _controller.State.IsGrounded && !_controller.State.IsCrouching)
			Crouch ();

		if ( (yDir != -1 || _controller.State.IsWallSliding ) 
		    	&& _controller.State.IsCrouching
		    	&& _controller.State.AbleToStand )
		{
			_controller.ResetColliderSize();
			_controller.RecalculateDistanceBetweenRays();
			_controller.ResetPlayerMeshSize();
			_controller.State.IsCrouching = false;

			if (!_controller.State.IsSprinting)					
				MovementSpeed = _controller.Parameters.generalMovement.WalkSpeed;
		}

	}

	//== ACTIONS =================================================
	#region Actions
	public void SprintStart()
	{
		if(!_controller.State.CanMoveFreely)
			return;

		if (!_controller.Parameters.generalMovement.canSprint)
			return;

		if(_controller.State.IsGrounded && !_controller.State.IsCrouching && !_controller.State.IsWallSliding )
		{
			MovementSpeed = _controller.Parameters.generalMovement.SprintSpeed;
			_controller.State.IsSprinting = true;				
		}
	}

	public void SprintStop()
	{
		MovementSpeed = _controller.Parameters.generalMovement.WalkSpeed;
		_controller.State.IsSprinting = false;
	}

	public void Crouch()
	{
		if(_controller.Parameters.crouchProperties.CanCrouch)
		{
			_controller.CrouchResize();
			_controller.State.IsCrouching = true;
		
			if(_controller.Parameters.crouchProperties.SlideToCrouch)
				StartCoroutine(SlideToCrouch());		
			else
				MovementSpeed = _controller.Parameters.crouchProperties.CrouchMoveSpeed;			
		}
	}

	public void Dash()
	{
		// if the player is not in a position where it can move freely, we do nothing.
		if (!_controller.State.CanMoveFreely)
			return;

		var yDir = YInputDir();
		// If the user presses the dash button and is not aiming down
		if (yDir >-0.8 && _controller.Parameters.dashProperties.canDash) 
		{	
			if (_controller.State.AbleToDash)
			{
				_controller.State.IsDashing=true;
				
				
				if (isFacingRight) { _dashDirection=1f; } else { _dashDirection = -1f; }
				_boostForce=_dashDirection*_controller.Parameters.dashProperties.DashForce;
				_controller.State.AbleToDash = false;
				_controller.Parameters.generalMovement.AccelerationInAir = 300f;
				_controller.Parameters.generalMovement.AccelerationOnGround = 300f;
				StartCoroutine( Boost(_controller.Parameters.dashProperties.DashDuration,_boostForce,0,"dash") );
			}			
		}
		
		if (yDir<-0.8 && !_controller.State.IsGrounded && _controller.Parameters.dashProperties.canDownDash) 
		{
			StartCoroutine(Dive());
		}	
	}

	public void Jump()
	{
		if(_controller.State.IsGrounded)
			_controller.Parameters.jumpProperties.JumpHeightTimer = _jumpHeightTimerReset;

		if(_controller.State.DoubleJump)
			return;

		// Drop through one way platforms if crouch jump while standing on one
		if(_controller.StandingOn != null)
		{
			if ( _controller.State.IsGrounded && _controller.StandingOn.layer==10 && _controller.State.IsCrouching)
			{	
					_controller.transform.position=new Vector2(transform.position.x,transform.position.y-0.1f);
					return;
			}
		}

		var JumpHeight = _controller.Parameters.jumpProperties.JumpMagnitude; 
		
		if (_controller.State.IsWallSliding)
		{
			_controller.State.HasWallJumped = true;
			// Jump off the wall depending on which side the wall is on, using WallJumpOut to affect x velocity off wall
			_controller.SetForce (new Vector2 (_controller.State.WallSlideLeft ? 
			                                     JumpHeight * _controller.Parameters.jumpProperties.WallJumpOut : 
			                                    (JumpHeight * _controller.Parameters.jumpProperties.WallJumpOut) * -1, JumpHeight));
			
			if(_controller.Parameters.jumpProperties.canDoubleJumpOffWall)
				_controller.State.DoubleJump = false;
			else 
				_controller.State.DoubleJump = true;

			if(_controller.State.WallSlideLeft && !isFacingRight)
				Flip ();
			if(_controller.State.WallSlideRight && isFacingRight)
				Flip();			
			
			// Force wallJump off if we have jumped
			ResetWallJump();

			if(_controller.Parameters.jumpProperties.JumpHeightTimer >= 0)
			{
				_controller.SetVerticalForce(JumpHeight);
				_controller.Parameters.jumpProperties.JumpHeightTimer -= Time.deltaTime;
				_controller.State.IsJumping = true;
			}
			return;
		}
		
		if(!_controller.State.DoubleJump 
		   && !_controller.State.IsGrounded 
		   && _controller.Parameters.jumpProperties.JumpHeightTimer == _jumpHeightTimerReset)	
		{
			_controller.State.DoubleJump = true;
			JumpHeight = _controller.Parameters.jumpProperties.doubleJumpMagnitude;
			_controller.Parameters.jumpProperties.JumpHeightTimer = _controller.Parameters.jumpProperties.doubleJumpTimer;
		}
		
		if (_controller.State.IsCrouching)
		{	
			if (_controller.State.DoubleJump && !_controller.Parameters.jumpProperties.canDoubleJumpWhileCrouched)
				return;			
			JumpHeight = JumpHeight * _controller.Parameters.crouchProperties.CrouchJumpModifier;
		}

		if(_controller.State.DoubleJump && !_controller.Parameters.jumpProperties.canDoubleJump)
			return;		
		
		// "_jumpIn" is used to determine if a player can jump or not
		_controller.SetJumpIn(_controller.Parameters.jumpProperties.JumpFrequency);

		// Jump
		if(_controller.Parameters.jumpProperties.JumpHeightTimer >= 0 )
		{
			_controller.SetVerticalForce(JumpHeight);
			_controller.Parameters.jumpProperties.JumpHeightTimer -= Time.deltaTime;
			if (!_controller.State.IsJumping) _controller.State.IsJumping = true;
		}			
		
		if(!_controller.Parameters.jumpProperties.canVariableHeightJump)
			_controller.SetVerticalForce (JumpHeight);
		


	}

	public void WallSlide()
	{
		var xDir = XInputDir();

		// Set WallSliding to true if we're not grounded, but colliding on either side
		if (!_controller.State.IsGrounded 
		    && (_controller.State.IsCollidingLeft || _controller.State.IsCollidingRight) 
		    && _controller.Parameters.jumpProperties.canWallJump)
		{
			_controller.State.IsWallSliding = true;
			MovementSpeed =  _controller.Parameters.generalMovement.WalkSpeed;
			if (_controller.State.IsCollidingLeft)
			{	
				_controller.State.WallSlideLeft = true;
				_controller.State.DoubleJump = false;
			}
			if (_controller.State.IsCollidingRight)
			{
				_controller.State.WallSlideRight = true;
				_controller.State.DoubleJump = false;
			}
		}

		// If we're pushing against the wall, keep the wallDropTimer at its default
		if ( ( xDir == -1 && _controller.State.WallSlideLeft) || (xDir == 1 && _controller.State.WallSlideRight) )
			_controller.Parameters.jumpProperties.wallDropTimer = _wallDropTimerReset;
		
		// If we're not pushing against the wall, start counting down until we drop off the wall
		else if ((xDir != -1 && _controller.State.WallSlideLeft) || (xDir != 1 && _controller.State.WallSlideRight))
			_controller.Parameters.jumpProperties.wallDropTimer -= Time.deltaTime;
		
		// Turn wall jump off if we slide down a wall to the ground, or are no longer colliding with a wall
		if (_controller.State.IsGrounded && _controller.State.IsWallSliding)
			ResetWallJump ();
		
		// Stick to the wall if we are sliding and having been pushing against the wall 
		if ( _controller.State.IsWallSliding && _controller.Parameters.jumpProperties.wallDropTimer > 0)
			_controller.SetHorizontalForce(0);
		
		// Reset State.HasWallJumped after landing from a wall jump
		if(_controller.State.IsGrounded && _controller.State.HasWallJumped)
			_controller.State.HasWallJumped = false;

	}

	void LadderClimb()
	{
		var yDir = YInputDir();

		if (_controller.State.IsCollidingWithLadder)
		{
			if (yDir == 1 && !_controller.State.IsClimbingLadder && !_controller.State.IsCollidingLadderTop )
			{			
				_controller.State.IsClimbingLadder=true;
				_controller.State.CanMoveFreely=false;
				//ShootStop();
				_controller.State.LadderClimbingSpeed=0;
				
				_controller.SetHorizontalForce(0);
				_controller.SetVerticalForce(0);
				GravityActive(false);
			}			
			
			if (_controller.State.IsClimbingLadder)
			{
				_controller.State.AbleToFire=false;
				GravityActive(false);
				_controller.SetVerticalForce(yDir * _controller.Parameters.generalMovement.LadderClimbSpeed);
				_controller.State.LadderClimbingSpeed=Mathf.Abs(yDir);				
			}
			
			if (_controller.State.IsClimbingLadder && _controller.State.IsGrounded)
			{
				_controller.State.IsCollidingWithLadder=false;
				_controller.State.IsClimbingLadder=false;
				_controller.State.CanMoveFreely=true;
				_controller.State.LadderClimbingSpeed=0;	
				GravityActive(true);			
			}			
		}
		
		// If the player is colliding with the top of the ladder and is pressing down and is not on the ladder yet and is standing on the ground, we make it go down.
		if (_controller.State.IsCollidingLadderTop && yDir == -1 && !_controller.State.IsClimbingLadder && _controller.State.IsGrounded)
		{
			transform.position=new Vector2(transform.position.x,transform.position.y-0.1f);
			_controller.State.IsClimbingLadder=true;
			_controller.State.CanMoveFreely=false;
			_controller.State.LadderClimbingSpeed=0;
			
			_controller.SetHorizontalForce(0);
			_controller.SetVerticalForce(0);
			GravityActive(false);
		}
		
	}
	#endregion

	public void FinishLevel()
	{
		enabled = false;
		_controller.enabled = false;
		collider2D.enabled = false;
	}

	public void Kill()
	{
		if(!Invincible)
		{
			// No longer collide
			_controller.HandleCollisions = false;

			// Don't set off any triggers
			collider2D.enabled = false;

			IsDead = true;

			// When killed by insta-death, we want the health display to immediately jump to zero
			Health = 0;

			_controller.SetForce(new Vector2(0,20));
		}
	}

	public void RespawnAt(Transform spawnPoint)
	{
		// Reset the player and turn shit back on
		if(!isFacingRight)
			Flip ();

		IsDead = false;
		collider2D.enabled = true;
		_controller.HandleCollisions = true;
		_controller.State.IsSprinting = false;
		_controller.State.AbleToDash = _controller.Parameters.dashProperties.canDash;
		_controller.ResetParameters();

		cameraController.ResetCamera();

		//Reset Health
		Health = MaxHealth;

		transform.position = spawnPoint.position;
	}

	public void TakeDamage(int damage, GameObject instigator)
	{
		if(!Invincible)
		{
			// Position doesn't really matter since it's just a 2D sounds
			AudioSource.PlayClipAtPoint(PlayerHitSound, transform.position);

			// Floating text that displays how much damage the player has taken
			FloatingText.Show (string.Format("-{0}", damage), "PlayerTakeDamageText", new FromWorldPointTextPositioner(Camera.main, transform.position, 2f, 60f));

			Instantiate(OuchEffect, transform.position, transform.rotation);
			Health -= damage;

			StartCoroutine(BlinkFromDamage());

			if (Health <= 0)
				LevelManager.Instance.KillPlayer();
		}
	}

	public void GiveHealth(int health, GameObject instigator)
	{
		AudioSource.PlayClipAtPoint(PlayerHealthSound, transform.position);

		FloatingText.Show(string.Format("+{0}", health), "PlayerGotHealthText", new FromWorldPointTextPositioner(Camera.main, transform.position, 2f, 60f));
	
		// Add health, as long as it isn't more than MaxHealth
		Health = Mathf.Min (Health + health, MaxHealth);
	}

	private void HandleInput()
	{
		if (Input.GetKey(KeyCode.D) || (Input.GetAxis("Horizontal") > 0.4) ) 
		{
			_normalizedHorizontalSpeed = 1;
			if (!isFacingRight && !_controller.State.IsWallSliding)
					Flip();
		}

		else if (Input.GetKey (KeyCode.A)|| (Input.GetAxis("Horizontal") < -0.4) )
		{
			_normalizedHorizontalSpeed = -1; 
			if (isFacingRight && !_controller.State.IsWallSliding)
					Flip();
		} 
		else 	
			_normalizedHorizontalSpeed = 0;

		if(Input.GetButtonDown("Dash"))
			Dash();

		if (Input.GetButtonDown("Jump")) 
		{
			_jumpButtonPressed = true;		
			//_jumpButtonReleased = false;

			if(_controller.CanJump)
				Jump ();
		} 

		if ( Input.GetButtonUp("Jump") )
		{
			_jumpButtonPressed=false;
			//_jumpButtonReleased=true;
		}

		if(Input.GetButtonDown("Fire1"))
		{
			//FireProjectile();
		}

		if (Input.GetButton("Sprint"))		
			SprintStart();

		if (Input.GetButtonUp("Sprint"))		
			SprintStop();

		if (Input.GetKeyDown(KeyCode.Joystick1Button8) && Input.GetKeyDown(KeyCode.Joystick1Button9))
			ToggleGodMode();		
	}

	private void FireProjectile()
	{
		if (_canFireIn > 0)
			// we can't fire anything at this point
			return;

		var direction = isFacingRight ? Vector2.right : -Vector2.right;

		// Instantiate the projectile at our determined position
		var projectile = (Projectile)Instantiate(Projectile, ProjectileFireLocation.position, ProjectileFireLocation.rotation);

		// Intialize the projectile (therefore calling the functions from the Projectile class
		projectile.Initialize(gameObject, direction, _controller.Velocity);

		// Reset the FireRate counter
		_canFireIn = FireRate;

		AudioSource.PlayClipAtPoint(PlayerShootSound, transform.position);
	}

	//==COROUTINES==================================================
	#region Coroutines
	private IEnumerator BlinkFromDamage()
	{
		Invincible = true;
		var meshes = gameObject.GetComponentsInChildren<MeshRenderer>();
		for (var i = 0; i <= 3; i ++)
		{
			foreach (MeshRenderer mesh in meshes)
				mesh.enabled = false;		

			yield return new WaitForSeconds(0.05f);

			foreach (MeshRenderer mesh in meshes)
				mesh.enabled = true;	

			yield return new WaitForSeconds(0.05f);
		}
		Invincible = false;
	}

	IEnumerator Boost(float boostDuration, float boostForceX, float boostForceY, string name)
	{
		float time = 0f; //create float to store the time this coroutine is operating
		
		while(boostDuration > time) //we call this loop every frame while our custom boostDuration is a higher value than the "time" variable in this coroutine
		{
			if(_controller.State.IsCollidingLeft || _controller.State.IsCollidingRight)
				break;

			if (boostForceX!=0)
			{
				_controller.AddForce(new Vector2(boostForceX,0));
			}
			if (boostForceY!=0)
			{
				_controller.AddForce(new Vector2(0,boostForceY));
			}
			time+=Time.deltaTime;
			yield return 0; //go to next frame
		}
		if (name=="dash")
		{
			_controller.State.IsDashing=false;
			_controller.Parameters.generalMovement.AccelerationInAir = _originalAirAccel;
			_controller.Parameters.generalMovement.AccelerationOnGround = _originalGroundAccel;
			GravityActive(true);
			//MoveModifierHorizontal=0f;
			yield return new WaitForSeconds(_controller.Parameters.dashProperties.DashCooldown); //Cooldown time for being able to boost again, if you'd like.
			_controller.State.AbleToDash = true; //set back to true so that we can boost again.
		}	
		if (name=="wallJump")
		{
			//MoveModifierHorizontal=0f;
		}		
	}

	IEnumerator Dive()
	{	
		// Shake parameters : intensity, duration (in seconds) and decay
		//Vector3 ShakeParameters = new Vector3(1.5f,0.5f,1f);
		_controller.State.IsDiving=true;
		while (!_controller.State.IsGrounded)
		{
			if(_controller.State.IsStomping)
			{
				_controller.State.IsStomping = false;
				break;
			}
			_controller.SetVerticalForce(_controller.Parameters.generalMovement.Gravity*-_controller.Parameters.dashProperties.DownDashForce);
			yield return 0; //go to next frame
		}
		
		// Shake the scene 		
		//_sceneCamera.SendMessage("Shake",ShakeParameters);
		
		_controller.State.IsDiving=false;
	}

	IEnumerator SlideToCrouch()
	{
		_controller.State.IsSlidingToCrouch = true;

		if(isFacingRight)
		{
			while ((_controller.Velocity.x -0.4f) > _controller.Parameters.crouchProperties.CrouchMoveSpeed )
			{
				if(!_controller.State.IsCrouching)
					break;

				_controller.SetHorizontalForce(Mathf.MoveTowards(_controller.Velocity.x,_controller.Parameters.crouchProperties.CrouchMoveSpeed, .3f));
				yield return 0;
			}
		}
		if(!isFacingRight)
			while ((_controller.Velocity.x +0.4f) < -_controller.Parameters.crouchProperties.CrouchMoveSpeed )
		{
			if(!_controller.State.IsCrouching)
				break;
			
			_controller.SetHorizontalForce(Mathf.MoveTowards(_controller.Velocity.x,_controller.Parameters.crouchProperties.CrouchMoveSpeed, .3f));			
			yield return 0;
		}

		_controller.State.IsSlidingToCrouch = false;
		MovementSpeed = _controller.Parameters.crouchProperties.CrouchMoveSpeed;
	}

	#endregion

	//==TOOLS=======================================================
	#region Tools
	private void Flip()
	{
		transform.localScale = new Vector3 (-transform.localScale.x, transform.localScale.y, transform.localScale.z);
		isFacingRight = transform.localScale.x > 0;
	}

	private void GravityActive(bool state)
	{
		if (state==true)
		{
			if (_controller.Parameters.generalMovement.Gravity==0)
			{
				_controller.Parameters.generalMovement.Gravity = _originalGravity;
			}
		}
		else
		{
			_controller.Parameters.generalMovement.Gravity = 0;
		}
	}

	public void ResetInput()
	{
		_normalizedHorizontalSpeed = 0;
		_jumpButtonPressed = false;
	}

	public int YInputDir()
	{
		// Check to see which vertical input is being pressed, if any
		
		if (Input.GetAxisRaw ("Vertical") <= -0.5 || Input.GetKey (KeyCode.S) || Input.GetKey (KeyCode.DownArrow))
			return -1;
		
		if (Input.GetAxisRaw ("Vertical") >= 0.5 || Input.GetKey (KeyCode.W) || Input.GetKey (KeyCode.UpArrow))
			return 1;
		
		return 0;
	}

	public int XInputDir()
	{
		// Check to see which horizontal input is being pressed, if any
		
		if(Input.GetAxisRaw("Horizontal") <= -0.5 || Input.GetKey(KeyCode.A) || Input.GetKey(KeyCode.LeftArrow))
			return -1;
		
		else if (Input.GetAxisRaw ("Horizontal") >= 0.5 || Input.GetKey (KeyCode.D) || Input.GetKey (KeyCode.RightArrow))
			return 1;
		
		return 0;
	}

	public void ResetWallJump()
	{
		// Set all wall jump variables to their default state		
		_controller.State.IsWallSliding = false;
		_controller.State.WallSlideLeft = false;
		_controller.State.WallSlideRight = false;
		_controller.Parameters.jumpProperties.wallDropTimer = _wallDropTimerReset;		
	}

	public void ToggleGodMode()
	{
		Invincible = !Invincible;
		Debug.Log("Invincible: " + (Invincible));
	}

	public bool JumpButton()
	{
		return _jumpButtonPressed;
	}
	#endregion
}










