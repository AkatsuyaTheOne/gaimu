extends Area2D

# Enemy speed
export var speed = 100

# Reference to the player
var player = null

func _ready():
	# Try to find the player in the scene
	player = get_tree().get_root().find_node("Player", true, false)

func _process(delta):
	if player != null:
		# Move toward the player
		var direction = (player.position - position).normalized()
		position += direction * speed * delta