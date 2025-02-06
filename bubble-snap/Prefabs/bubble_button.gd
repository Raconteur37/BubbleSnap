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
	GameManager.currentPops += 1
	popped = true
	particle.emitting = true
	disabled = true
	BubbleManager.currPoppedCol = col
	BubbleManager.currPoppedRow = row
	BubbleManager.lastPopped = self
	BubbleManager.addPop(self,type)
	var pitch : float = audioPlayer.pitch_scale + (GameManager.currentPops / GameManager.totalPopsNeeded * 1.5)
	audioPlayer.pitch_scale = pitch
	audioPlayer.play()

func resetState():
	audioPlayer.pitch_scale = 1
	button_pressed = false
	popped = false
	disabled = false

func _on_toggled(toggled_on: bool) -> void:
	if button_pressed:
		if GameManager.inWave:
			pop("Player Pop")
