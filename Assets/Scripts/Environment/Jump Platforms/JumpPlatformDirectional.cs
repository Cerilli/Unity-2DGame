using UnityEngine;
using System.Collections;

public class JumpPlatformDirectional : MonoBehaviour
{

	public bool disableController;
	public float disableControllerTimer;
	public AudioClip HitJumpPadSound;
	public Transform jumpPadAim;

	private CharacterController2D _playerController;


	public void ControllerEnter2D(CharacterController2D controller)
	{

		if ( HitJumpPadSound != null)
			AudioSource.PlayClipAtPoint(HitJumpPadSound, transform.position);

		if(disableController)
			StartCoroutine(DisableController(controller));

		// Set the direction that the player will be launched, based on the difference between the jump pad target and the jump pad's location
		var bounceDirection = new Vector2( jumpPadAim.position.x - transform.position.x, jumpPadAim.position.y -transform.position.y);
	
		// The force of the jump pad depends on how far away the target is from the jump pad
		var magnitude = Vector2.Distance(transform.position, jumpPadAim.position);

		controller.SetForce(bounceDirection * magnitude);

	}

	public void OnDrawGizmos()
	{
		Debug.DrawLine(transform.position, jumpPadAim.position, Color.blue);
	}

	public IEnumerator DisableController(CharacterController2D playerController)
	{
		var player = playerController.GetComponent<Player>();
//		playerController.sprintButton = false;	
		player.ResetInput();
		player.doHandleInput = false;
		yield return new WaitForSeconds(disableControllerTimer);
		player.doHandleInput = true;
	}
}

