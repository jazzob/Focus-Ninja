extends Control


#when the button labeled exit is pressed the user will 
func _on_Button_pressed() -> void:
	get_tree().change_scene("res://src/user_interfaces/Menu.tscn")
