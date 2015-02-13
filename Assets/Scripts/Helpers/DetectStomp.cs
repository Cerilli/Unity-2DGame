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
			var _playerController = other.GetComponentInParent<CharacterController2D>();

			if(_playerController.Velocity.y <= .01 && !_playerController.State.IsDashing)
			{
				_enemyGiveDamage.isActive = false;
				_enemyAI.TakeDamage(50, other.gameObject);
				_playerController.State.IsStomping = true;
			
				if (_playerController.State.IsDiving || _playerController.GetComponent<Player>().JumpButton())
					_playerController.SetVerticalForce(50);
				else
					_playerController.SetVerticalForce(30);
			}

		}
	}
}

