extends TextureRect

@export var fade: AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade.play("FadeIn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	await fade.animation_finished
	queue_free()
