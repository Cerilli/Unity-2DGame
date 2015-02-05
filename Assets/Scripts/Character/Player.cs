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

	private float _canFireIn;
	private bool _jumpButtonPressed;
	//private bool _jumpButtonReleased;
	private float _jumpHeightTimerReset;
	private float _wallDropTimerReset;

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

		_jumpHeightTimerReset = _controller.Parameters.jumpProperties.JumpHeightTimer;	
		_wallDropTimerReset = _controller.Parameters.jumpProperties.wallDropTimer;

		_controller.State.WallJump = false;
		_controller.State.CanMoveFreely = true;
		_controller.State.AbleToStand = true;

	}

	public void Update() 
	{
		_canFireIn -= Time.deltaTime;

		if(!doHandleInput)
			ResetInput();

		if(!IsDead && doHandleInput)
		{
			HandleInput (); 
			HorizontalMovement();
			VerticalMovement();
			WallSlide();

			//Jumping Checks
			if(_controller.State.IsBouncingOnJumpPad)
				_controller.State.DoubleJump = true;		
			
			if(_controller.State.IsJumping 
			   && (!_controller.wasGroundedLastFrame 
			    && _controller.State.IsGrounded) || _controller.State.WallSliding ) 
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
		if(yDir == -1 && _controller.State.IsGrounded)
		{
			Crouch ();
			_controller.State.IsCrouching = true;
			MovementSpeed = _controller.Parameters.crouchProperties.CrouchMoveSpeed;
		}

		if ( (yDir != -1 || _controller.State.WallSliding ) 
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

	public void SprintStart()
	{
		if (!_controller.Parameters.generalMovement.canSprint)
						return;

		if(_controller.State.IsGrounded && !_controller.State.IsCrouching && !_controller.State.WallSliding )
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
			_controller.CrouchResize();
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
		
		if (_controller.State.WallSliding)
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
		
		// Jump
		if(_controller.Parameters.jumpProperties.JumpHeightTimer >= 0 )
		{
			_controller.SetVerticalForce(JumpHeight);
			_controller.Parameters.jumpProperties.JumpHeightTimer -= Time.deltaTime;
			if (!_controller.State.IsJumping) _controller.State.IsJumping = true;
		}		
		
		
		if(!_controller.Parameters.jumpProperties.canVariableHeightJump)
			_controller.SetVerticalForce (JumpHeight);
		
		// "_jumpIn" is used to determine if a player can jump or not
		_controller.SetJumpIn(_controller.Parameters.jumpProperties.JumpFrequency);
	}

	public void WallSlide()
	{
		var xDir = XInputDir();

		// Set WallSliding to true if we're not grounded, but colliding on either side
		if (!_controller.State.IsGrounded 
		    && (_controller.State.IsCollidingLeft || _controller.State.IsCollidingRight) 
		    && _controller.Parameters.jumpProperties.canWallJump)
		{
			_controller.State.WallSliding = true;
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
		if (_controller.State.IsGrounded && _controller.State.WallSliding)
			ResetWallJump ();
		
		// Stick to the wall if we are sliding and having been pushing against the wall 
		if ( _controller.State.WallSliding && _controller.Parameters.jumpProperties.wallDropTimer > 0)
			_controller.SetHorizontalForce(0);
		
		// Reset State.HasWallJumped after landing from a wall jump
		if(_controller.State.IsGrounded && _controller.State.HasWallJumped)
			_controller.State.HasWallJumped = false;

	}

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
			if (!isFacingRight && !_controller.State.WallSliding)
					Flip();
		}

		else if (Input.GetKey (KeyCode.A)|| (Input.GetAxis("Horizontal") < -0.4) )
		{
			_normalizedHorizontalSpeed = -1; 
			if (isFacingRight && !_controller.State.WallSliding)
					Flip();
		} 
		else 	
			_normalizedHorizontalSpeed = 0;

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

	private void Flip()
	{
		transform.localScale = new Vector3 (-transform.localScale.x, transform.localScale.y, transform.localScale.z);
		isFacingRight = transform.localScale.x > 0;
	}

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
		
		if (Input.GetAxisRaw ("Vertical") >= 0.5 || Input.GetKey (KeyCode.A) || Input.GetKey (KeyCode.UpArrow))
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
		
		_controller.State.WallSliding = false;
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
}










