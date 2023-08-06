extends Control

#when the "Play" button is pressed change scene to the enter name scene
func _on_Play_pressed() -> void:
	get_tree().change_scene("res://src/user_interfaces/EnterName.tscn")

#when the "How to play" button is pressed change scene to the how to play scene
func _on_How_to_Play_pressed() -> void:
	get_tree().change_scene("res://src/user_interfaces/HowToPlay.tscn")

#When the "Exit" button is presed exit the game
func _on_Exit_pressed() -> void:
	get_tree().quit()
