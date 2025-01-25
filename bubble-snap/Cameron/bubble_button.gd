extends TextureButton

var audioPlayer
var particle

var popped : bool = false

var row : int
var col : int

func _ready() -> void:
	audioPlayer = $AudioStreamPlayer2D
	particle = $PopParticle
	BubbleManager.addToUnPopped(self)

func pop():
	popped = true
	particle.emitting = true
	disabled = true
	BubbleManager.addPop(self)
	BubbleManager.currPoppedCol = col
	BubbleManager.currPoppedRow = row
	var pitch : float = audioPlayer.pitch_scale + (BubbleManager.currentPops / BubbleManager.totalPopsNeeded * 1.5)
	audioPlayer.pitch_scale = pitch
	audioPlayer.play()

func _on_toggled(toggled_on: bool) -> void:
	pop()
