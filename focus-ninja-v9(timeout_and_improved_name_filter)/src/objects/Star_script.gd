extends Area2D
class_name Star

#causes the star to disappear when the player touches it
func _on_Star_body_entered(body: KinematicBody2D) -> void:
	#checking if the body touching the star is the player or not
	if body is Player:
		queue_free()
