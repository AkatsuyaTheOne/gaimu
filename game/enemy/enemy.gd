extends Area2D

# Enemy speed
@export var speed: float = 100

# Reference to the player
var player = null

func _ready():
	# Try to find the player in the scene
	player = get_tree().get_root().get_node("Main").find_child("Player")
	# If that doesn't work, try a different approach
	if player == null:
		player = get_tree().get_nodes_in_group("player")[0] if get_tree().get_nodes_in_group("player").size() > 0 else null
	# Add to enemies group
	add_to_group("enemies")
	
	print("Enemy spawned. Player found: ", player != null)
	if player != null:
		print("Player position: ", player.position)

func _process(delta):
	if player != null:
		# Move toward the player
		var direction = (player.position - position).normalized()
		position += direction * speed * delta
	else:
		# Try to find player again if not found
		player = get_tree().get_root().get_node("Main").find_child("Player")
		if player == null:
			player = get_tree().get_nodes_in_group("player")[0] if get_tree().get_nodes_in_group("player").size() > 0 else null