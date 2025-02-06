extends Panel

@onready var flavorText = $MarginContainer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	flavorText.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	flavorText.visible = true
	pass # Replace with function body.

func _on_mouse_exited() -> void:
	flavorText.visible = false
	pass # Replace with function body.
