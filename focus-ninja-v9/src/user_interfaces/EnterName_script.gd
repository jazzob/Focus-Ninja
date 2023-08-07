extends LineEdit


func _ready() -> void:
	#selects the text box and sets the cursor to the end of the line
	grab_focus()
	set_cursor_position(len(text))

func _input(event):
	#check if the event is a key press event
	if event is InputEventKey:
		#check if the pressed key is the "Enter" key 
		if event.scancode == KEY_ENTER:
			#call the function that handles the "Enter" key press
			on_enter_pressed()



func on_enter_pressed():
	#creates a list of illegal names 
	var illegal_names = ["butt", "poo", "toilet"]
	#makes the text lowercase to be filter for illegal names
	var lowercaseText = text.to_lower()
	#creates variable for whether a player's name illegal, initially it is set to false
	var player_name_illegal = false
	#check that the player's name is not more than 14 characters
	if len(text) > 0 and len(text) <= 14:
		#check that they have entered a new name
		if text != ("Enter Name"):
			#go through the list checking for illegal names
			for i in range(0, len(illegal_names)):
				if lowercaseText.find(illegal_names[i]) != -1:
					player_name_illegal = true
			#if the name is not illegal set that as the player's name and change the scene
			if player_name_illegal == false:
				Global.player_name = text
				get_tree().change_scene("res://src/levels/Level1.tscn")
	#show the error message
	get_node("RichTextLabel").visible = true
