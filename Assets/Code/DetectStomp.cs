using UnityEngine;
using System.Collections;

public class DetectStomp : MonoBehaviour
{

	private SimpleEnemyAI _enemyAI;
		

	// Use this for initialization
		void Start ()
		{
			_enemyAI = GetComponentInParent<SimpleEnemyAI>();
		}
	
		// Update is called once per frame
		void Update ()
		{
	
		}

	public void OnTriggerEnter2D(Collider2D other)
	{
		_enemyAI.GetComponentInParent<BoxCollider2D>().enabled = false;
		if (other.gameObject.tag == "Player")
		{
			var _playerController = other.GetComponentInParent<CharacterController2D>();

			if(_playerController.jumpButton)_playerController.SetVerticalForce(80);
			_playerController.SetVerticalForce(40);

			_enemyAI.TakeDamage(50, other.gameObject);
		}
	}
}

