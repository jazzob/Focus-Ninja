extends Control


#when the button labeled exit is pressed the user will exit
func _on_Button_pressed() -> void:
	get_tree().quit()
