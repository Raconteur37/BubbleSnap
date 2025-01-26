extends TextureRect

func _on_animation_player_animation_finished() -> void:
	queue_free()
