extends Control

var hoverLabel

signal activate

enum ActivateType {Pop}

func _ready() -> void:
	activate.connect(popRandomBubble())
	hoverLabel = $MarginContainer2/HoverLabel

func popRandomBubble():
	print("wooho")

func _on_mouse_entered() -> void:
	hoverLabel.show()


func _on_mouse_exited() -> void:
	hoverLabel.hide()
