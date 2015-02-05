
using UnityEngine;
using System;
using System.Collections;

// Marking class as Serializable means you are able to modify it in the inspector if you have a public field on another mono field of this type
[Serializable] 

// no need to extend Mono
public class ControllerParameters2D 
{
	public GeneralMovement generalMovement;
	public JumpProperties jumpProperties;
	public CrouchProperties crouchProperties;

	public enum JumpBehaviour
	{
		CanJumpOnGround,
		CanJumpAnywhere,
		CantJump
	}

	[Serializable]
	public class GeneralMovement
	{
		[HideInInspector]
		public Vector2 MaxVelocity = new Vector2(float.MaxValue, float.MaxValue);
		public float   TerminalVelocity = 		-60f;
		public float Gravity = 				  	 60f;		// Every second, this many units are going to be applied to the Y direction
		public float AccelerationOnGround = 10f; 				// How quickly the player goes from still to moving
		public float AccelerationInAir		= 5f;
		 
		[Range(0, 99)]
		public float SlopeLimit = 				 30f;		// The angle that we're allowed to climb. It will be set to 30, but will show up in the inspector as a slider with the range 0-99
		public float WalkSpeed =                14f;
		public bool canSprint = 				true;
		public float SprintSpeed =	    		20f;
		public bool DetectEdges = 				true;
		public float edgeDetectDistance =       3.0f;
	}

	[Serializable]
	public class JumpProperties 
	{	
		public bool canDoubleJump = 			true;
		public bool canDoubleJumpWhileCrouched= true;
		public bool canWallJump = 			    true;
		public bool canDoubleJumpOffWall = 		true;
		public bool canVariableHeightJump =     true;
		public float WallFriction = 		    0.8f;
		public float WallJumpOut = 			    0.8f;	
		public JumpBehaviour JumpRestrictions;				// Use our enum 
		public float JumpFrequency =		    .25f;		// Limit how often the player can jump
		public float JumpMagnitude = 			 55f;		// How much force added to y velocity when you jump
		public float JumpHeightTimer= 			0.2f;
		public float doubleJumpMagnitude =		 40f;		// How much force for the double jump
		public float doubleJumpTimer = 			0.2f;
		public float wallDropTimer = 			0.2f;       // How long the player clings to the wall after letting go of button
		//public float LowJumpModifier = 		 	 .2f;		// multiply jump height by this value when jump button is tapped instead of held
	}

	[Serializable]
	public class CrouchProperties
	{
		public bool CanCrouch = 				true;
		public float CrouchJumpModifier = 		0.5f;		// Multiplier for jump height while crouching
		public float CrouchMoveSpeed = 			0.8f;		// Multiplier for movement while crouching				
	}	
}