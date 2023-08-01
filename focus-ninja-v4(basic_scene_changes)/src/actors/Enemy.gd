extends Actor
class_name Enemy

#sets enemy direction for start
func _ready() -> void:
	#ensures the enemy does not start moving until in view
	set_physics_process(false)
	velocity.x = -speed


#creates enemy movement
func _physics_process(delta: float) -> void:
	velocity.y = gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
		
	velocity.y = move_and_slide(velocity, UP_DIRECTION).y

#when called kills the enemy
func kill() -> void:
	queue_free()


