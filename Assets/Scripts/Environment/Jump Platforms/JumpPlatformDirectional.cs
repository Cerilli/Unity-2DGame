using UnityEngine;
using System.Collections;

public class JumpPlatformDirectional : MonoBehaviour
{

	public bool disableController;
	//public float disableControllerTimer;
	public AudioClip HitJumpPadSound;
	public Transform jumpPadAim;
	public GameObject MarkerFlag;

	private CharacterController2D _playerController;

	public void ControllerEnter2D(CharacterController2D controller)
	{
		// An attempt to make a jump pad which launches the player in/to a specified location. Still very WIP
		// So far, if you place the jumpAim object directly above the jump pad (90 degree angle)
		// the player will bounce exactly that high. Ultimately, I would like to have a gizmo that you can place in the scene
		// which will be the landing point of the player when "launched", and some sort of visual representation of the trajectory
		// in the scene view (not game view)


		var finalHeight = (jumpPadAim.position.y - transform.position.y);
		var grav = 2.5f;  //(controller.Parameters.generalMovement.Gravity * Time.deltaTime);

		// Get the angle 
		var launchAngle = Mathf.Atan2(finalHeight, (jumpPadAim.position.x - transform.position.x));

		// Used to determine the required magnitude on each axis
		var scale_x = Mathf.Cos(launchAngle) ;
		var scale_y = Mathf.Sin(launchAngle) ;

		var magAdjust = grav*3.15f; // I don't know what I'm doing with math, but multiplaying the "magnitude" equation by this amount makes it work properly
		var magnitude = Mathf.Sqrt(( 2* (grav * finalHeight) )) * magAdjust; // physics equation I looked up
	
		// SOLUTION? My gravity value is proprotionally approx. 1/4 of 9.81m/s, 
		// so adjust magnitude to reflect that and not get massive numbers as a result
		// I guess basically the magnitude and grav values aren't directly proportional
		magAdjust = magnitude/4; 




		// Find the landing distance
		var sintheta = (2 * (Mathf.Sin(launchAngle) * Mathf.Cos(launchAngle)));
		float landingDistance = ( Mathf.Pow(magAdjust,2) / grav) * sintheta;

		//Debug.Log("Landing Dist: " + landingDistance);

		var landingPosition = new Vector2( landingDistance, transform.position.y);

		// Temporarily place a landing marker at the calculated destination. This is just for testing purposes
		StartCoroutine(LandingMarker(landingPosition));

		if ( HitJumpPadSound != null)
			AudioSource.PlayClipAtPoint(HitJumpPadSound, transform.position);

		// Disable controller until we hit the ground, if desired.
		if(disableController)
		{
			controller.State.CanMoveFreely = false;
			controller.State.IsJumpPadTraveling = true;
			controller.State.JumpPadDisabledControlsTimer = 0.02f;
		}

		controller.SetVerticalForce(magnitude * scale_y);
		if(jumpPadAim.transform.position.x - transform.position.x < 0)
			controller.SetHorizontalForce(magnitude*-1);
		else 
			controller.SetHorizontalForce(magnitude * scale_x);                                            
	}

	public void OnDrawGizmos()
	{
		Debug.DrawLine(transform.position, jumpPadAim.position, Color.blue);
	}

	public IEnumerator LandingMarker(Vector2 landingSpot)
	{
		if(MarkerFlag != null)
		{
			var flag = Instantiate(MarkerFlag, landingSpot, transform.rotation);
			yield return new WaitForSeconds(5f);
			Destroy(flag);
		}
	}

}

