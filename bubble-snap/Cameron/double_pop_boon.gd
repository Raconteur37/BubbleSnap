extends Control

var hoverLabel

var activateChance = 5

var activateType = "Pop"

func _ready() -> void:
	hoverLabel = $MarginContainer2/HoverLabel
	BoonManager.activeBoons.append(self)

func activate():
	if randi_range(0,100) <= activateChance:
		for bubble in BubbleManager.bubbleArray:
			pass

func _on_mouse_entered() -> void:
	hoverLabel.show()


func _on_mouse_exited() -> void:
	hoverLabel.hide()
