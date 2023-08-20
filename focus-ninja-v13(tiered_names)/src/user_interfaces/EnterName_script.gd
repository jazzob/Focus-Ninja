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
				#check the name's level of appropriateness
				var tier_of_appropropiateness = check_inappropriate(lowercaseText)
				if tier_of_appropropiateness == 2:
					get_tree().change_scene("res://src/user_interfaces/IllegalNameEjection.tscn")
					return false
				if tier_of_appropropiateness == 1:
					return false
				else: 
					return true
			else: 
				return false
		else:
			return false
	else:
		return false

#creates the two tiers of illegal names
var tier1_illegalNames = ["butt", "poo", "toilet"]
var tier2_illegalNames = ["plop", "squark", "meow"]

#creates a matrix of illegal names 
var illegal_names = [tier1_illegalNames, tier2_illegalNames]

#function to check the inappropriateness tier of a name
func check_inappropriate(name):
	#loop through each tier
	for tier in range(0, len(illegal_names)): 
		var tier_names = illegal_names[tier]
		#check if the name is in the current tier
		for i in range(0, len(tier_names)):
					if name.find(tier_names[i]) != -1:
						return tier + 1
	#return 0 for no match
	return 0  

#when enter is pressed 
func on_enter_pressed():
	#if the legal checker is true then set the start time of the next level and set the player name
	if legalNameChecker(text) == true:
		Global.player_name = text
		Global.level_start_time = OS.get_ticks_msec()
		get_tree().change_scene("res://src/levels/Level1.tscn")
	#else show the error message
	else:
		get_node("RichTextLabel").visible = true
