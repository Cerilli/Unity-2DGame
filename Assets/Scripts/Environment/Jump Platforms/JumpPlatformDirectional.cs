using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class JumpPlatformDirectional : MonoBehaviour
{

	public bool disableController;
	public AudioClip HitJumpPadSound;
	public GameObject MarkerFlag;
	public float BounceMagnitude = 40f;
	[Range (1, 179)]
	public float BounceAngle = 45f;

	public bool DEBUGshowArc = false;
	private float _compareMagnitude;
	private float _compareAngle;
	private Vector2 _landingPosition;
	private Vector2 _highestPoint;
	private float _launchAngle; 

	private LineRenderer _lineRenderer;

	private Vector2 _qrtrTime;
	private Vector2 _3qrtrTime;


	void Awake()
	{
		_compareMagnitude = 0f;
		_compareAngle = 0f;
		_launchAngle = BounceAngle * Mathf.Deg2Rad;	

		CalculateTrajectory(2.5f);
	}

	void Update()
	{
		if (DEBUGshowArc)
		{			
			// The idea is that I want to show the arc in the editor. Still WIP
			if (BounceMagnitude != _compareMagnitude || BounceAngle != _compareAngle)
			{
				// NEED TO IMPLEMENT PLAYER GRAVITY, NOT STATIC NUMBER
				CalculateTrajectory(2.5f);
				_compareMagnitude = BounceMagnitude;
				_compareAngle = BounceAngle;	
			}

			if(_lineRenderer == null)
				_lineRenderer = GetComponent<LineRenderer>();

			_lineRenderer.enabled = true;

			// WILL USE LOOP AND ARRAY LATER, just figuring it out for now
			_lineRenderer.SetVertexCount(5);
			_lineRenderer.SetPosition(0, transform.position);
			_lineRenderer.SetPosition(1, _qrtrTime);
			_lineRenderer.SetPosition(2, _highestPoint);
			_lineRenderer.SetPosition(3, _3qrtrTime);
			_lineRenderer.SetPosition(4, _landingPosition);
		}
		if (!DEBUGshowArc && _lineRenderer != null)
			_lineRenderer.enabled = false;
	}

	public void ControllerEnter2D(CharacterController2D controller)
	{
		// Get the angle based on the JumppadAim transform);
		var launchAngle = BounceAngle * Mathf.Deg2Rad;	
		//var grav = (controller.Parameters.generalMovement.Gravity * Time.deltaTime);

		// Used to determine the required magnitude on each axis
		var XInitial = BounceMagnitude * Mathf.Cos(launchAngle) ;
		var YInitial = BounceMagnitude * Mathf.Sin(launchAngle) ;

		// Find total time in air
		//var t = ((2 * YInitial) / grav) * Time.deltaTime;

		if ( HitJumpPadSound != null)
			AudioSource.PlayClipAtPoint(HitJumpPadSound, transform.position);

		// Disable controller until we hit the ground, if desired. It is switched back on
		// in the Player script, when the player hits ground again
		if(disableController)
		{
			controller.State.CanMoveFreely = false;
			controller.State.IsJumpPadTraveling = true;
			controller.State.JumpPadDisabledControlsTimer = 0.02f;
		}

		controller.SetForce(new Vector2(XInitial, YInitial));                                           
	}

	private void CalculateTrajectory(float grav)
	{
		var launchAngle = BounceAngle * Mathf.Deg2Rad;	
		var YInitial = BounceMagnitude * Mathf.Sin(launchAngle) ;
		var XInitial = BounceMagnitude * Mathf.Cos(launchAngle) ;
		var t = ((2 * YInitial) / grav) * Time.deltaTime;

		float landingDistance = (Mathf.Pow(BounceMagnitude,2) * Mathf.Sin(launchAngle*2) / grav) * Time.deltaTime;
		float maxHeight = (Mathf.Pow (YInitial,2) / (2*grav)) * Time.deltaTime;
				
		// Temporarily place a landing marker at the calculated destination. This is just for testing purposes
		var landingPosition = new Vector2( transform.position.x + landingDistance, transform.position.y);
		var highestPoint = new Vector2((transform.position.x + landingDistance/2), maxHeight + transform.position.y );

		// HACKY TEST METHOD =====
		float qrtrTimeHeight = maxHeight * .75f;
		_qrtrTime = new Vector2((transform.position.x + landingDistance*.25f), qrtrTimeHeight + transform.position.y);
		_3qrtrTime = new Vector2((transform.position.x + landingDistance*.75f), qrtrTimeHeight + transform.position.y);
		// =======================

		_landingPosition = landingPosition;
		_highestPoint = highestPoint;
		_launchAngle = launchAngle;
	}
}

