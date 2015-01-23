using UnityEngine;
using System.Collections;


// Abstract - marks the base projectile class as not instantiatable (a base type). However, you will be able instantiate children of this class
// We intend for this class to only be used as a parent for other classes
public abstract class Projectile : MonoBehaviour
{
	public float Speed;
	public LayerMask CollisionMask;

	public GameObject Owner { get; set; }
	public Vector2 Direction { get; set; }
	public Vector2 InitialVelocity { get; set; }

	public void Initialize(GameObject owner, Vector2 direction, Vector2 initialVelocity)
	{
		// Make the projectile face in the direction it's moving
		transform.right = direction;

		Owner = owner;
		Direction = direction;
		InitialVelocity = initialVelocity;

		OnInitialized();
	}

	// protected: Only accessible from this class and its children
	// virtual: overridable by the children
	// This is an optional method that the child classes can choose to use if they want to, but they don't have to
	protected virtual void OnInitialized()
	{

	}

	// Invoked when the projectile hits another collider
	public virtual void OnTriggerEnter2D(Collider2D other)
	{

		// Check to see if the object it collided with is part of the collision mask layer
		// If this == 0, we collided with something that doesn't match our collision mask

		// Layer #      Binary      Decimal 
		// Layer 0  =  0000 0001 =  1
		// Layer 1  =  0000 0010 =  2
		// Layer 2  =  0000 0100 =  4
		// Layer 3  =  0000 1000 =  8
		// Layer 4  =  0001 0000 =  16
		// Layer 5  =  0010 0000 =  32 
		// Layer 6  =  0100 0000 =  64
		// Layer 7  =  1000 0000 = 128
		// etc

		// other.gameObject.layer is the Layer Number, NOT the decimal representation of the layer
		// CollisionMask.value is the binary represenation of our combined layers in a single byte.
		// For example: Layer 0 + Layer 2 + Layer 5 = 0010 0101.

		// So, if our layer mask value = 0110 0110 (for example)
		// Is layer 5 in the mask?

		// First of all, we need to turn the concept of Layer 5 into its binary representation (from 5 into 0010 0000 which = 32) 
		// So, we do (1 << 5). The << (left shift) operator takes the bits in a number and shifts it left x amount of times (in this case 5)
		// 0000 0001 << 5 = 0010 0000 - the 1 has been shifted over 5 spots, succesfully converting the layer index into a binary representation

		// Then, we use the & operator
		// 0110 0110
		// & (and)
		// 0010 0000
		// ---------
		// 0010 0000

		// The & operator only returns a one if it exists in the same "column" between both numbers
		// Therefore, we know the layer is in the collision mask because the resulting number is not 0000 0000

		// For example:
		// 0110 0110
		// & 
		// 1000 0000
		// ---------
		// 0000 0000
		// Therefore, the layer we are checking is not in the collision mask

		if ((CollisionMask.value & (1 << other.gameObject.layer)) == 0)
		{
			OnNotCollideWith(other);
			return;
		}

		// Check to see if the thing we collided with is our owner
		var isOwner = other.gameObject == Owner;
		if (isOwner)
		{
			OnCollideOwner();
			return;
		}

		// Try to extract the ITakeDamage interface from the thing we just hit. If that was successful, 
		// we call the optional method

		// we don't use the generic form of GetComponent ( other.GetComponent<ITakeDamage> ), because ITakeDamage
		// will will not be inheriting from the base Unity Object class. We have to use the non-generic form of GetComponent
		var takeDamage = (ITakeDamage) other.GetComponent(typeof(ITakeDamage));
		if(takeDamage != null)
		{
			OnCollideTakeDamage(other, takeDamage);
			return;
		}

		// If none of those things happened, then this
		OnCollideOther(other);
	}

	protected virtual void OnNotCollideWith(Collider2D other)
	{
	}

	protected virtual void OnCollideOwner()
	{
	}

	protected virtual void OnCollideTakeDamage(Collider2D other, ITakeDamage takeDamage)
	{
	}

	protected virtual void OnCollideOther(Collider2D other)
	{
	}
}

