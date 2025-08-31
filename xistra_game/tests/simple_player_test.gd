extends SceneTree

func _init():
	print("=== Simple Player Test ===")
	
	# Create root
	var root = Node2D.new()
	current_scene = root
	
	# Load simple player
	var player_scene = preload("res://tests/simple_player.tscn")
	var player = player_scene.instantiate()
	player.position = Vector2(200, 200)
	root.add_child(player)
	
	# Wait for initialization
	call_deferred("_check_player", player, root)

func _check_player(player, root):
	# Wait a couple frames for initialization
	await create_timer(0.1).timeout
	
	print("Player instantiated")
	
	if player.has_node("Sprite2D"):
		var sprite = player.get_node("Sprite2D")
		print("Sprite exists: ", sprite != null)
		print("Sprite visible: ", sprite.visible)
		print("Sprite texture: ", sprite.texture)
		print("Sprite scale: ", sprite.scale)
	else:
		print("Sprite2D not found")
	
	print("=== Simple Player Test Complete ===")
	
	# Clean up
	root.queue_free()
	await create_timer(0.5).timeout
	quit()