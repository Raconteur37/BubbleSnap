extends TextureButton

var audioPlayer

var popped : bool = false

var row : int
var col : int

func _ready() -> void:
	audioPlayer = $AudioStreamPlayer2D

func _on_toggled(toggled_on: bool) -> void:
	popped = true
	disabled = true
	BubbleManager.addPop()
	BubbleManager.currPoppedCol = col
	BubbleManager.currPoppedRow = row
	var pitch = BubbleManager.currentPops / BubbleManager.totalPopsNeeded + 1
	audioPlayer.pitch_scale = pitch
	audioPlayer.play()
