# Enemy module - handles enemy AI and behavior
extends "../core/base_module.gd"

# Enemy speed
@export var speed: float = 100

# Reference to the player
var player = null

func initialize() -> void:
	# Call parent method
	super.initialize()
	# Try to find the player in the scene
	player = get_tree().get_root().find_child("Player")
	# Insert here your enemy initialization code

func update(delta: float) -> void:
	# Call parent method
	super.update(delta)
	# Enemy update logic would go here in the context of the actual enemy node
	# Insert here your enemy update code

# Insert here your new enemy methods
# func your_custom_method() -> void:
#     pass