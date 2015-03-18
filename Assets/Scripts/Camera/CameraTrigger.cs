using UnityEngine;
using System.Collections;

public class CameraTrigger : MonoBehaviour
{

	public CameraController cameraController;

	public bool lockFollowY;
	public float YPositionOffset;

	public bool lockFollowX;
	public float XPositionOffset;

	public bool adjustZoom;
	public float zoomOverride;

	public bool cameraFollowYOnExit;
	public Vector2 cameraSmoothOverride;

	public bool ignoreBounds;

	private Vector2 _originalCameraSmooth;
	private float _orthoSizeReset;
	private bool _cameraAdjusted;

	public void Awake()
	{
		_originalCameraSmooth = cameraController.Smoothing;
		_orthoSizeReset = cameraController.GetComponent<Camera>().orthographicSize;
	}

	public void OnTriggerStay2D(Collider2D other)
	{
		// Using on trigger stay so we can wait until the player touches the ground to snap the camera

		var player = other.GetComponent<Player>();

		// Don't snap if the player is jumps through the trigger from below without landing on ground
		// DO snap if player falls into trigger from above
		if (player != null && !player.IsDead && (player.GetComponent<CharacterController2D>().State.IsGrounded || player.transform.position.y > transform.position.y))
		{
			// Not sure if this is worth doing, but only adjust values once instead of continuously while player is in trigger
			if(!_cameraAdjusted)
			{
				_cameraAdjusted = true;
				switch (lockFollowY)
				{
				case true:
					cameraController.followY = false;
					cameraController.cameraHeight = transform.position.y + YPositionOffset;
					break;			

				case false:		
					cameraController.followY = true;
					cameraController.cameraHeight = 0;
					break;
				}

				switch (lockFollowX)
				{
				case true:
					cameraController.followX = false;
					cameraController.xPosition = transform.position.x + XPositionOffset;
					break;

				case false:
					cameraController.followX = true;
					break;
				}

				switch (adjustZoom)
				{
				case true:
					cameraController.orthographicSizeAdjust = zoomOverride;
					break;
				case false:
					if(cameraController.orthographicSizeAdjust != _orthoSizeReset)
						cameraController.orthographicSizeAdjust = _orthoSizeReset;
					break;
				}

				if(ignoreBounds)
					cameraController.ignoreBounds = true;
				if(!ignoreBounds)
					cameraController.ignoreBounds = false;
			}

			// Override camera smoothing if a value is set
			if (cameraSmoothOverride.x != 0)
				cameraController.Smoothing.x = cameraSmoothOverride.x;
			if (cameraSmoothOverride.y != 0)
				cameraController.Smoothing.y = cameraSmoothOverride.y;
		}

	}

	public void OnTriggerExit2D(Collider2D other)
	{
		var player = other.GetComponent<Player>();
		_cameraAdjusted = false;
		
		if (player != null)
		{			
			if (cameraFollowYOnExit)
			{
				cameraController.followY = true;
				cameraController.cameraHeight = 0;
			}

			cameraController.followX = true;
			cameraController.orthographicSizeAdjust = _orthoSizeReset;
			cameraController.Smoothing = _originalCameraSmooth;	
			cameraController.ignoreBounds = false;
		}
		
	}


}

