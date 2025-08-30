extends SceneTree

func _init():
	print("=== Debug Test ===")
	
	# Create root node
	var root = Node2D.new()
	root.name = "Root"
	current_scene = root
	
	# Load and instantiate the test player scene
	var player_scene = preload("res://tests/test_player.tscn")
	var player = player_scene.instantiate()
	player.position = Vector2(200, 200)
	root.add_child(player)
	
	# Wait a frame for initialization
	call_deferred("_check_player", player, root)

func _check_player(player, root):
	# Check if the player node exists and has a Sprite2D
	print("Player node exists: ", player != null)
	print("Player has Sprite2D: ", player.has_node("Sprite2D"))
	
	if player.has_node("Sprite2D"):
		var sprite = player.get_node("Sprite2D")
		print("Sprite2D node exists: ", sprite != null)
		print("Sprite2D visible: ", sprite.visible)
		print("Sprite2D texture: ", sprite.texture)
	
	print("=== Debug Test Complete ===")
	
	# Clean up and quit
	root.queue_free()
	await create_timer(0.5).timeout
	quit()