extends PanelContainer

var activateType = ["None"]

var animationPlayer

func _ready() -> void:
	BoonManager.addBurst(self)
	animationPlayer = $AnimationPlayer

func _on_timer_timeout() -> void:
	$Timer.wait_time = randi_range(5,10)
	if GameManager.inWave:
		if BubbleManager.poppedBubbleArray.size() > 0:
			var randNum = randi_range(0,8)
			for bubble in BubbleManager.poppedBubbleArray:
				if bubble.row == randNum or bubble.row == randNum-1 or bubble.row == randNum+1:
					if bubble.col == 4 or bubble.col == 5 or bubble.col == 3:
						bubble.resetState()
						animationPlayer.play("Shake")
						#GameManager.currentPops -= 1
