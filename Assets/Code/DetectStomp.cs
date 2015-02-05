using UnityEngine;
using System.Collections;

public class DetectStomp : MonoBehaviour
{

	private SimpleEnemyAI _enemyAI;
	private GiveDamageToPlayer _enemyGiveDamage;
		

	// Use this for initialization
		void Start ()
		{
			_enemyAI = GetComponentInParent<SimpleEnemyAI>();
			_enemyGiveDamage = GetComponentInChildren<GiveDamageToPlayer> ();


			
		}
	
		// Update is called once per frame
		void Update ()
		{
	
		}

	public void OnTriggerEnter2D(Collider2D other)
	{
		if (other.gameObject.tag == "Player")
		{
			_enemyGiveDamage.active = false;
			_enemyAI.TakeDamage(50, other.gameObject);

			var _playerController = other.GetComponentInParent<CharacterController2D>();

			//if(_playerController.jumpButton)_playerController.SetVerticalForce(80);
			_playerController.SetVerticalForce(40);


		}
	}
}

