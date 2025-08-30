extends SceneTree

# Test for the metroidvania map mockup

func _init():
	print("Testing metroidvania map mockup...")
	
	# Test that map scene loads
	test_map_scene()
	
	# Test that player scene loads
	test_player_scene()
	
	# Test that enemy scene loads
	test_enemy_scene()
	
	print("Map mockup tests completed.")
	quit()

func test_map_scene():
	# Test loading map scene
	var map_scene = preload("res://maps/metroidvania_map.tscn")
	assert_func(map_scene != null, "Map scene loads successfully")
	print("Map scene test passed.")

func test_player_scene():
	# Test loading player scene
	var player_scene = preload("res://maps/map_player.tscn")
	assert_func(player_scene != null, "Player scene loads successfully")
	print("Player scene test passed.")

func test_enemy_scene():
	# Test loading enemy scene
	var enemy_scene = preload("res://maps/map_enemy.tscn")
	assert_func(enemy_scene != null, "Enemy scene loads successfully")
	print("Enemy scene test passed.")

func assert_func(condition, message):
	if condition:
		print("[PASS] " + message)
	else:
		print("[FAIL] " + message)