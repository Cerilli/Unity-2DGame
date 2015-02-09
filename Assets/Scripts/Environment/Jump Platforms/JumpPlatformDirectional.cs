using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class JumpPlatformDirectional : MonoBehaviour
{
	public bool disableController;
	public float BounceMagnitude = 40f;
	[Range (1, 179)]
	public float BounceAngle = 45f;
	public bool DEBUGshowArc = false;
	public Color trajectoryColor = Color.green;
	private float _playerGravity;

	public AudioClip HitJumpPadSound;

	void Awake()
	{		 
		_playerGravity = GameObject.FindGameObjectWithTag("Player").GetComponent<Player>().GetGravity();
	}

	public void ControllerEnter2D(CharacterController2D controller)
	{	
		// Determine the required velocity on each axis
		var initialVelocity = GetInitialVelocity();

		// Disable controller until we hit the ground, if desired. It is switched back on
		// in Player.LateUpdate(), when the player hits ground again
		if(disableController)
		{
			controller.State.CanMoveFreely = false;
			controller.State.IsJumpPadTraveling = true;

			// Ignore one way platforms, they tend to interrupt the trajectory.
			// They are re-enabled in Player.LateUpdate()
			Physics2D.IgnoreLayerCollision(12, 10, true);

			// Set a brief timer that is used ignore ground checks after being launched
			controller.State.JumpPadDisabledControlsTimer = 0.02f;
		}

		controller.SetForce(initialVelocity);                                           

		if ( HitJumpPadSound != null)
			AudioSource.PlayClipAtPoint(HitJumpPadSound, transform.position);
	}

	private Vector2 GetInitialVelocity()
	{
		var launchAngle = 	BounceAngle * Mathf.Deg2Rad;
		var XInitial = BounceMagnitude * Mathf.Cos(launchAngle) ;
		var YInitial = BounceMagnitude * Mathf.Sin(launchAngle) ;
		return new Vector2(XInitial, YInitial);             
	}

	private void OnDrawGizmos()
	{
		if (DEBUGshowArc)
			DrawTrajectory();
	}

	private void DrawTrajectory()
	{
		// Draw line method/equation from "Propulsion Physics" on Asset Store

		var velocity = GetInitialVelocity();
		int drawSteps = (int)(velocity.magnitude - 0.5f);

		float deltaTime = 0;	;
		// deltaTime will fluctuate in game, so I can't use a constant
		// However, this causes the lines to flicker. Might need to find 
		// a better solution
		if (Application.isPlaying ) 
			deltaTime = Time.deltaTime;	
		else 
			deltaTime = 0.02f; // estimate that Time.deltaTime will usually be around .02f

		// Get the player Gravity
		Player player = GameObject.FindGameObjectWithTag("Player").GetComponent<Player>();
		_playerGravity = player.GetGravity();
		Vector2 grav = new Vector2(0, -_playerGravity);

		Vector2 currentPosition = new Vector2(transform.position.x, transform.position.y);
		Vector2 previousPosition = currentPosition;
		Gizmos.color = trajectoryColor;

		for (int i = 0; i < drawSteps; i++)
		{
			currentPosition += (velocity * deltaTime) + (0.5f * grav * deltaTime *deltaTime);
			velocity += grav * deltaTime;
			Gizmos.DrawLine(previousPosition, currentPosition);			

			previousPosition = currentPosition;
		}
	}

	private void CalculateRange(float grav)
	{
		/*
		//Find the landing point. This was the first thing I did, probably won't end up using it
		var launchAngle = BounceAngle * Mathf.Deg2Rad;	
		var YInitial = BounceMagnitude * Mathf.Sin(launchAngle) ;
		var XInitial = BounceMagnitude * Mathf.Cos(launchAngle) ;
		//var t = ((2 * YInitial) / grav) * Time.deltaTime;
		float landingDistance = (Mathf.Pow(BounceMagnitude,2) * Mathf.Sin(launchAngle*2) / grav) * Time.deltaTime;
		float maxHeight = (Mathf.Pow (YInitial,2) / (2*grav)) * Time.deltaTime;				
		// Temporarily place a landing marker at the calculated destination. This is just for testing purposes
		var landingPosition = new Vector2( transform.position.x + landingDistance, transform.position.y);
		var highestPoint = new Vector2((transform.position.x + landingDistance/2), maxHeight + transform.position.y );

		 */
	}
}

