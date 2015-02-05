using UnityEngine;
using System.Collections;

public class StartScreen : MonoBehaviour
{

	public string FirstLevel;

	public void Update()
	{
		if(!Input.GetButtonDown ("Start"))
			return;

		// Reset the game manager, which resets all points
		GameManager.Instance.Reset();
		Application.LoadLevel(FirstLevel);
	}
}

