extends SceneTree

# Test to verify player and enemy spawning fixes

func _init():
	print("Testing player and enemy spawning fixes...")
	
	# Load the map scene
	var map_scene = preload("res://maps/metroidvania_map.tscn")
	var map = map_scene.instantiate()
	
	# Add to scene tree
	current_scene = map
	
	# Wait one frame for initialization
	call_deferred("_check_spawning", map)
	
	# Schedule cleanup and quit
	call_deferred("_cleanup", map)

func _check_spawning(map):
	# Check if player exists and is visible
	var player = map.get_node("Player")
	if player != null:
		print("[PASS] Player node exists")
		if player.visible:
			print("[PASS] Player is visible")
		else:
			print("[FAIL] Player is not visible")
	else:
		print("[FAIL] Player node does not exist")
	
	# Check if enemies exist and are visible
	var enemy1 = map.get_node("Enemy1")
	if enemy1 != null:
		print("[PASS] Enemy1 node exists")
		if enemy1.visible:
			print("[PASS] Enemy1 is visible")
			# Check if enemy has proper shape
			if enemy1.shape == "square":
				print("[PASS] Enemy1 has correct shape")
			else:
				print("[FAIL] Enemy1 has incorrect shape: " + enemy1.shape)
		else:
			print("[FAIL] Enemy1 is not visible")
	else:
		print("[FAIL] Enemy1 node does not exist")
	
	# Check other enemies
	var enemies = ["Enemy2", "Enemy3", "Enemy4"]
	var shapes = ["triangle", "circle", "diamond"]
	
	for i in range(enemies.size()):
		var enemy = map.get_node(enemies[i])
		if enemy != null:
			print("[PASS] " + enemies[i] + " node exists")
			if enemy.visible:
				print("[PASS] " + enemies[i] + " is visible")
				# Check if enemy has proper shape
				if enemy.shape == shapes[i]:
					print("[PASS] " + enemies[i] + " has correct shape")
				else:
					print("[FAIL] " + enemies[i] + " has incorrect shape: " + enemy.shape)
			else:
				print("[FAIL] " + enemies[i] + " is not visible")
		else:
			print("[FAIL] " + enemies[i] + " node does not exist")
	
	print("Spawn fix test completed.")

func _cleanup(map):
	# Clean up
	map.queue_free()
	
	# Quit after a short delay
	create_timer(1.0).timeout.connect(quit)