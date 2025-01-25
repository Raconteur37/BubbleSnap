extends Control

var hoverLabel

enum {Pop}

func _ready() -> void:
	hoverLabel = $MarginContainer2/HoverLabel

func _on_mouse_entered() -> void:
	hoverLabel.show()


func _on_mouse_exited() -> void:
	hoverLabel.hide()
