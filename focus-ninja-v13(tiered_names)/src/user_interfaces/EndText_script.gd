extends RichTextLabel

#show congratulations message using the player's name
func _ready() -> void:
	bbcode_text = "[center]Contgratulations " + Global.player_name + "![/center]"

