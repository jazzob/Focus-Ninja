extends Control

#when the "Play" button is pressed change scene to the enter name scene and start stopwatch
func _on_Play_pressed() -> void:
	#starts the stopwatch and sets the start time
	Global.start_time = OS.get_ticks_msec()/1000
	Global.stopwatch_started = true
	#reset the score
	Global.total_score = 0
	get_tree().change_scene("res://src/user_interfaces/EnterName.tscn")

#when the "How to play" button is pressed change scene to the how to play scene
func _on_How_to_Play_pressed() -> void:
	get_tree().change_scene("res://src/user_interfaces/HowToPlay.tscn")

#When the "Exit" button is presed exit the game
func _on_Exit_pressed() -> void:
	get_tree().quit()
