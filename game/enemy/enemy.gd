extends Area2D

# Enemy speed
@export var speed: float = 100

# Reference to the player
var player = null

func _ready():
	# Try to find the player in the scene
	player = get_tree().get_root().find_child("Player")
	# Add to enemies group
	add_to_group("enemies")

func _process(delta):
	if player != null:
		# Move toward the player
		var direction = (player.position - position).normalized()
		position += direction * speed * delta