extends SceneTree

# Simple test scene to verify player and enemy instantiation

func _init():
	print("Testing instantiation of player and enemy...")
	
	# Create root node
	var root = Node2D.new()
	root.name = "Root"
	
	# Test player instantiation
	var player_scene = preload("res://maps/map_player.tscn")
	var player = player_scene.instantiate()
	player.position = Vector2(100, 100)
	root.add_child(player)
	
	# Test enemy instantiation
	var enemy_scene = preload("res://maps/map_enemy.tscn")
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(200, 200)
	enemy.set_shape("square")
	root.add_child(enemy)
	
	# Add root to scene tree
	current_scene = root
	
	# Wait one frame for initialization
	call_deferred("_check_objects", player, enemy)
	
	# Schedule cleanup and quit
	call_deferred("_cleanup", root)

func _check_objects(player, enemy):
	# Check if player has a sprite with texture
	if player.has_node("Sprite2D"):
		var sprite = player.get_node("Sprite2D")
		if sprite.texture != null:
			print("[PASS] Player instantiated with visible sprite")
		else:
			print("[FAIL] Player sprite missing texture")
	else:
		print("[FAIL] Player missing Sprite2D node")
	
	# Check if enemy has a sprite with texture
	if enemy.has_node("Sprite2D"):
		var sprite = enemy.get_node("Sprite2D")
		if sprite.texture != null:
			print("[PASS] Enemy instantiated with visible sprite")
		else:
			print("[FAIL] Enemy sprite missing texture")
	else:
		print("[FAIL] Enemy missing Sprite2D node")
	
	print("Instantiation test completed.")

func _cleanup(root):
	# Clean up
	root.queue_free()
	
	# Quit after a short delay
	create_timer(1.0).timeout.connect(quit)