extends Node

# Path to the next scene
@export var next_scene_path: String = "res://Game.tscn"

func _on_pressed() -> void:
	get_tree().change_scene_to_file(next_scene_path)
