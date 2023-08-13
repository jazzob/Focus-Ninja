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

#func which test that a string is built only out of letters
func hasOnlyLetters(input_string: String) -> RegExMatch:
	#sets the pattern of avaliable characters
	var pattern := "^[A-Za-z]+$"
	#creates new regex
	var regex := RegEx.new()
	#compiles the regex for matching
	regex.compile(pattern)
	#search for a match in the input_string and return the result
	return regex.search(input_string)

func legalNameChecker(input_string: String) -> bool:
	#creates a list of illegal names 
	var illegal_names = ["butt", "poo", "toilet"]
	#makes the text lowercase to be filter for illegal names
	var lowercaseText = text.to_lower()
	#creates variable for whether a player's name illegal, initially it is set to false
	var player_name_illegal = false
	#check the name is only made out of letters
	if hasOnlyLetters(text) != null:
		#check that the player's name is not more than 14 characters
		if len(text) > 0 and len(text) <= 14:
			#check that they have entered a new name
			if text != ("Enter Name"):
				#go through the list checking for illegal names
				for i in range(0, len(illegal_names)):
					if lowercaseText.find(illegal_names[i]) != -1:
						player_name_illegal = true
				if player_name_illegal == true:
					return false
				else: 
					return true
			else: 
				return false
		else:
			return false
	else:
		return false

func on_enter_pressed():
	if legalNameChecker(text) == true:
		Global.player_name = text
		get_tree().change_scene("res://src/levels/Level1.tscn")
	else:
		get_node("RichTextLabel").visible = true
