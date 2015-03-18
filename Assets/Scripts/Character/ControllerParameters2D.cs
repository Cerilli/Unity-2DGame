using UnityEngine;
using System;
using System.Collections;

[Serializable]
public class ControllerParameters2D
{
    [HideInInspector]
    public Vector2 MaxVelocity = new Vector2(float.MaxValue, float.MaxValue);
    public float TerminalVelocity = -60f;
    public float Gravity = 60f;		// Every second, this many units are going to be applied to the Y direction
    public float AccelerationOnGround = 10f; 		// How quickly the player goes from still to moving
    public float AccelerationInAir = 5f;

    [Tooltip("Multiplies vertical velocity while wall sliding")]
    public float WallFriction = 0.8f;
    [Tooltip("How long the character will be stuck to the wall if the player isn't pushing towards the wall")]
    public float wallDropTimer = 0.2f;       // How long the player clings to the wall after letting go of button

    [Range(0, 99)]
    public float SlopeLimit = 30f;		// The angle that we're allowed to climb.

    [Tooltip("A curve that multiplies the character speed based on the angle of the slope they are on")]
    public AnimationCurve slopeSpeedMultiplier = new AnimationCurve(new Keyframe(-90, 1f), new Keyframe(0, 1f), new Keyframe(90, 1.5f));

    public bool DetectEdges = true;
    [Tooltip("How far out the edge detecting raycasts will be from the center of the character")]
    public float edgeDetectDistance = 3.0f;
}
