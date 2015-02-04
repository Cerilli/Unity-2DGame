using UnityEngine;
using System.Collections;

public class SimpleEnemyAI : MonoBehaviour, ITakeDamage, IPlayerRespawnListener
{
	public bool CanShoot;
	public bool walkOffEdges;
	public float Speed;
	public float FireRate = 1;
	public int PointsToGivePlayer;

	public Projectile Projectile; 
	public AudioClip EnemyShootSound;
	public GameObject DestroyedEffect;



	private CharacterController2D _controller;
	private Vector2 _direction;
	private Vector2 _startPosition;
	private float _canFireIn;

	public void Awake()
	{
		_startPosition = transform.position;
	}

	public void Start()
	{
		_controller = GetComponent<CharacterController2D>();
		_direction = new Vector2 (-1,0);

	}

	public void Update()
	{
		_controller.SetHorizontalForce(_direction.x * Speed);

		// If an edge is detected and the ai is not supposed to walk off
		if (!walkOffEdges && _controller.State.IsGrounded && (_controller.State.EdgeDetectedLeft || _controller.State.EdgeDetectedRight)) 
		{
			if( (_direction.x < 0 && _controller.State.EdgeDetectedLeft))
				ChangeDirection();

			if( (_direction.x > 0 && _controller.State.EdgeDetectedRight))
				ChangeDirection();
		}

		// If he collides with anything while movine left or right
		if( (_direction.x < 0 && _controller.State.IsCollidingLeft) || (_direction.x > 0 && _controller.State.IsCollidingRight) )
			ChangeDirection();



		if(CanShoot)
		{
			if ((_canFireIn -= Time.deltaTime) > 0)
				// He can't fire yet
				return;

			// Use a raycast to check for the player
			var raycast = Physics2D.Raycast(transform.position , _direction, 10, 1 << LayerMask.NameToLayer("Player"));

			if(!raycast)
				// Player isn't in enemy's line of site
				return;

			// If we made it this far and the enemy does detect the player, shoot at the player
			var projectile = (Projectile) Instantiate(Projectile, transform.position, transform.rotation);
			projectile.Initialize(gameObject, _direction, _controller.Velocity);

			if( EnemyShootSound != null)
				AudioSource.PlayClipAtPoint(EnemyShootSound, transform.position);

			// Reset fire rate timer
			_canFireIn = FireRate;
		}

	}

	public void TakeDamage (int damage, GameObject instigator)
	{
		if (PointsToGivePlayer != 0)
		{
			var projectile = instigator.GetComponent<Projectile>();
			if(projectile != null && projectile.Owner.GetComponent<Player>() != null)
			{
				GameManager.Instance.AddPoints(PointsToGivePlayer);
				FloatingText.Show(string.Format("+{0}", PointsToGivePlayer), "PointStarText", new FromWorldPointTextPositioner(Camera.main, transform.position, 1.5f, 50));

			}
		}

		// When the enemy takes damage, we want it to disappear, but not be destroyed. That way we can respawn it
		Instantiate (DestroyedEffect, transform.position, transform.rotation);
		gameObject.SetActive(false);
	}

	public void OnPlayerRespawnInThisCheckpoint (Checkpoint checkpoint, Player player)
	{
		_direction = new Vector2 (-1, 0);
		transform.localScale = new Vector3(1,1,1);
		transform.position = _startPosition;
		gameObject.SetActive(true);
	}

	public void ControllerEnter2D(CharacterController2D controller)
	{
		controller.SetVerticalForce (50);
		gameObject.SetActive(false);
	}

	private void ChangeDirection()
	{
		// Change his direction and flip him
		_direction = -_direction;
		transform.localScale = new Vector3 (-transform.localScale.x, transform.localScale.y, transform.localScale.z);
	}



}

