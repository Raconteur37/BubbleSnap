extends TextureButton

func _on_pressed() -> void:
	if not GameManager.inWave and GameManager.started:
		print("next")
		GameManager.nextWave()
	else:
		print("start")
		BubbleBuilder.buildBubbles()
		GameManager.startGame()
