using UnityEngine;
using System;
using System.Collections;

[Serializable]
public class CharacterPermissions 
{
    public bool sprintEnabled = true;
    public bool jumpEnabled = true;
    public bool doubleJumpEnabled = true;
    public bool crouchEnabled = true;
    public bool crouchMovementEnabled = true;
    public bool doubleJumpWhileCrouchedEnabled = true;
    public bool wallJumpEnabled = true;
    public bool doubleJumpOffWallEnabled = true;
    public bool dashEnabled = true;
    public bool slamEnabled = true;
}
