extends Node

#the global variable for player name
export var player_name: String = ""

#stopwatch does not start by default
var stopwatch_started = false
var elapsed_time = 0
var start_time = 0

#variables for calculating score
var total_score = 0
var level_start_time = 0
var stars_collected = 0
var enemies_killed = 0
var high_score = 0

#if the stopwatch has started add time to elapsed_time until it reaches 30 mins, then the user will be guided to a time out screen
func _process(delta: float):
	if stopwatch_started == true:
		var elapsed_time = OS.get_ticks_msec()/1000 - start_time
		if elapsed_time > 1800:
			get_tree().change_scene("res://src/user_interfaces/TimeOut.tscn")

#calculates the score
func calc_score(stars_collected: int, enemies_killed: int, level_start_time: int):
	#minuses the the milliseconds it took to complete the level from 60000
	var level_score = (60000 - (OS.get_ticks_msec() - level_start_time))
	#if due to a unusually high level completion time the is less than zero, set it to zero
	if level_score < 0:
		level_score = 0
	#add the kills and stars collected to the score
	level_score += 2000*(stars_collected + enemies_killed)
	#add the level score to the total score
	Global.total_score += level_score
