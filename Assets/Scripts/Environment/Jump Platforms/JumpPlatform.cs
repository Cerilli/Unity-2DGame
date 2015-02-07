using UnityEngine;
using System.Collections;

public class JumpPlatform : MonoBehaviour 
{
	public float LittleJumpMagnitude = 20;
	public float BigJumpMagnitude = 50;
	public GameObject BoostEffect;
	public Transform emitPos;

	public AudioClip HitJumpPadSound;

	public void ControllerEnter2D(CharacterController2D controller)
	{

		if ( HitJumpPadSound != null)
			AudioSource.PlayClipAtPoint(HitJumpPadSound, transform.position);

		var player = controller.GetComponent<Player>();
		if (player != null)
		{
			if(controller.State.IsDiving || player.JumpButton ())
			{
				controller.SetVerticalForce(BigJumpMagnitude);
				controller.State.IsBouncingOnJumpPad = false;
				if(BoostEffect != null && emitPos != null)
					Instantiate (BoostEffect, emitPos.position, emitPos.rotation);
				return;
			}
	
		}

		controller.State.IsBouncingOnJumpPad = true;
		controller.SetVerticalForce (LittleJumpMagnitude);
	}
}
