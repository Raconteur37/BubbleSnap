extends CPUParticles2D

#needs to reference the game timer
@onready var lifetime_tween = create_tween()
@onready var timer_node = $Timer
var total_game_time = GameManager.totalTime

# GameManager.mainTimer.time_left
# GameManager.totalTime

func _ready():
	emitting = false #starts with particle not displayed
	lifetime_tween.tween_interval(total_game_time / 2)
	
func _process(delta: float) -> void:
	if GameManager.inWave:
		lifetime_tween.tween_callback(func():
			emitting = true
		   
		   # Tween speed scale gradually increasing
			var speed_tween = create_tween()
			speed_tween.tween_property(self, "speed_scale", 2.0, total_game_time / 2)
		)
	
	
