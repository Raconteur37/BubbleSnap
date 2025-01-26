extends AudioStreamPlayer2D

func _process(delta: float) -> void:
	if not playing:
		playing = true
	if playing and GameManager.inShop or GameManager.gameLost:
		pitch_scale = .7
	if playing and not GameManager.inShop and not GameManager.gameLost:
		pitch_scale = 1
