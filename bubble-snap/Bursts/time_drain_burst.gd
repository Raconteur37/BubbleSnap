extends PanelContainer

var activateType = "none"

func _ready() -> void:
	BoonManager.addBurst(self)
	GameManager.totalTime -= 10
