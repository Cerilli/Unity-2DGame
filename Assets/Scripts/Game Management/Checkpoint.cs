using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Checkpoint : MonoBehaviour 
{

	private List<IPlayerRespawnListener> _listeners;

	public void Awake() 
	{
		_listeners = new List<IPlayerRespawnListener>();
	}

	public void PlayerHitCheckpoint() 
	{
		// this will be executed of the course of multiple frames. If we don't do this, the LevelManager's bonus
		// will have been reset and the bonus displayed will not be accurate
		StartCoroutine(PlayerHitCheckpointCo(LevelManager.Instance.CurrentTimeBonus));
	}

	private IEnumerator PlayerHitCheckpointCo(int bonus)
	{
		//FloatingText.Show("Checkpoint!", "CheckpointText", new CenteredTextPositioner(.5f));
		yield return new WaitForSeconds(.5f);
		//FloatingText.Show (string.Format("+{0} time bonus", bonus), "CheckpointText", new CenteredTextPositioner(.5f));
	}

	public void PlayerLeftCheckpoint()
	{
	}

	public void SpawnPlayer (Player player)
	{
		player.RespawnAt(transform);

		// Any MonoBehaviour that uses IPlayerRespawnListener will be notified when the player has been respawned at this checkpoint
		foreach (var listener in _listeners)
			listener.OnPlayerRespawnInThisCheckpoint(this, player);
	}


	public void AssignObjectToCheckpoint (IPlayerRespawnListener listener)
	{
		// Add the listener to a collection of checkpoints that can loop through and inform the checkpoint 
		// when the player needs to be respawned (?? Not sure 28:40 in 3D Buzz "Points 2" video)

		// Assign listener to current checkpoint
		_listeners.Add(listener);

	}
}
