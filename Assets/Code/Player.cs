using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour, ITakeDamage 
{
	[HideInInspector]
	public bool isFacingRight;
	private CharacterController2D _controller; 								// Keeps track of our CharController2D component
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

	public bool Invincible;
	public bool doHandleInput = true;

	public CameraController cameraController;





	public void Awake()
	{
		_controller = GetComponent<CharacterController2D> ();
		isFacingRight = transform.localScale.x > 0; // if we are flipped, the localscale.x will be less than one, so we'll know we aren't facing right
		Health = MaxHealth; 
		MovementSpeed = _controller.Parameters.generalMovement.WalkSpeed;
		Application.targetFrameRate = 60;
	}

	public void Update() 
	{

		_canFireIn -= Time.deltaTime;

		if(!doHandleInput)
			ResetInput();

		// Don't move if we're dead


		if(!IsDead && doHandleInput)
		{
			HandleInput (); 
			HorizontalMovement();
			VerticalMovement();
		}	
		else
			_controller.SetHorizontalForce(0);

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

		if ( (yDir != -1 || (_controller.State.WallSlideLeft || _controller.State.WallSlideRight) ) 
		    && _controller.State.AbleToStand && _controller.State.IsCrouching )
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

		if(_controller.State.IsGrounded && !_controller.State.IsCrouching && (!_controller.State.WallSlideLeft || !_controller.State.WallSlideRight) )
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
			if (!isFacingRight && !_controller.wallJump)
					Flip();
		}

		else if (Input.GetKey (KeyCode.A)|| (Input.GetAxis("Horizontal") < -0.4) )
		{
			_normalizedHorizontalSpeed = -1; 
			if (isFacingRight && !_controller.wallJump)
					Flip();
		} 
		else 
		{
			_normalizedHorizontalSpeed = 0;
		}
	

		 if (Input.GetButtonDown("Jump")) 
		{
			_controller.jumpButton = true;		

			// Do this so that we don't need CanJump to be true to flip jumpButton flag
			if(_controller.CanJump)
			{
				// Force player to flip when jumping off a wall
				if(_controller.State.WallSlideLeft && !isFacingRight)
					Flip ();
				if(_controller.State.WallSlideRight && isFacingRight)
					Flip();

				_controller.Jump ();
			}

		} 

		if ( Input.GetButtonUp("Jump") )
			_controller.jumpButton = false;


		if(Input.GetButtonDown("Fire1"))
		{
			//FireProjectile();
		}

		if (Input.GetButtonDown("Sprint"))		
			SprintStart();

		if (Input.GetButtonUp("Sprint"))		
			SprintStop();

		if (Input.GetKeyDown(KeyCode.Joystick1Button8) && Input.GetKeyDown(KeyCode.Joystick1Button9))
			Invincible = !Invincible;

		
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
		_controller.jumpButton = false;
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
}









