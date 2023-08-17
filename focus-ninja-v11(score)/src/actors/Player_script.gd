extends Actor
class_name Player

func _ready() -> void:
	#resets velocity to zero
	velocity.x = 0
	velocity.y = 0
	


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
	#checks that the player is one the ground and jump button is also pressed. If so the player will jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_strength
		jumps_made += 1
	#if the player presses jump button while in air and has only made one jump they will double jump
	elif Input.is_action_just_pressed("jump") and jumps_made <= 1:
		velocity.y = -jump_strength
		jumps_made += 1
	#if the player is on the floor the amount of jumps made resets to zero
	elif is_on_floor():
		jumps_made = 0
	
	#this method will execute the movement
	velocity = move_and_slide(velocity, UP_DIRECTION)
	
	#code for stomp ability
	for i in get_slide_count():
		var collision := get_slide_collision(i)
		var collider := collision.collider
		#detects if player is stomping
		var is_stomping:= (
			collider is Enemy and is_on_floor() and collision.normal.is_equal_approx(Vector2.UP)
		)
		#if the player is stomping it will bounce off the enemy and kill it
		if is_stomping:
			#bounce from stomp 
			velocity.y = -stomp_impulse
			#calls kill func
			(collider as Enemy).kill()

#detects if the enemy enters the enemy detector area and kills player
func _on_EnemyDetector_body_entered(body: Node) -> void:
	if body is Enemy:
		var current_scene = get_tree().get_current_scene().get_filename()
		get_tree().change_scene(current_scene)


#detects is spike enters the enemy detector area and kills player
func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	if area is Spike:
		var current_scene = get_tree().get_current_scene().get_filename()
		get_tree().change_scene(current_scene)


