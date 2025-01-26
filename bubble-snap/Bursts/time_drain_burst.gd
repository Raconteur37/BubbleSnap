extends PanelContainer

var activateType = ["None"]

func _ready() -> void:
	BoonManager.addBurst(self)
	GameManager.totalTime -= 5
	$AnimationPlayer.play("Shake")
