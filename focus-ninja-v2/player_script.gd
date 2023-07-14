extends Actor
class_name Player


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
	
	#code for stomp ability
	for i in get_slide_count():
		var collision := get_slide_collision(i)
		var collider := collision.collider
		var is_stomping:= (
			collider is Enemy and is_on_floor() and collision.normal.is_equal_approx(Vector2.UP)
		)
		
		if is_stomping:
			#bounce from stomp 
			velocity.y = -stomp_impulse
			#calling kill func
			(collider as Enemy).kill()
			


#detects if the enemy enters the enemy detector area and kills player
func _on_EnemyDetector_body_entered(body: PhysicsBody2D) -> void:
	if body is Enemy:
		queue_free()
