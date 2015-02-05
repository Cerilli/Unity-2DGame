﻿using UnityEngine;
using System.Collections;

// ControllerState2D keeps track of the state of the controller ...duh

public class ControllerState2D {

	public bool IsCollidingRight { get; set; }
	public bool IsCollidingLeft { get; set; }
	public bool IsCollidingAbove{ get; set; }
	public bool IsCollidingBelow { get; set; }
	public bool IsMovingDownSlope { get; set; }
	public bool IsMovingUpSlope { get; set; }
	public bool IsBouncingOnJumpPad { get; set; }
	public bool IsSprinting {get; set;}
	public bool IsCrouching {get; set;}
	public bool IsJumping { get; set;}
	public bool IsSlidingDownHill {get; set;}
	public bool IsGrounded { get {return IsCollidingBelow;} }

	public bool WallSlideRight{ get; set; }
	public bool WallSlideLeft { get; set; }
	public bool HasWallJumped { get; set; }


	public bool CanMoveFreely {get; set; }
	public bool AbleToStand {get; set;}
	public bool EdgeDetectedRight {get; set;}
	public bool EdgeDetectedLeft {get; set;}

	public float SlopeAngle { get; set; }
	
	public bool HasCollisions {get{return IsCollidingRight || IsCollidingLeft || IsCollidingAbove || IsCollidingBelow; } }

	public void Reset()
	{
		IsMovingUpSlope = 
			IsMovingDownSlope = 
			IsCollidingLeft =
			IsCollidingRight = 
			IsCollidingAbove =
			IsCollidingBelow = 
			IsSprinting =
			IsBouncingOnJumpPad = 
			HasWallJumped =       false;

		AbleToStand = 
			CanMoveFreely = true;

			

		SlopeAngle = 0; 
	}

	// Create a collision-state to string member
	public override string ToString ()
	{
		return string.Format(
			"(controller: r:{0} l:{1} a:{2} b:{3} down-slope{4} up-slope {5} angle: {6})",
				 IsCollidingRight,
				 IsCollidingLeft,
	             IsCollidingAbove,
	             IsCollidingBelow,
	             IsMovingDownSlope,
	             IsMovingUpSlope,
	             SlopeAngle);
	}

}