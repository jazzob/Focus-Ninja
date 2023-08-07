extends Actor
class_name Enemy

#sets enemy direction for start
func _ready() -> void:
	#ensures the enemy does not start moving until in view
	set_physics_process(false)
	velocity.x = -speed

#when called kills the enemy
func kill() -> void:
	queue_free()

#creates enemy movement
func _physics_process(delta: float) -> void:
	#sets downward velocity
	velocity.y = gravity * delta
	#dectects if enemy is on the wall so it can switch direction
	if is_on_wall():
		velocity.x *= -1.0
	
	velocity.y = move_and_slide(velocity, UP_DIRECTION).y



