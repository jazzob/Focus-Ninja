extends KinematicBody2D
class_name Actor

#creates the basic variables to be used in movement
export var gravity = 3000.0
const UP_DIRECTION := Vector2.UP
var velocity := Vector2.ZERO
export var speed := 600.0
export var jump_strength = 1000.0
