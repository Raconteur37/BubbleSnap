extends PanelContainer

var activateType = ["None"]

var animationPlayer

func _ready() -> void:
	BoonManager.addBurst(self)
	animationPlayer = $AnimationPlayer

func _on_timer_timeout() -> void:
	if GameManager.inWave:
		if BubbleManager.poppedBubbleArray.size() > 0:
			BubbleManager.poppedBubbleArray.pick_random().resetState()
			animationPlayer.play("Shake")
