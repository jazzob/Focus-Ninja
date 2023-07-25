extends KinematicBody2D
class_name Actor

#creates the basic variables to be used by enemy and player
export var gravity = 3000.0
const UP_DIRECTION := Vector2.UP
var velocity := Vector2.ZERO
export var speed := 600.0
export var stomp_impulse = 600.0
export var jump_strength = 1000.0
