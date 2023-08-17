extends Node2D


#when the exit button is pressed the player will return to the main menu
func _on_Button_pressed() -> void:
	get_tree().change_scene("res://src/user_interfaces/Menu.tscn")
