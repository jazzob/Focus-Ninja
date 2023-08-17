extends Node

#the global variable for player name
export var player_name: String = ""

#stopwatch does not start by default
var stopwatch_started = false
var elapsed_time = 0
var start_time = 0

#if the stopwatch has started add time to elapsed_time until it reaches 30 mins, then the user will be guided to a time out screen
func _process(delta: float):
	if stopwatch_started == true:
		var elapsed_time = OS.get_ticks_msec()/1000 - start_time
		if elapsed_time > 1800:
			get_tree().change_scene("res://src/user_interfaces/TimeOut.tscn")

