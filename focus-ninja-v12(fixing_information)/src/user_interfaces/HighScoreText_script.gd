extends RichTextLabel

#show the highscore
func _ready() -> void:
	#if the player's score is greater than the high score make their scor ethe high score
	if Global.total_score > Global.high_score:
		Global.high_score = Global.total_score
	bbcode_text = "[center]High score: " + str(Global.high_score) + "[/center]"

