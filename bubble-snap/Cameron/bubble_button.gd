extends TextureButton

var popped : bool = false

var row : int
var col : int

func _on_toggled(toggled_on: bool) -> void:
	popped = true
	disabled = true
	BubbleManager.addPop()
	BubbleManager.currPoppedCol = col
	BubbleManager.currPoppedRow = row
