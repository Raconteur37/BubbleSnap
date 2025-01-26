extends PanelContainer

var active = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BoonManager.addBurst(self)

func _process(delta: float) -> void:
	if not active:
		if GameManager.totalTime / 2 <= GameManager.mainTimer.time_left:
			active = true
			GameManager.mainTimer.time_Scale = 2
