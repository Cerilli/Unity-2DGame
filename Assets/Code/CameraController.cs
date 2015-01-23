using UnityEngine;
using System.Collections;

public class CameraController : MonoBehaviour
{
	public Transform CameraFollow;
	public Transform SprintFollow;
	public GameObject playerObject;

	public Vector2 Margin;
	public Vector2 Smoothing;
	public Vector2 SmoothAdjust;

	public bool followY;
	public float cameraHeight;
	public bool followX;
	public float xPosition;
	public float orthographicSizeAdjust;

	public BoxCollider2D Bounds;
	public bool ignoreBounds;

	private float _ySmoothReset;
	private float _xSmoothReset;
	private Vector2 _marginReset;
	private Vector2 _followReset;
	private float _orthographicSizeReset;
	private CharacterController2D characterController;
	private float _sprintTimer;

	private Vector3
		_min,
		_max;

	public bool IsFollowing { get; set; }

	public void  Awake()
	{
		_min = Bounds.bounds.min;
		_max = Bounds.bounds.max;
		IsFollowing = true;
		followY = true;
		ignoreBounds = false;

		//_sprintTimer = 0;

		// Store original values to reset them on trigger exit
		_ySmoothReset = Smoothing.y;
		_xSmoothReset = Smoothing.x;
		_marginReset = Margin;
		_followReset = CameraFollow.localPosition;
		orthographicSizeAdjust = camera.orthographicSize; // ensure orthographic size is not set to 0
		_orthographicSizeReset = camera.orthographicSize;

		characterController = playerObject.GetComponent<CharacterController2D>();
	}

	public void Update()
	{
		var x = transform.position.x;
		var y = transform.position.y;
		if(!characterController.isSprinting) _sprintTimer = 0;

		if(IsFollowing)		
		{
			// Adjust the camera y smoothing if the player is falling quickly
			if (characterController.Velocity.y < -40)
				Smoothing.y = SmoothAdjust.y;

			else
				Smoothing.y = _ySmoothReset;

			// If the player isn't moving, lerp the camera follow back to its original position
			if(!characterController.isSprinting || (Mathf.Abs(characterController.Velocity.x)  < 5 ))

			{
				CameraFollow.localPosition = new Vector2(Mathf.Lerp(CameraFollow.localPosition.x, _followReset.x, Time.deltaTime), _followReset.y);
				Smoothing.x = Mathf.Lerp(Smoothing.x, _xSmoothReset, Time.deltaTime);
			}

			
			// Used for when a camera trigger locks the x position
			if(!followX)
				//x =  Mathf.Lerp (x, xPosition, Smoothing.x * Time.deltaTime);			
				x = Mathf.SmoothStep(x, xPosition, 0.1f);
			
			
			// If the camera's x position isn't locked by a trigger
			if(followX)
			{
				if(Mathf.Abs(x- CameraFollow.position.x) > Margin.x)
				{
					// Push the camera follow node out ahead of the player if he is sprinting
					if(characterController.isSprinting && (characterController.Velocity.x > 5 || characterController.Velocity.x < -5))
					{				
						_sprintTimer += Time.deltaTime;
						Margin.x = 0;
						Smoothing.x = Mathf.Lerp(Smoothing.x, SmoothAdjust.x, Time.deltaTime);
						if(_sprintTimer > 0.5f)
							CameraFollow.position = new Vector2(Mathf.Lerp(CameraFollow.position.x, SprintFollow.position.x, Time.deltaTime), CameraFollow.position.y);

					} else 	Margin = _marginReset;
			
				//x =  Mathf.Lerp (x, CameraFollow.position.x, Smoothing.x *Time.deltaTime);
					x= Mathf.SmoothStep(x, CameraFollow.position.x, 0.108f);
				}
			}		

			if (followY)
			{
				if(Mathf.Abs (y- CameraFollow.position.y) > Margin.y)
					y = Mathf.Lerp (y, CameraFollow.position.y, Smoothing.y * Time.deltaTime);
			}
			else
				//y = Mathf.Lerp (y, cameraHeight, Smoothing.y * Time.deltaTime);
				y=Mathf.SmoothStep(y, cameraHeight, 0.1f);
		}

		//camera.orthographicSize = Mathf.Lerp(camera.orthographicSize, orthographicSizeAdjust, Time.deltaTime);
		camera.orthographicSize = Mathf.SmoothStep(camera.orthographicSize, orthographicSizeAdjust, 0.1f);
		var cameraHalfWidth = camera.orthographicSize * ((float)Screen.width / Screen.height);

		if(!ignoreBounds)
		{

			x = Mathf.Clamp(x, _min.x + cameraHalfWidth, _max.x - cameraHalfWidth);
			y = Mathf.Clamp(y, _min.y + camera.orthographicSize, _max.y - camera.orthographicSize);

		}

		transform.position = new Vector3(x, y, transform.position.z);
	}

	public void ResetCamera()
	{
		Smoothing = new Vector2(_xSmoothReset, _ySmoothReset);
		//CameraFollow.localPosition = _followReset;
		IsFollowing = true;
		followX = true;
		followY = true;
		Margin = _marginReset;
		orthographicSizeAdjust = _orthographicSizeReset;

	}
}
