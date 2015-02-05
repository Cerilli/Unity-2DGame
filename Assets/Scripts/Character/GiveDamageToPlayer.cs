using UnityEngine;
using System;
using System.Collections;


public class GiveDamageToPlayer : MonoBehaviour 
{
	// Object must not be on platform layer, and IsTrigger must be on

	public bool isActive = 				  true;
	public int DamageToGive = 				10;

	// Knock back variables
	[Serializable] 
	public class KnockBackValues
	{
		public int KnockBackScaleX = 			5;
		public int KnockBackMinX = 				10;
		public int KnockBackMaxX = 				20;

		public int KnockBackScaleY = 			2;
		public int KnockBackMinY = 				0;
		public int KnockBackMaxY = 				15;
	}

	public KnockBackValues knockBackValues;

	// Track the velocity of the object hitting the player in order to knock player back
	private Vector2
		_lastPosition,
		_velocity;

	public void LateUpdate()
	{
		// Find out how many units the object has moved since the last frame
		_velocity = (_lastPosition - (Vector2) transform.position ) / Time.deltaTime;
		_lastPosition = transform.position;
	}

	public void OnTriggerEnter2D(Collider2D other)
	{
		if (isActive && (other.gameObject.tag == "Player") )
		{
			var player = other.GetComponent<Player> ();

			// If the object being hit isn't a player, return
			if (player == null)
					return;

			// Damage Player
			player.TakeDamage (DamageToGive, gameObject);

			// We need this to get the velocity of the player
			var controller = player.GetComponent<CharacterController2D> ();
			var totalVelocity = controller.Velocity + _velocity;

			// Knock the player back based on total velocity of object and player
			// -------------------------------------------------
			// Multiply by -1 to knock player away from object
			// Mathf.Sign to return + or - based on player direction
			// Clamp the values between determined values (10 and 20 for x, 0 and 15 for 5)
			// Scale up values by factors (5 for x, 2 for y)
			// Use Mathf.Abs to "take out the sign" of the value
			controller.SetForce (new Vector2 (
				-1 * Mathf.Sign (totalVelocity.x) * Mathf.Clamp (Mathf.Abs (totalVelocity.x) * knockBackValues.KnockBackScaleX, knockBackValues.KnockBackMinX, knockBackValues.KnockBackMaxX),
				-1 * Mathf.Sign (totalVelocity.y) * Mathf.Clamp (Mathf.Abs (totalVelocity.y) * knockBackValues.KnockBackScaleY, knockBackValues.KnockBackMinY, knockBackValues.KnockBackMaxY)));
		}
	}

	
}
