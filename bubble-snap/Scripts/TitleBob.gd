extends Label

# Parameters for customization
@export var bob_speed: float = 1.0       # Speed of the vertical bob
@export var bob_amplitude: float = 10.0 # Amplitude of the bobbing
@export var tilt_speed: float = 1.0     # Speed of the rotation
@export var tilt_amplitude: float = 5.0 # Amplitude of the tilting (in degrees)

# Original position for bobbing
var original_position: Vector2

func _ready():
	# Save the original position
	original_position = position

func _process(delta):
	# Calculate the bobbing effect
	var bob_offset = bob_amplitude * sin(2 * PI * bob_speed * Time.get_ticks_msec() / 1000.0)
	position.y = original_position.y + bob_offset
	
	# Calculate the teeter-tottering effect
	var tilt_angle = tilt_amplitude * sin(2 * PI * tilt_speed * Time.get_ticks_msec() / 1000.0)
	rotation_degrees = tilt_angle
