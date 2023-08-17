tool
extends Area2D

#creates variable for fade_in animation
onready var anim_player: AnimationPlayer = $AnimationPlayer


#variable to enable switching between scenes
export var next_scene: PackedScene

#creates a custom configuration warning for developer
func _get_configuration_warning() -> String:
	return "The next scene property can't be empty" if not next_scene else ""

#plays the fade to black animation and then switches scenes
func teleport() -> void: 
	anim_player.play("Fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)
		

#if the player enters the portal the teleport function will be played
func _on_Portal2D_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		teleport()
