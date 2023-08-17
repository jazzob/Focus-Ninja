extends Control


#changes scene to main menu when button pressed
func _on_Button_pressed() -> void:
	get_tree().change_scene("res://src/user_interfaces/Menu.tscn")
	get_tree().paused = false
	self.visible = false

#hides the pause menu when resume  button is pressed
func _on_Button2_pressed() -> void:
	get_tree().paused = false
	self.visible = false

#pauses the game when esc is pressed
func _input(event):
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		self.visible = true




