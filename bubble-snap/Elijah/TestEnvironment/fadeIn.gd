extends TextureRect

var transition_anim: AnimationPlayer

func _ready():
	transition_anim = $AnimationPlayer

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
