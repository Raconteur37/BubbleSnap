extends PanelContainer

var animationPlayer

var active = false

var activateType = ["None"]

var currentWave = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BoonManager.addBurst(self)
	animationPlayer = $AnimationPlayer

func _process(delta: float) -> void:
	if not active and GameManager.inWave:
		if GameManager.totalTime / 2 >= GameManager.mainTimer.time_left and GameManager.wave != currentWave:
			active = true
			animationPlayer.play("Shake")
			currentWave = GameManager.wave
			GameManager.mainTimer.stop()
			GameManager.mainTimer.wait_time = (GameManager.mainTimer.wait_time / 2) / 2
			GameManager.mainTimer.start()
			
	if GameManager.wave != currentWave:
		active = false
