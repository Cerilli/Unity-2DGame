using UnityEngine;
using System.Collections;

public class JumpPlatform : MonoBehaviour 
{
	public float LittleJumpMagnitude = 20;
	public float BigJumpMagnitude = 50;

	public AudioClip HitJumpPadSound;

	public void ControllerEnter2D(CharacterController2D controller)
	{

		if ( HitJumpPadSound != null)
			AudioSource.PlayClipAtPoint(HitJumpPadSound, transform.position);

		var player = controller.GetComponent<Player>();
		if (player != null)
		{
			if (player.JumpButton())
			{
				controller.SetVerticalForce(BigJumpMagnitude);
				controller.State.IsBouncingOnJumpPad = false;
				return;
			}
		}

		controller.State.IsBouncingOnJumpPad = true;
		controller.SetVerticalForce (LittleJumpMagnitude);
	}
}
