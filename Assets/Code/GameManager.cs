using UnityEngine;

// This will not be a mono behaviour, because then it would get destroyed when we go to a new level. We're just using this class as a 
// "bag" to contain data. 
// This is a singleton, meaning we'll only ever have one of these instanciated at a time
public class GameManager
{

	// We will store a static reference to the instance
	private static GameManager _instance;

	// Return _instance if it exists (if it's not null) if _instance is null, set it to a new instantiation of GameManager
	public static GameManager Instance {get {return _instance ?? (_instance = new GameManager()); }}

	public int Points {get; private set;}

	// This is an empty constructor that doesn't take an parameters. Because it's private
	// it means nobody other than the GameManager can instance it. By setting this to private, it means
	// nobody else can instantiate it. 
	private GameManager()
	{
	}

	public void Reset()
	{
		Points = 0;
	}

	public void ResetPoints(int points)
	{
		Points = points;
	}
	
	public void AddPoints(int pointsToAdd)
	{
		Points += pointsToAdd;
	}
}
