using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System;

public class LevelManager : MonoBehaviour
{
	public static LevelManager Instance {get; private set;}

	public Player Player {get; private set;}
	public CameraController Camera {get; private set;}
	public TimeSpan RunningTime { get {return DateTime.UtcNow - _started; } } 

	public int CurrentTimeBonus
	{
		get
		{
			var secondDifference = (int)(BonusCutoffSeconds - RunningTime.TotalSeconds);
			return Mathf.Max (0, secondDifference) * BonusSecondMultiplier;
		}
	}

	private List<Checkpoint> _checkpoints;
	private int _currentCheckpointIndex;
	private DateTime _started;
	private int _savedPoints;

	// When we're testing our level, we want to be able to spawn at certain points that we choose
	// However, we don't want this funtionality to exist when we build the final version, so we call it "DebugSpawn"
	public Checkpoint DebugSpawn;

	public int BonusCutoffSeconds;
	public int BonusSecondMultiplier; 

	public void Awake()
	{
		// carry points through to the next level
		_savedPoints = GameManager.Instance.Points;

		Instance = this;
	}

	public void Start()
	{
		// Be sure this is FindObjectS. Plural. With an S. 
		// Order the checkpoints by their x position when we make the list
		_checkpoints = FindObjectsOfType<Checkpoint>().OrderBy(t => t.transform.position.x).ToList();

		// If there are more than 0 checkpoints in the scene, set the current checkpoint to 0 (the first checkpoint)
		// If there are NO checkpoints, set the index number to -1. We will use -1 as a special flag to indicate that there 
		// are no checkpoints in the level
		_currentCheckpointIndex = _checkpoints.Count > 0 ? 0 : -1;

		// Cache our player and camera withing the level manager so we can access them
		Player = FindObjectOfType<Player>();
		Camera = FindObjectOfType<CameraController>();

		// Store time of when we started
		_started = DateTime.UtcNow;


		// --- Assign point objects to checkpoints ------------------------------------------------
		
		// This is ineffecient and sloppy, but will work for this game. Even if we have 1000 point objects, we shouldn't
		// notice a performance hit
		
		// Get all of the respawn listeners
		var listeners = FindObjectsOfType<MonoBehaviour>().OfType<IPlayerRespawnListener>();
		
		// Loop through the listeners
		foreach(var listener in listeners)
		{
			for (var i = _checkpoints.Count -1; i>=0; i--)
			{
				// Will give us a distance value between our checkpoint and the object we're currently looking at
				var distance = ((MonoBehaviour)listener).transform.position.x - _checkpoints[i].transform.position.x;
				
				// If distance is less than zero (no in front of the checkpoint), don't do anything and keep looping
				if (distance <= 0)
					continue;
				
				_checkpoints[i].AssignObjectToCheckpoint(listener);
				
				// We found the last object that could be assigned to this checkpoint, so break the loop
				break;
			}
		}
		
		// --------------------------------------------------------------------------------------

	// Use a preprocessor directive
	#if UNITY_EDITOR
		// If we're using DebugSpawn, spawn according to it. Else, if there are checkpoints, spawn at the current checkpoint
		if(DebugSpawn != null)
			DebugSpawn.SpawnPlayer(Player);
		else if (_currentCheckpointIndex != -1)
			_checkpoints[_currentCheckpointIndex].SpawnPlayer(Player);
	
	#else
		if(_currentCheckpointIndex != -1)
			_checkpoints[_currentCheckpointIndex].SpawnPlayer(Player);
	#endif
	}

	public void Update()
	{
		var isAtLastCheckPoint = _currentCheckpointIndex + 1 >= _checkpoints.Count;

		if(isAtLastCheckPoint)
			return;

		var distanceToNextCheckPoint = _checkpoints[_currentCheckpointIndex + 1].transform.position.x - Player.transform.position.x;

		// if we haven't hit the next checkpoint yet, exit
		if(distanceToNextCheckPoint >= 0 )
			return;

		_checkpoints[_currentCheckpointIndex].PlayerLeftCheckpoint();
		_currentCheckpointIndex++;
		_checkpoints[_currentCheckpointIndex].PlayerHitCheckpoint();

		// When we hit a checkpoint, add the current time bonus
		GameManager.Instance.AddPoints(CurrentTimeBonus);

		//cache how man points we have
		_savedPoints = GameManager.Instance.Points;

		// start current time bonus at this time
		_started = DateTime.UtcNow;



	}

	public void GotoNextLevel (string levelName)
	{
		// Start the coroutine for loading the next level
		StartCoroutine(GotoNextLevelCo(levelName));
	}

	private IEnumerator GotoNextLevelCo(string levelName)
	{

		// Disable player controls
		Player.FinishLevel();

		// Show the player how many points they have
		GameManager.Instance.AddPoints(CurrentTimeBonus);
		FloatingText.Show ("Level Complete!", "CheckpointText", new CenteredTextPositioner(.25f));
		yield return new WaitForSeconds(1);

		FloatingText.Show (string.Format("{0} points", GameManager.Instance.Points), "CheckpointText", new CenteredTextPositioner(.25f));

		// Wait for x seconds
		yield return new WaitForSeconds(3f);

		// If there is no determined "next level", go back to the start screen
		if (string.IsNullOrEmpty (levelName))
			Application.LoadLevel("StartScreen");
		// otherwise, load the next level
		else
			Application.LoadLevel(levelName);


	}

	public void KillPlayer()
	{
		// StartCoroutine is a Unity method that will allow a method to span multiple frames
		StartCoroutine(KillPlayerCo());
	}

	private IEnumerator KillPlayerCo()
	{
		Player.Kill();
		Camera.IsFollowing = false;
		yield return new WaitForSeconds(2f);

		Camera.IsFollowing = true;

		if (_currentCheckpointIndex != -1)
			_checkpoints[_currentCheckpointIndex].SpawnPlayer(Player);

		//TODO: points
		_started = DateTime.UtcNow;

		// Reset the points to whatever we had before
		GameManager.Instance.ResetPoints(_savedPoints);
	}


}
