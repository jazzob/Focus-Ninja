extends Actor

#creates movement
func _physics_process(delta: float) -> void:
	#calculates horizontal direction
	var horizontal_direction = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
	)
	
	
	
	#calculates movement
	velocity.x = horizontal_direction * speed
	velocity.y += gravity * delta
	
	#code for jumping 
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_strength
		
	velocity = move_and_slide(velocity, UP_DIRECTION)
