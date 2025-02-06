extends Label

@onready var boonLabel = $"."

#var currFontSize = boonLabel.get_theme_default_font_size()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var label_length: int = boonLabel.get_total_character_count()
	var defaultLabelFontSize: int = boonLabel.get_theme_default_font_size()
	if label_length > 10:
		boonLabel.set("theme_override_font_sizes/font_size", (18 - (label_length - 10)))
	else:
		boonLabel.set("theme_override_font_sizes/font_size", 18)
		
