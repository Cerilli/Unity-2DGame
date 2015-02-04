using UnityEngine;
using System.Collections;

public class CharacterController2D : MonoBehaviour 
{

	#region Variables

	private const float SkinWidth = .02f;
	private const int TotalHorizontalRays = 8; //specify how many rays will be used to detect collision
	private const int TotalVerticalRays = 4;

	private static readonly float SlopeLimitTangent = Mathf.Tan(75f * Mathf.Deg2Rad); // will be used when moving up and down slopes is implemented

	public LayerMask PlatformMask; 	// A layer mask that will be used for collision detection. 

	[SerializeField]
	private LayerMask oneWayPlatformMask = 10;

	public ControllerParameters2D DefaultParameters; // allows us to edit the default parameters in the inspector

	public ControllerState2D State { get; private set; }
	public Vector2 Velocity { get { return _velocity; } }
	public Vector3 PlatformVelocity { get; private set; }

	public bool wasGroundedLastFrame {get; set;}

	public bool CanJump 
	
	{ 
		get 
		{ 
			// we can Jump IF we have the jump restriction of CanJumpAnywhere
			if(Parameters.jumpProperties.JumpRestrictions == ControllerParameters2D.JumpBehaviour.CanJumpAnywhere)
				return _jumpIn <= 0;


			// or if our jump restriction is CanJumpOnGround
			if(Parameters.jumpProperties.JumpRestrictions == ControllerParameters2D.JumpBehaviour.CanJumpOnGround)
				if(( State.IsGrounded || _groundDetected) || (!doubleJump && Parameters.jumpProperties.canDoubleJump) || wallJump )
					return true;
				else 
					return false;

			// otherwise, we can't jump
			return false;
		} 
	
	}


	public bool HandleCollisions { get; set; }
	public ControllerParameters2D Parameters { get { return _overrideParameters ?? DefaultParameters; } }	
	// ?? is the null coalescing operator - same as saying 'if _overrideParmeters != null, return it, else return DefaultParameters'
	// when you access the parameters through this property, it will return either the DefaultParameters, or the _overrideParameters
	public GameObject StandingOn { get; private set; }

	private Vector2 _velocity;
	private ControllerParameters2D _overrideParameters; // allows us to override the parameters of ControllerParameters2D by setting this to whatever we want
	private Transform _transform;
	private Vector3 _localScale;

	// Player Collider =====================

	private BoxCollider2D _boxCollider;
	private Vector2 boxColliderOriginalSize;
	private Vector2 boxColliderOriginalCenter;

	// =====================================

	public bool isSprinting {get; set;}
	public bool sprintButton {get; set;}
	public float sprintSpeedModifier {get; set;}

	public bool jumpButton {get; set;}
	private float _jumpIn;
	public bool doubleJump {get; set;}
	public bool isJumping {get; set;}
	private float _jumpHeightTimerReset;

	private GameObject _lastStandingOn;
	private GameObject _lastGroundObject;

	// Wall Jumping =========================

	[HideInInspector]
	public bool wallJump = false;
	public float wallDropTimer = 5.0f;
	private float wallDropTimerReset;

	public bool isWallSliding { get { return (wallSlideLeft || wallSlideRight); } }
	[HideInInspector]
	public bool wallSlideLeft  = false;
	[HideInInspector]
	public bool wallSlideRight = false;
	private bool hasWallJumped = false;

	// =======================================	


	// Crouching =============================

	//private bool isCrouching = false;
	//private bool isSliding = false;
	private bool canStand = true;
	private bool DropThrough = false;

	// =======================================


	private Vector3
		_activeGlobalPlatformPoint,
		_activeLocalPlatformPoint;

	private Vector3
		_raycastTopLeft,
		_raycastBottomRight,
		_raycastBottomLeft;

	private float
				_verticalDistanceBetweenRays,
				_horizontalDistanceBetweenRays;

	public bool detectEdges = true;
	private bool _groundDetected;

	#endregion


	public void Awake()
	{
		// add our one-way platforms to our normal platform mask so that we can land on them from above
		PlatformMask |= oneWayPlatformMask;

		HandleCollisions = true;
		State = new ControllerState2D ();
		_transform = transform;
		_localScale = transform.localScale;
		_boxCollider = GetComponent<BoxCollider2D> ();

		boxColliderOriginalSize = _boxCollider.size;
		boxColliderOriginalCenter = _boxCollider.center;

		wallDropTimerReset = wallDropTimer;
		RecalculateDistanceBetweenRays ();

		sprintSpeedModifier = Parameters.generalMovement.sprintModifier;

		_jumpHeightTimerReset = Parameters.jumpProperties.JumpHeightTimer;

	}

	#region Set Forces
	public void AddForce(Vector2 force)
	{
		_velocity += force;
	}

	public void SetForce(Vector2 force)
	{
		_velocity = force;
	}

	public void SetHorizontalForce(float x)
	{
		_velocity.x = x;
	}

	public void SetVerticalForce(float y)
	{
		_velocity.y = y; 
	}
	#endregion

	//========================================================================================================================//
	//============== ACTION FUNCTIONS=========================================================================================//
	//========================================================================================================================//

	#region ACTION FUNCTIONS
	public void Jump()
	{
		if(State.IsGrounded)
			Parameters.jumpProperties.JumpHeightTimer = _jumpHeightTimerReset;

		// Drop down through one way platform if we are standing on one and press crouch + jump
		if( StandingOn != null && StandingOn.tag == "OneWayPlatform" && State.IsCrouching)
		{
			DropThrough = true;
			return;
		}

		var JumpHeight = Parameters.jumpProperties.JumpMagnitude; 
		//TODO: Moving platform support
		//_velocity.y += Mathf.Max(_velocity.y + JumpHeight, (2f * Time.deltaTime));

		if (wallJump)
		{
			hasWallJumped = true;
			// Jump off the wall depending on which side the wall is on, using WallJumpOut to affect x velocity off wall
			_velocity = new Vector2 (wallSlideLeft ? 
			                         JumpHeight * Parameters.jumpProperties.WallJumpOut : (JumpHeight * Parameters.jumpProperties.WallJumpOut) * -1, JumpHeight);

			if(Parameters.jumpProperties.canDoubleJumpOffWall)
				doubleJump = false;
			else 
				doubleJump = true;
			


			// Force wallJump off if we have jumped
			ResetWallJump();
			if(jumpButton && Parameters.jumpProperties.JumpHeightTimer >= 0)
			{
				_velocity.y = JumpHeight;
				Parameters.jumpProperties.JumpHeightTimer -= Time.deltaTime;
				isJumping = true;
			}
			return;
		}

		if(!doubleJump && !State.IsGrounded && Parameters.jumpProperties.JumpHeightTimer == _jumpHeightTimerReset)	
		{
			doubleJump = true;
			Parameters.jumpProperties.JumpHeightTimer = Parameters.jumpProperties.doubleJumpTimer;
		}

		if (State.IsCrouching)
		{				
			JumpHeight = JumpHeight * Parameters.crouchProperties.CrouchJumpModifier;
			
			if (!Parameters.jumpProperties.canDoubleJumpWhileCrouched && !State.IsGrounded && Parameters.jumpProperties.JumpHeightTimer == _jumpHeightTimerReset)
				doubleJump = true;
		}

		if (doubleJump) 
			JumpHeight = Parameters.jumpProperties.doubleJumpMagnitude;

		// Jump
		if(jumpButton && Parameters.jumpProperties.JumpHeightTimer >= 0 )
		{
			_velocity.y = JumpHeight;
			Parameters.jumpProperties.JumpHeightTimer -= Time.deltaTime;
			if (!isJumping) isJumping = true;
		}




		if(!Parameters.jumpProperties.canVariableHeightJump)
			_velocity.y = JumpHeight;


		// **ORIGINAL TECHNIQUE***
		//AddForce(new Vector2 (0, JumpHeight));
		// ****

		// "_jumpIn" is used to determine if a player can jump or not
		_jumpIn = Parameters.jumpProperties.JumpFrequency;


	}

	public void Dash()
	{
		//var isGoingRight = _velocity.x > 0;

		_velocity.y = 0f;

		if (_velocity.x > 0)
						_velocity.x = _velocity.x + 60f;

		if (_velocity.x < 0)
						_velocity.x = _velocity.x -60f;

	}

	public void Crouch()
	{
		if (!State.IsCrouching)
		{

			// The value for _boxcollider.center must be manually tweaked for now so that it doesn't cause the player to slightly rise when it's reset upon exiting crouch.
			// If the player does rise slightly, it cause them to fall through a one way platform
			_boxCollider.center = new Vector2(_boxCollider.center.x, -1.05f);
			_boxCollider.size = new Vector2(_boxCollider.size.x, 3.35f);

			RecalculateDistanceBetweenRays ();

			GameObject player = GameObject.Find("Capsule");
			player.transform.localScale = new Vector3(3.25f, 1.85f, 1.4f);
			player.transform.localPosition = new Vector3(player.transform.localPosition.x, -0.9f, player.transform.localPosition.z);

			State.IsCrouching = true;
		}

	}

	#endregion

	//========================================================================================================================//
	//========================================================================================================================//

	public void LateUpdate()
	{
	
		// Jumping checks / variable height ==
		#region Jumping Checks

		if(State.IsBouncingOnJumpPad)
			doubleJump = true;

		_jumpIn -= Time.deltaTime;

		if(isJumping && (!wasGroundedLastFrame && State.IsGrounded) || isWallSliding ) 
			isJumping = false;
		if (Parameters.jumpProperties.canVariableHeightJump  && (jumpButton && isJumping) && !doubleJump) 
			Jump ();

		if(!jumpButton) 
			Parameters.jumpProperties.JumpHeightTimer = _jumpHeightTimerReset;

		#endregion
		// ===================================

		int xDir = XInputDir();
		int yDir = YInputDir();

		// Wall Jumping =================
		#region Wall Jumping

		// If we're pushing against the wall, keep the wallDropTimer at its default
		if ( ( xDir == -1 && wallSlideLeft) || (xDir == 1 && wallSlideRight) )
			wallDropTimer = wallDropTimerReset;

		// If we're not pushing against the wall, start counting down until we drop off the wall
		else if ((xDir != -1 && wallSlideLeft) || (xDir != 1 && wallSlideRight))
						wallDropTimer -= Time.deltaTime;

		// Turn wall jump off if we slide down a wall to the ground, or are no longer colliding with a wall
		if (State.IsGrounded && isWallSliding)
						ResetWallJump ();
	
		// Stick to the wall if we are sliding and having been pushing against the wall 
		if ( isWallSliding && wallDropTimer > 0)
			_velocity.x = 0;

		// Reset hasWallJumped after landing from a wall jump
		if(State.IsGrounded && hasWallJumped)
			hasWallJumped = false;
		#endregion
		// ==============================

		// Crouching ====================
		#region Crouching
		if (State.IsGrounded && yDir == -1 && Parameters.crouchProperties.CanCrouch)
			if (GetComponent<Player>())
				Crouch();

		if ( (yDir != -1 || isWallSliding ) && canStand && State.IsCrouching )
		{
			ResetColliderSize();
			RecalculateDistanceBetweenRays();
			ResetPlayerMeshSize();
			State.IsCrouching = false;
		}

		if (State.IsCrouching)					
			_velocity.x *= Parameters.crouchProperties.CrouchMoveSpeed;
		#endregion
		// ==============================

		// Sprinting ====================
		#region Sprinting

		// if the sprint button is being held, and we are allowed to sprint, set isSprinting to true
		if(sprintButton && Parameters.generalMovement.canSprint && !isWallSliding && !State.IsCrouching && !isSprinting)
			isSprinting = true;

		// don't sprint after a wall jump, and if the sprint button isn't down
		if(isSprinting && !sprintButton || hasWallJumped )
			isSprinting = false;

		#endregion
		// ==============================

							
		// will move character as per his velocity, scaled by time. e.g. 5 units to the right is a Velocity of 5x
		// deltaTime is time passed since last frame, usually a very small number, less than one
		Move (Velocity * Time.deltaTime);

		// Implement gravity	
		_velocity.y -= Parameters.generalMovement.Gravity * Time.deltaTime;


		if (State.IsGrounded)
			doubleJump = false;

		if (DropThrough)
			DropThrough = false;

	}

	private void Move(Vector2 deltaMovement)
	{

		wasGroundedLastFrame = State.IsCollidingBelow; // Keep track of if we were grounded
		State.Reset (); // Reset state (set all bools to false and slope to zero)


		if (HandleCollisions) 
		{
			HandlePlatforms();      // will handle moving platforms
			CalculateRayOrigins();  // calculates where our rays will originate from

			if (deltaMovement.y < 0 && wasGroundedLastFrame ) // if moving down/being affected by gravity AND grounded, means we are potentially on a slope
				HandleVerticalSlope(ref deltaMovement); 
				// pass in ref to deltaMovement because it only accepts a ref to Vector2, which needs to be that way because
				// Vector2 is a value type, and HandleVerticalSlope may modify deltaMovement

			// If moving to the left or right, then MoveHorizontally and check for collisions
			// Also want to call it when wall jumping, as our movement will be 0, but we'll want to know if we slide off a wall
			if (Mathf.Abs(deltaMovement.x) > .001f || isWallSliding)		
				MoveHorizontally(ref deltaMovement);

			MoveVertically(ref deltaMovement); // we will always be moving vertically, as gravity will always be acting upon us



			if (detectEdges)EdgeDetect(ref deltaMovement);

			if(State.IsCrouching)
				canStand = CanStand (deltaMovement.x);

			// Call our platform fix method AFTER vertical movement is dealt with
			CorrectHorizontalPlacement(ref deltaMovement, true);
			CorrectHorizontalPlacement(ref deltaMovement, false);
		}

	

		// if we get this far, and collisions have been handled, we know we will be making a valid movement, and transform.Translate will
		// represent the delta of movement we can make in this step (explanation at 24:00 of 3DBuzz "Horizontal Movement" video)
		_transform.Translate (deltaMovement, Space.World); // we are moving the character in the World space


		// however much we successfully changed, we want to consider that our new velocity
		if (Time.deltaTime > 0)
						_velocity = deltaMovement / Time.deltaTime;

		// Clamp velocities to the maximum as defined in our parameters
		_velocity.x = Mathf.Min (_velocity.x, Parameters.generalMovement.MaxVelocity.x);
		_velocity.y = Mathf.Min (_velocity.y, Parameters.generalMovement.MaxVelocity.y);


		// ======================================================
		// ======== MOVE ADJUSTMENTS ============================
		// ======================================================
		#region MOVE ADJUSTMENTS

		// Max fall speed
		if (_velocity.y < Parameters.generalMovement.TerminalVelocity)
						_velocity.y = Parameters.generalMovement.TerminalVelocity;

		// Also apply max velocity when we're going left (making _velocity.x a negative value)
		if(_velocity.x < Parameters.generalMovement.MaxVelocity.x * -1 )	
			_velocity.x = Parameters.generalMovement.MaxVelocity.x * -1;

		// Have the player move slower on a wall
		if ( isWallSliding && wallDropTimer > 0)
		{
			// Ease out of vertical movement
			if (_velocity.y > 0)
				_velocity.y -= Parameters.jumpProperties.WallFriction * .01f;
			else
				_velocity.y *= Parameters.jumpProperties.WallFriction;
		}

		if (State.IsMovingUpSlope)
						_velocity.y = 0;

	    // Set Wall Jump to true if we're not grounded, but colliding on either side
		if (!State.IsGrounded && (State.IsCollidingLeft || State.IsCollidingRight) && Parameters.jumpProperties.canWallJump)
		{
			wallJump = true;
			if (State.IsCollidingLeft)
			{	
				wallSlideLeft = true;
				doubleJump = false;
			}
			if (State.IsCollidingRight)
			{
				wallSlideRight = true;
				doubleJump = false;
			}
		}

		// Platforms
		if (StandingOn != null ) 
		{

			//Store where the platform is
			_activeGlobalPlatformPoint = transform.position;
			_activeLocalPlatformPoint = StandingOn.transform.InverseTransformPoint(transform.position);		

			// From 3DBuzz "Moving Platforms #1" around 18:00
			if(_lastStandingOn != StandingOn) // If we've changed. No longer standing on the thing from previous frame
			{
				if(_lastStandingOn != null)
					_lastStandingOn.SendMessage("ControllerExit2D", this, SendMessageOptions.DontRequireReceiver);

				StandingOn.SendMessage("ControllerEnter2D", this, SendMessageOptions.DontRequireReceiver);
			}
			else if (StandingOn != null)
				StandingOn.SendMessage("ControllerStay2D", this, SendMessageOptions.DontRequireReceiver);
		}
		else if (_lastStandingOn != null)
		{
			_lastStandingOn.SendMessage("ControllerExit2D", this, SendMessageOptions.DontRequireReceiver);
			_lastStandingOn = null;
		}

		// Store the last thing we touched while grounded (using this to deactive double jump while bouncing on Jump Pads, for example)
		if(State.IsGrounded && StandingOn != null)		
			_lastGroundObject = StandingOn;



	#endregion
	
	
	}

	// ========== COLLISIONS =================================================================================================//
	#region COLLISIONS
	private void HandlePlatforms()
	{
	
		if (StandingOn != null)
		{
			// If standing on a platform still (in the next frame), calculate where the platform is, get difference between old and new position 
			// for velocity. 
			var newGlobalPlatformPoint = StandingOn.transform.TransformPoint(_activeLocalPlatformPoint);
			var moveDistance = newGlobalPlatformPoint - _activeGlobalPlatformPoint;

			if (moveDistance != Vector3.zero)
				// Put the player on the platform. Note: if the platform teleports, the player will still be on the platform.
				transform.Translate(moveDistance, Space.World);

			if (Time.deltaTime > 0)
				PlatformVelocity = (newGlobalPlatformPoint - _activeGlobalPlatformPoint) / Time.deltaTime;
		}
		else
			PlatformVelocity = Vector3.zero;

		StandingOn = null;

	}

	private void CorrectHorizontalPlacement(ref Vector2 deltaMovement, bool isRight)
	{	
		// Method to fix when the player moves into the side of a moving platform
		var halfWidth = (_boxCollider.size.x * _localScale.x) / 2f;
		var rayOrigin = isRight ? _raycastBottomRight : _raycastBottomLeft;

		// We don't want the skin width to be taken into account
		if (isRight)
			rayOrigin.x -= (halfWidth - SkinWidth);
		else 
			rayOrigin.x += (halfWidth + SkinWidth);

		var rayDirection = isRight ? Vector2.right : -Vector2.right;
		var offset = 0f;

		for (var i = 1; i < TotalHorizontalRays; i++)
		{
			var rayVector = new Vector2(rayOrigin.x, deltaMovement.y + rayOrigin.y + (i * _verticalDistanceBetweenRays));
			//Debug.DrawRay(rayVector, rayDirection *halfWidth,  isRight ?Color.cyan : Color.magenta);

			var raycastHit = Physics2D.Raycast(rayVector, rayDirection, halfWidth, PlatformMask);
			if(!raycastHit)
				continue;

			offset = isRight ? ((raycastHit.point.x - _transform.position.x) - halfWidth) : (halfWidth - (_transform.position.x -raycastHit.point.x));
		}

		// This is what will actually push the player to the left of right if they're hitting a moving platform
		deltaMovement.x += offset;

	}

	private void CalculateRayOrigins()
	{
		// precomputes where the rays are going to be "shot out" from
		// we need top left, bottom left, and bottom right.
		
		// first we need to determine the size of the box collider, which is size of box collider PLUS scale of player
		// also need center of box collider
		// then need raycast top left (for example), which is Position of player + Center - size (of x) -skin width

		var size = new Vector2 (_boxCollider.size.x * Mathf.Abs (_localScale.x), _boxCollider.size.y * Mathf.Abs (_localScale.y)) /2;
		var center = new Vector2 (_boxCollider.center.x * _localScale.x, _boxCollider.center.y * _localScale.y);

		// Place our raycast origins. Start at the center, move to one side, then up or down. Then move in a bit for Skin Width
		_raycastTopLeft = _transform.position + new Vector3 (center.x - size.x + SkinWidth, center.y + size.y - SkinWidth);
		_raycastBottomRight = _transform.position + new Vector3 (center.x + size.x - SkinWidth, center.y - size.y + SkinWidth);
		_raycastBottomLeft = _transform.position + new Vector3 (center.x - size.x + SkinWidth, center.y - size.y + SkinWidth);	

	}

	private void MoveHorizontally( ref Vector2 deltaMovement) 
	
	{

		// This method will cast rays to right or left, the and constrain movement based on result of that raycast
		// takes reference to deltaMovement because it needs to manipulate it. Needs to clamp deltaMovement based on existence of platform/obstacle
		// in the way of the player
		var isGoingRight = deltaMovement.x > 0; // determine if we're moving right or not
		var rayDistance = Mathf.Abs (deltaMovement.x) + SkinWidth; // the distance of the ray is the movement distance plus the skin width
		var rayDirection = isGoingRight ? Vector2.right : -Vector2.right; // we use -Vector2.right because Vector2 doesn't have a left constant
		var rayOrigin = isGoingRight ? _raycastBottomRight : _raycastBottomLeft; // Will set the ray origin to either bottom right or bottom left based on direction we are moving

		// while wall sliding, only draw one ray at the feet to check for the end of a wall
		if (isWallSliding)
		{
			rayDistance = 0.2f;
			rayDirection = wallSlideRight ? Vector2.right : -Vector2.right;
			rayOrigin = wallSlideRight ? _raycastBottomRight : _raycastBottomLeft;

			var rayVector = new Vector2(rayOrigin.x, rayOrigin.y);
			Debug.DrawRay (rayVector, rayDirection *rayDistance, Color.magenta);

			var raycastHit = Physics2D.Raycast(rayVector, rayDirection, rayDistance, PlatformMask);

			if(!raycastHit)
			{
				ResetWallJump();
			}   
		}


		else
		{

			RaycastHit2D _raycastHit;
			// loop through all of the rays we want to cast. How many? Based on constant we declared
			for (var i = 0; i < TotalHorizontalRays; i++) 
			{
				// each time it loops, the i value increase. First loop is rayOrigin + 0, second loop is rayOrigin + (1 * whatever our distance between rays is set to), etc
				// so each ray is offset by the distance between rays
				var rayVector = new Vector2(rayOrigin.x, rayOrigin.y + (i * _verticalDistanceBetweenRays) );

				// adjust so ray don't lag behind when rising or falling Set a range so they aren't being pushed into the floor while standing
				//if (deltaMovement.y >=0.2f || deltaMovement.y <= -0.1f)
				//	rayVector.y += deltaMovement.y;


				// draw ray in our scene view. draws a ray from our rayVector and our rayDirection, scaled up by our distance
				Debug.DrawRay(rayVector, rayDirection * rayDistance, Color.red); 
				//Debug.Log("ASDF"); // use for debugging, this should show in the console


				// if we are grounded we will include oneWayPlatforms only on the first ray (the bottom one). this will allow us to
				// walk up sloped oneWayPlatforms
				if( i == 0 && wasGroundedLastFrame )
					_raycastHit = Physics2D.Raycast(rayVector, rayDirection, rayDistance, PlatformMask);
				else
					_raycastHit = Physics2D.Raycast( rayVector, rayDirection, rayDistance, PlatformMask & ~oneWayPlatformMask );


				/* Collisions without before OneWayPlatformMask implementation

				// Using Physics2D (NOT just Physics -which operates in 3D space), determine if there is a collision 
				// based on our PlatformMask layer
				//var raycastHit = Physics2D.Raycast(rayVector, rayDirection, rayDistance, PlatformMask);

				 */
					
				// If no hit is detected, continue
				if(!_raycastHit)
				{
					// Must force collision states off, because we force them on while wall jumping. If we don't force them off
					// they will stay on if we slide off a wall instead of jumping off of it
					State.IsCollidingLeft = false;
					State.IsCollidingRight = false;
					continue;
				}

				// if we're on the first iteration, and we're on a slope... break or something. The Vector2 stuff gives us the angle between the slope
				// and the raycast
				if (i == 0 && HandleHorizontalSlope(ref deltaMovement, Vector2.Angle(_raycastHit.normal, Vector2.up), isGoingRight))
					break;

				// this does the actual constraining. If we hit something, then we can only move that far forward
				deltaMovement.x = _raycastHit.point.x - rayVector.x;
				rayDistance = Mathf.Abs (deltaMovement.x);

				if (isGoingRight || State.IsCollidingRight)
				{
					deltaMovement.x -= SkinWidth;
					State.IsCollidingRight = true;
				}
				else
				{
					deltaMovement.x += SkinWidth;
					State.IsCollidingLeft = true;
				}

				// If this happens, something went wrong
				if (rayDistance < SkinWidth + .001f)
					break;

			}
		}

	}

	private void MoveVertically(ref Vector2 deltaMovement)

	{
		// Invoked every frame, because of gravity. Different from Horizontal movement
		var isGoingUp = deltaMovement.y > 0;
		var rayDistance = Mathf.Abs (deltaMovement.y) + SkinWidth;
		var rayDirection = isGoingUp ? Vector2.up : -Vector2.up;
		var rayOrigin = isGoingUp ? _raycastTopLeft : _raycastBottomLeft;

		rayOrigin.x += deltaMovement.x;

		var standingOnDistance = float.MaxValue;

		// Ignore the oneWayPlatformMask if we're moving upwards, or if we are crouched and press jump
		var mask = PlatformMask;
		if (isGoingUp && StandingOn == null || (State.IsCrouching && DropThrough)) 
		{
			mask &= ~oneWayPlatformMask;
		}
	



		for (var i = 0; i < TotalVerticalRays; i ++)
		{
			var rayVector = new Vector2(rayOrigin.x + (i * _horizontalDistanceBetweenRays), rayOrigin.y);
			Debug.DrawRay(rayVector, rayDirection * rayDistance, Color.red);

			var raycastHit = Physics2D.Raycast(rayVector, rayDirection, rayDistance, mask);
		
			// **** Break the loop here if we're not hitting anything ****
			if (!raycastHit)
				continue;

			// we need to keep track of what we're standing on, so we know if we're on a moving platform
			if (!isGoingUp)
			{
				var verticalDistanceToHit = _transform.position.y - raycastHit.point.y;
				if (verticalDistanceToHit < standingOnDistance)
				{
					standingOnDistance = verticalDistanceToHit;
					StandingOn = raycastHit.collider.gameObject;
				}

			}

			// pretty much mirrors what we did with move horizontally
			// determine the farthest distance we can move vertically without hitting an obstacle
			deltaMovement.y = raycastHit.point.y - rayVector.y; 

			// since we're casting multiple rays, we only need to worry about casting another ray
			// that is the furtherst away from an object that we previously hit
			rayDistance = Mathf.Abs(deltaMovement.y);

			if(isGoingUp)
			{
				deltaMovement.y -= SkinWidth;
				// we are hitting something above
				State.IsCollidingAbove = true;
			}
			else
			{
				deltaMovement.y += SkinWidth;
				// we are hitting something below
				State.IsCollidingBelow = true;

			}

			// Specific to slopes. If we're not going up, and our deltamove is more than .0001, that means
			// we're moving up a slope
			if (!isGoingUp && deltaMovement.y > .0001f)
				State.IsMovingUpSlope = true;

			if(rayDistance < SkinWidth + .0001f)
				break;
 		}

	}

	private void EdgeDetect(ref Vector2 deltaMovement)
	{
		// My attempt of trying to give the player some jump leniency. Two raycasts being shot down on either side of the player 
		// to detect ground. If they detect ground, the player can jump. It doesn't really seem to work right now for two reasons:
		// 1) The player is not jumping very high when falling towards the ground and entering EdgeDetect range. Ideally this should reset the double 
		// jump and use original jump magnitude, as if the player had touched the ground
		// 2) As the player moves off of an edge, the raycasts follow, so it doesn't not allow for a very big window. Cast rays from higher up/different location?
		//
		// This could/should still be modified to work with enemy AI that is not meant to drop off of ledges

		var rayDistance = 2.0f;
		var rayDirection = -Vector2.up;

		var center = (_raycastBottomLeft.x + _raycastBottomRight.x) / 2;
		var rayVector = new Vector2 (center + deltaMovement.x + Parameters.generalMovement.edgeDetectDistance, _raycastBottomLeft.y + deltaMovement.y);


		for (var i = 0; i < 2; i++)
		{
			if (i == 1)
				rayVector.x -= Parameters.generalMovement.edgeDetectDistance *2;
			Debug.DrawRay (rayVector, rayDirection * rayDistance, Color.magenta);

			var rayCastHit = Physics2D.Raycast(rayVector, rayDirection, rayDistance, PlatformMask);

			if(rayCastHit)
			{
				_groundDetected = true;

				if(i == 0) State.EdgeDetectedRight = false;
				if(i == 1) State.EdgeDetectedLeft = false;
			}
		

			if(!rayCastHit)
			{
				_groundDetected = false;
				if(i == 0) State.EdgeDetectedRight = true;
				if(i == 1) State.EdgeDetectedLeft = true;
				
			}
		}

	}

	

	private void HandleVerticalSlope(ref Vector2 deltaMovement)
	{
		// This is only invoked when we are going down and also grounded. The ray will only be casted while on the floor
		// and will be used the get the angle between itself and the normal of the surface we are standing on
		// (or the point of where the raycast hits)

		var center = (_raycastBottomLeft.x + _raycastBottomRight.x) / 2; // Gives us the center of where we're casting our rays
		var direction = -Vector2.up; // Down

		var slopeDistance = SlopeLimitTangent * (_raycastBottomRight.x - center);
		var slopeRayVector = new Vector2 (center + deltaMovement.x, _raycastBottomLeft.y);

		Debug.DrawRay (slopeRayVector , direction * slopeDistance, Color.yellow);
		var rayCastHit = Physics2D.Raycast (slopeRayVector, direction, slopeDistance, PlatformMask);

		if (!rayCastHit) // if we don't hit anything, exit the method
			return;

		// Get the angle between the normal of the rayCastHit and the up vector. Make sure it's not 0
		// If it is, that means we're standing on something we're perpindicular to (flat ground, not a slope)
		// The Mathf.Sign method returns a 1 if the number is positive, -1 if the number is negative, 0 if value is 0
		var isMovingDownSlope = Mathf.Sign(rayCastHit.normal.x) == Mathf.Sign(deltaMovement.x);	
		if (!isMovingDownSlope) // if we're not moving down slope, exit method
			return;

		var angle = Vector2.Angle (rayCastHit.normal, Vector2.up);
		if (Mathf.Abs(angle) < .0001f)
			return;

		State.IsMovingDownSlope = true; // mark that we're moving down slope
		State.SlopeAngle = angle;       // store the angle

		deltaMovement.y = rayCastHit.point.y - slopeRayVector.y;

	
	}

	private bool HandleHorizontalSlope (ref Vector2 deltaMovement, float angle, bool isGoingRight)
	{
		if (Mathf.RoundToInt (angle) == 90)
						return false; // obvioulsy we don't want to move up 90 "slopes"

		// if the slope is steeper than our limit, stop moving on x and return true
		if (angle > Parameters.generalMovement.SlopeLimit)
		{
			deltaMovement.x = 0;
				return true;
		}

		if (deltaMovement.y > .01) // if we're moving up-ish
			return true;

		deltaMovement.x += isGoingRight ? -SkinWidth : SkinWidth;
	
		// modify vertical movement based on the angle of the slope we're moving up
		deltaMovement.y = Mathf.Abs(Mathf.Tan(angle * Mathf.Deg2Rad) * deltaMovement.x);

		State.IsMovingUpSlope = true;
		State.IsCollidingBelow = true;
		return true;

	}

	public bool CanStand(float deltaMovementX)
	{
		// Used to check if there's anything above us while crouching
		
		var rayDistance = 1f;
		var rayDirection = Vector2.up;
		var rayOrigin = _raycastTopLeft;
		
		for ( var i = 0; i < TotalVerticalRays; i++)
		{
			
			// Cast rays
			var rayVector = new Vector2(deltaMovementX + rayOrigin.x + (i * _horizontalDistanceBetweenRays), rayOrigin.y);
			Debug.DrawRay (rayVector, rayDirection * rayDistance, Color.yellow);
			var rayCastHit = Physics2D.Raycast (rayVector, rayDirection, rayDistance, PlatformMask);
			
			// There's something above us, we can't stand
			if (rayCastHit) 
				return false;
		}
		
		// If we got this far, that means we can stand!
		return true;
	}

	#endregion
	//========================================================================================================================//

	//=========== TRIGGERS ===================================================================================================//
	#region TRIGGERS
	// Used for when player enters a special 2d space where the controls might vary
	// This is a Unity function
	public void OnTriggerEnter2D (Collider2D other) 
	{
		var parameters = other.gameObject.GetComponent<ControllerPhysicsVolume2D> ();

		// if parameters is nothing, exit
		if (parameters == null)
			return;

		// If our override parameters are set, we will use them
		_overrideParameters = parameters.Parameters;
	}

	// used for when player exits a special 2d space where the controls might vary
	public void OnTriggerExit2D (Collider2D other) 
	{
		var parameters = other.gameObject.GetComponent<ControllerPhysicsVolume2D> ();
		
		// if parameters is nothing, exit
		if (parameters == null)
			return;

		_overrideParameters = null;

	}
	#endregion
	//========================================================================================================================//

	//========================================================================================================================//
	//============ TOOL BOX ==================================================================================================//
	//========================================================================================================================//
	#region TOOLBOX

	public int XInputDir()
	{
		// Check to see which horizontal input is being pressed, if any

		if(Input.GetAxisRaw("Horizontal") <= -0.5 || Input.GetKey(KeyCode.A) || Input.GetKey(KeyCode.LeftArrow))
			return -1;

		else if (Input.GetAxisRaw ("Horizontal") >= 0.5 || Input.GetKey (KeyCode.D) || Input.GetKey (KeyCode.RightArrow))
			return 1;

		return 0;
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


	public void RecalculateDistanceBetweenRays()
	{
		// Every time we change the size of the box collider, we need to do this math again

		// Raycasting math? Need to watch 3DBuzz "Horizontal Movement" video again around 15:00 to understand this
		var colliderWidth = _boxCollider.size.x * Mathf.Abs (transform.localScale.x) - (2 * SkinWidth);
		_horizontalDistanceBetweenRays = colliderWidth / (TotalVerticalRays - 1);
		
		var colliderHeight = _boxCollider.size.y * Mathf.Abs (transform.localScale.y) - (2 * SkinWidth);
		_verticalDistanceBetweenRays = colliderHeight / (TotalHorizontalRays - 1);

	}

	public void ResetColliderSize()
	{
		// Set the player's box collider back to whatever it was at level start

		_boxCollider.center = boxColliderOriginalCenter;
		_boxCollider.size = boxColliderOriginalSize;
	}

	public void ResetPlayerMeshSize()
	{
		// Reset the mesh size of the capsule. I'm just using this for now as a quick and dirty way to make the prototype capsule 
		// "stand up" from its "crouch" size

		GameObject player = GameObject.Find("Capsule");
		player.transform.localScale = new Vector3(2.7f, 2.7f, 1.4f);
		player.transform.localPosition = new Vector3(player.transform.localPosition.x, -0.06f, player.transform.localPosition.z);
	}

	private void ResetWallJump()
	{
		// Set all wall jump variables to their default state

		wallJump = false;
		wallSlideLeft = false;
		wallSlideRight = false;
		wallDropTimer = wallDropTimerReset;
		
	}

	public void ResetLastGround()
	{
		_lastGroundObject = null;
	}

	public void ResetParameters()
	{
		_overrideParameters = null;
	}


	#endregion
	//========================================================================================================================//
	//========================================================================================================================//


}
