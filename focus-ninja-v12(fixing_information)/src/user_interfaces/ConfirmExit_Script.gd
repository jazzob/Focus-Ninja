extends CanvasLayer


#hide the confirm menu when the "no" button is pressed
func _on_Button4_pressed() -> void:
	self.visible = false

#show the confirm menu when the main menu button is pressed
func _on_Button3_pressed() -> void:
	self.visible = true
