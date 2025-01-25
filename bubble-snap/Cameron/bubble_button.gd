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
	var pitch : float = audioPlayer.pitch_scale + (BubbleManager.currentPops / BubbleManager.totalPopsNeeded * 1.5)
	print(pitch)
	audioPlayer.pitch_scale = pitch
	audioPlayer.play()
