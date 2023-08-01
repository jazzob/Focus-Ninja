extends LineEdit


func _ready() -> void:
	grab_focus()
	set_cursor_position(len(text))
	var legal_name = false

func _input(event):
	# Check if the event is a key press event
	if event is InputEventKey:
		# Check if the pressed key is the "Enter" key (scancode: 13)
		if event.scancode == KEY_ENTER:
			# Call the function that handles the "Enter" key press
			on_enter_pressed()



func on_enter_pressed():
	var pattern = "[^a-zA-Z]"
	
	var illegal_names = ["butt", "poo", "toilet"]
	var player_name_illegal = false
	if len(text) > 0 and len(text) < 14:
		if text != ("Enter Name"):
			for i in range(0, len(illegal_names)):
				if text.find(illegal_names[i]) != -1:
					player_name_illegal = true
			if player_name_illegal == false:
				Global.player_name = text
				get_tree().change_scene("res://src/levels/LevelTemplate.tscn")
	get_node("RichTextLabel").visible = true
