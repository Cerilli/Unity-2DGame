
using UnityEngine;
using System;
using System.Collections;

// Marking class as Serializable means you are able to modify it in the inspector if you have a public field on another mono field of this type
[Serializable] 

// no need to extend Mono
public class ControllerParameters2D 
{
	public Permissions    	permissions;
	public GeneralMovement	generalMovement;
	public JumpProperties 	jumpProperties;
	public CrouchProperties crouchProperties;
	public DashProperties 	dashProperties;


	public enum JumpBehaviour
	{
		CanJumpOnGround,
		CanJumpAnywhere,
		CantJump
	}
	[Serializable]
	public class Permissions
	{
		public bool sprintEnabled = 				true;
		public bool jumpEnabled = 					true;
		public bool doubleJumpEnabled = 			true;
		public bool crouchEnabled = 				true;
		public bool crouchMovementEnabled = 		true;
		public bool doubleJumpWhileCrouchedEnabled= true;
		public bool wallJumpEnabled = 			    true;
		public bool doubleJumpOffWallEnabled = 		true;	
		public bool dashEnabled =             		true;
		public bool slamEnabled =	 				true;
	}
	[Serializable]
	public class GeneralMovement
	{
		[HideInInspector]
		public Vector2 MaxVelocity = new Vector2(float.MaxValue, float.MaxValue);
		public float   TerminalVelocity = 		-60f;
		public float Gravity = 				  	 60f;		// Every second, this many units are going to be applied to the Y direction
		public float AccelerationOnGround =  	 10f; 		// How quickly the player goes from still to moving
		public float AccelerationInAir =	 	  5f;		 
		[Range(0, 99)]
		public float SlopeLimit = 	    		 30f;		// The angle that we're allowed to climb.
		public float WalkSpeed =                 14f;

		public float SprintSpeed =	    		 20f;
		public bool DetectEdges = 				true;
		[Tooltip ("How far out the edge detecting raycasts will be from the center of the character")]
		public float edgeDetectDistance =       3.0f;
		public float LadderClimbSpeed = 		8.0f;
		[Tooltip ("A curve that multiplies the character speed based on the angle of the slope they are on")]
		public AnimationCurve slopeSpeedMultiplier = new AnimationCurve( new Keyframe( -90, 1f ), new Keyframe( 0, 1f ), new Keyframe( 90, 1.5f) );
	}

	[Serializable]
	public class JumpProperties 
	{	


				
		public JumpBehaviour JumpRestrictions;				// Use our enum 
		public float JumpFrequency =		    .25f;		// Limit how often the player can jump
		public float JumpMagnitude = 			 55f;		// How much force added to y velocity when you jump
		public float MinJumpMagnitude = 		 10f;

		[Tooltip ("How many frames the player can still jump for after walking off a ledge")]
		public int JumpLenienceFrames =			   4;

		public float doubleJumpMagnitude =		 40f;		// How much force for the double jump
		public float CrouchJumpHeight = 		  5f;

		[Tooltip ("How long the character will be stuck to the wall if the player isn't pushing towards the wall")]
		public float wallDropTimer = 			0.2f;       // How long the player clings to the wall after letting go of button

		[Tooltip ("Multiplies vertical velocity while wall sliding")]
		public float WallFriction = 		    0.8f;

		[Tooltip ("Multiplies jump magnitude when wall jumping")]
		public float WallJumpOut = 			    0.8f;



	}

	[Serializable]
	public class DashProperties
	{	
		[Tooltip ("Whether or not the character is able to slam into the ground while in the air")]
		public float DashForce = 	           	5f;

		public float DashDuration= 				.15f;
		public float DashCooldown = 			1f;

		[Tooltip ("How quicly the character slams into the ground")]
		public float DownDashForce=             1.2f;
	}

	[Serializable]
	public class CrouchProperties
	{
		[Tooltip ("Causes the character to decelerate from their current speed when they crouch")]
		public bool SlideToCrouch = 			true;			
		public float CrouchMoveSpeed = 			0.8f;		// Multiplier for movement while crouching				
	}	
}