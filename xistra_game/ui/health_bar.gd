extends Control

# Health bar UI element

@onready var health_bar = $TextureProgressBar

func _ready():
	# Initialize health bar
	health_bar.max_value = 100
	health_bar.value = 100

func update_health(current, max):
	# Update health bar display
	health_bar.max_value = max
	health_bar.value = current