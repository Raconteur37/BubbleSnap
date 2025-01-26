extends PanelContainer

var activateType = ["None"]

func _ready() -> void:
	BoonManager.addBurst(self)

func _on_timer_timeout() -> void:
	if GameManager.inWave:
		if BubbleManager.poppedBubbleArray.size() > 0:
			BubbleManager.poppedBubbleArray.pick_random().resetState()
