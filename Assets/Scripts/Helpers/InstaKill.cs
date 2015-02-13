using UnityEngine;
using System.Collections;

public class InstaKill : MonoBehaviour 
{

	public void OnTriggerEnter2D(Collider2D other)
	{
		var player = other.GetComponent<Player>();
		if (player == null)
			return;

		if (!player.Invincible)
			LevelManager.Instance.KillPlayer();
	}
}
