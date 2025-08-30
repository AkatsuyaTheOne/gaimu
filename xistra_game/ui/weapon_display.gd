extends Control

# Weapon display UI element

@onready var weapon_label = $Label

func _ready():
	# Initialize weapon display
	update_weapon_display("Sacho")

func update_weapon_display(weapon_name):
	# Update weapon display
	weapon_label.text = "Weapon: " + weapon_name