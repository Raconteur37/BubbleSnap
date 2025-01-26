extends Node

# Path to the next scene
@export var next_scene_path: String = "res://Elijah/TestEnvironment/MainGameScene.tscn"

@export var transition_anim: AnimationPlayer

func _on_start_button_pressed() -> void:
	transition_anim.play("FadeToBlack")
	await transition_anim.animation_finished
	get_tree().change_scene_to_file(next_scene_path)

func _on_quit_pressed() -> void:
	transition_anim.play("FadeToBlack")
	await transition_anim.animation_finished
	get_tree().quit()
