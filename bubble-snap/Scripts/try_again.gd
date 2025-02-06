extends Control

@export var try_again_anim: AnimationPlayer

func _on_try_again_pressed() -> void:
	try_again_anim.play("FadeOut")
	await (try_again_anim.animation_finished)
	GameManager.resetGame()
	queue_free()
