extends Node2D

# Test scene to verify player and enemy visibility

func _ready():
	print("=== Visibility Test ===")
	
	# Create a simple test scene
	var map = Node2D.new()
	map.name = "Map"
	add_child(map)
	
	# Test player instantiation
	var player_scene = preload("res://maps/map_player.tscn")
	var player = player_scene.instantiate()
	player.name = "TestPlayer"
	player.position = Vector2(100, 100)
	map.add_child(player)
	
	# Wait for player to initialize
	await get_tree().process_frame
	await get_tree().process_frame
	
	# Check player visibility
	if player.has_node("Sprite2D"):
		var sprite = player.get_node("Sprite2D")
		print("Player Sprite2D exists: ", sprite != null)
		print("Player Sprite2D visible: ", sprite.visible if sprite != null else false)
		print("Player Sprite2D texture set: ", sprite.texture != null if sprite != null else false)
	else:
		print("Player Sprite2D node NOT found")
	
	# Test enemy instantiation
	var enemy_scene = preload("res://maps/map_enemy.tscn")
	var enemy = enemy_scene.instantiate()
	enemy.name = "TestEnemy"
	enemy.position = Vector2(200, 200)
	enemy.set_shape("square")
	map.add_child(enemy)
	
	# Wait for enemy to initialize
	await get_tree().process_frame
	await get_tree().process_frame
	
	# Check enemy visibility
	if enemy.has_node("Sprite2D"):
		var sprite = enemy.get_node("Sprite2D")
		print("Enemy Sprite2D exists: ", sprite != null)
		print("Enemy Sprite2D visible: ", sprite.visible if sprite != null else false)
		print("Enemy Sprite2D texture set: ", sprite.texture != null if sprite != null else false)
	else:
		print("Enemy Sprite2D node NOT found")
	
	print("=== Visibility Test Complete ===")
	
	# Clean up and quit
	map.queue_free()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()