extends PanelContainer

var activateType = ["None"]

var animationPlayer

func _ready() -> void:
	BoonManager.addBurst(self)
	animationPlayer = $AnimationPlayer

func _on_timer_timeout() -> void:
	if GameManager.inWave:
		if BubbleManager.poppedBubbleArray.size() > 0:
			var button = BubbleManager.poppedBubbleArray.pick_random()
			BubbleManager.subtractPop(button)
			button.resetState()
			animationPlayer.play("Shake")
			#GameManager.currentPops -= 1
