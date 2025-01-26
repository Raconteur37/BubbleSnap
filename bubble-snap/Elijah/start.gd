extends Node

# Path to the next scene
@export var next_scene_path: String = "res://Game.tscn"

var transition_anim: AnimationPlayer

func _ready():
	transition_anim = $"../../TextureRect/AnimationPlayer"

func _on_pressed() -> void:
	transition_anim.play("FadeToBlack")
	
	await transition_anim.animation_finished
	
	get_tree().change_scene_to_file(next_scene_path)
