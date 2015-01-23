using UnityEngine;
using System.Collections;

public class FollowObject : MonoBehaviour 
{
	public Vector2 Offset;
	public Transform Following;

	public void Update()
	{
		// Make one object follow another object with an offset
		transform.position = Following.transform.position + (Vector3)Offset;
	}
}
