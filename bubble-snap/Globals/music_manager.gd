extends AudioStreamPlayer2D

func _process(delta: float) -> void:
	if not playing and GameManager.inWave:
		playing = true
	if playing and GameManager.inShop:
		pitch_scale = .7
	if playing and not GameManager.inShop:
		pitch_scale = 1
