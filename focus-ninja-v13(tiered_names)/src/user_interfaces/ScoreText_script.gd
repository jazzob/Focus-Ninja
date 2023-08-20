extends RichTextLabel

#show the player's score
func _ready() -> void:
	bbcode_text = "[center]Score: " + str(Global.total_score) + "[/center]"

