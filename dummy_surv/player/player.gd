extends Area2D

# Movement speed
@export var speed: float = 200

# Screen boundaries
var screen_size: Vector2

func _ready():
	screen_size = get_viewport_rect().size
	# Add to players group (if needed)
	add_to_group("player")

func _process(delta):
	var velocity := Vector2.ZERO
	
	# Handle input
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	# Normalize velocity for diagonal movement
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	# Move the player
	position += velocity * delta
	
	# Keep player on screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)