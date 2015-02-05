using UnityEngine;

public class SimpleProjectile : Projectile, ITakeDamage
{
	public int Damage;
	public GameObject DestroyedEffect;
	public int PointsToGiveToPlayer;
	public float TimeToLive;

	public void Update() 
	{
		if ((TimeToLive -= Time.deltaTime) <= 0)
		{
			DestroyProjectile();
			return;
		}

		// Every update, we want to move the projectile in the direction we're going, * the InitialVelocity.x + Speed
		// Then scale it by delta time
		transform.Translate(Direction * ((Mathf.Abs(InitialVelocity.x) + Speed) * Time.deltaTime), Space.World);
	}


	public void TakeDamage(int damage, GameObject instigator)
	{
		// If shooting/destroying this projectile awards points to the player...
		if (PointsToGiveToPlayer != 0)
		{
			// ...and it was it by a projectile from the player
			var projectile = instigator.GetComponent<Projectile>();
			if (projectile != null && projectile.Owner.GetComponent<Player>() != null)
			{
				// Give the player points and show floating text
				GameManager.Instance.AddPoints(PointsToGiveToPlayer);
				FloatingText.Show (string.Format("+{0}", PointsToGiveToPlayer), "PointStarText", new FromWorldPointTextPositioner(Camera.main, transform.position, 1.5f, 50));
			}
		}

		// Once the projectile takes any amount of damage, we want it to be destroyed
		DestroyProjectile();
	}

	protected override void OnCollideOther (Collider2D other)
	{
		DestroyProjectile();
	}

	protected override void OnCollideTakeDamage (Collider2D other, ITakeDamage takeDamage)
	{
		takeDamage.TakeDamage(Damage, gameObject); 
		DestroyProjectile();
	}

	private void DestroyProjectile()
	{
		if (DestroyedEffect != null) 
			Instantiate (DestroyedEffect, transform.position, transform.rotation);

		Destroy (gameObject);
	}
}

