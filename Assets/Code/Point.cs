using UnityEngine;
using System.Collections;

public class Point : MonoBehaviour, IPlayerRespawnListener {

	// This will be a prefab that is instantiated when the star is collected
	public GameObject Effect;
	public int PointsToAdd = 10;

	public AudioClip HitPointSound;

	public void OnTriggerEnter2D(Collider2D other)
	{
		if(other.GetComponent<Player>() == null)
		   return;

		GameManager.Instance.AddPoints(PointsToAdd);

		if(HitPointSound != null)
			AudioSource.PlayClipAtPoint(HitPointSound, transform.position, 0.1f);

		// Instantiate whichever effect we have assigned in the editor
		Instantiate(Effect, transform.position, transform.rotation);

		// Since we might want to reset to point objects, we don't want to destroy them.
		// Just set it to false for now
		gameObject.SetActive(false);

		// Show how many points the player got when they pick up the item
		// "PointStarText" is the style type which needs to be created in Unity
		// Travels upwards for 1.5 secounds at 50 pixels/seconds
		FloatingText.Show (string.Format("+{0}", PointsToAdd), "PointStarText", new FromWorldPointTextPositioner(Camera.main, transform.position, 1.5f, 50));
	}

	public void OnPlayerRespawnInThisCheckpoint(Checkpoint checkpoint, Player player)
	{
		gameObject.SetActive(true);
	}

}
