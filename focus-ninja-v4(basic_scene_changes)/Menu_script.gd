extends Control


func _on_Play_pressed() -> void:
	get_tree().change_scene("res://src/levels/LevelTemplate.tscn")


func _on_How_to_Play_pressed() -> void:
	get_tree().change_scene("res://src/levels/HowToPlay.tscn")


func _on_Options_pressed() -> void:
	get_tree().quit()
