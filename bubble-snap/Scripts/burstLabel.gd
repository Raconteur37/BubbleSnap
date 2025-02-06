extends Label

@onready var burstLabel = $"."

#var currFontSize = boonLabel.get_theme_default_font_size()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var label_length: int = burstLabel.get_total_character_count()
	var defaultLabelFontSize: int = burstLabel.get_theme_default_font_size()
	if label_length > 10:
		burstLabel.set("theme_override_font_sizes/font_size", (defaultLabelFontSize - (label_length - 10)))
	else:
		burstLabel.set("theme_override_font_sizes/font_size", defaultLabelFontSize)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
