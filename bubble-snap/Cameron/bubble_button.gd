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

func pop(type):
	print(type)
	popped = true
	particle.emitting = true
	disabled = true
	BubbleManager.addPop(self,type)
	BubbleManager.currPoppedCol = col
	BubbleManager.currPoppedRow = row
	var pitch : float = audioPlayer.pitch_scale + (GameManager.currentPops / GameManager.totalPopsNeeded * 1.5)
	audioPlayer.pitch_scale = pitch
	audioPlayer.play()

func resetState():
	button_pressed = false
	popped = false
	disabled = false

func _on_toggled(toggled_on: bool) -> void:
	if button_pressed:
		pop("Player Pop")
