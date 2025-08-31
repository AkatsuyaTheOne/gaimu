# Player module - handles player movement and behavior
extends "../core/base_module.gd"

# Movement speed
@export var speed: float = 200

# Screen boundaries
var screen_size: Vector2

func _ready() -> void:
	# Screen size will be set by the parent node that has access to viewport
	pass

func initialize() -> void:
	# Call parent method
	super.initialize()
	# Insert here your player initialization code

func set_screen_size(size: Vector2) -> void:
	screen_size = size

func update(delta: float) -> void:
	# Call parent method
	super.update(delta)
	# Player update logic would go here in the context of the actual player node
	# Insert here your player update code

# Insert here your new player methods
# func your_custom_method() -> void:
#     pass