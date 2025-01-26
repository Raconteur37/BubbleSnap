extends PanelContainer

var active = false

var activateType = ["None"]

var currentWave = GameManager.wave
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BoonManager.addBurst(self)

func _process(delta: float) -> void:
	if not active and GameManager.inWave:
		if GameManager.totalTime / 2 <= GameManager.mainTimer.time_left and GameManager.wave != currentWave:
			active = true
			currentWave = GameManager.wave
			GameManager.mainTimer.wait_time = GameManager.mainTimer.time_left / 2
	if GameManager.wave != currentWave:
		active = false
