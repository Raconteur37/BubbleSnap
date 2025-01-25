extends TextureButton

var popped : bool = false

var row : int
var col : int

func _on_toggled(toggled_on: bool) -> void:
	popped = true
	if popped:
		disabled = true
