extends KinematicBody2D
class_name Actor


#creates gravity value to be used by player
export var gravity = 3000.0
#sets the UP_DIRECTION to be later used in move_and_slide function
const UP_DIRECTION := Vector2.UP
#creates the variable for velocity to be used in enemy and player movement
var velocity := Vector2.ZERO
#sets movement speed for player and enemy movement
export var speed := 600.0
#sets the size of impulse when an enemy is killed
export var stomp_impulse = 600.0
#sets the player's jump height
export var jump_strength = 1000.0
