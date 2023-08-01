extends RichTextLabel


func _ready() -> void:
	var text = "Contgratulations " + Global.player_name + "!"
	set_bbcode(text)

