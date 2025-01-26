extends TextureButton


func _on_pressed() -> void:
	if not GameManager.inWave:
		GameManager.nextWave()
