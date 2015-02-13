using UnityEngine;
using System.Collections;

// For this to work, we have to set the "Looping" attribute on the particle system to off

public class AutoDestroyParticleSystem : MonoBehaviour 
{
	private ParticleSystem _particleSystem;

	void Start () 
	{
		_particleSystem = GetComponent<ParticleSystem>();
		Destroy(gameObject, _particleSystem.duration);
	}
}
