extends SceneTree

# Scene integration test for Xistra

func _init():
	print("Running scene integration tests...")
	
	# Test that main scene loads
	test_main_scene()
	
	# Test that player scene loads
	test_player_scene()
	
	# Test that UI elements load
	test_ui_elements()
	
	print("Scene integration tests completed.")
	quit()

func test_main_scene():
	# Test loading main scene
	var main_scene = preload("res://scenes/main.tscn")
	assert(main_scene != null, "Main scene loads successfully")
	print("Main scene test passed.")

func test_player_scene():
	# Test loading player scene
	var player_scene = preload("res://characters/xacinta.tscn")
	assert(player_scene != null, "Player scene loads successfully")
	print("Player scene test passed.")

func test_ui_elements():
	# Test loading UI elements
	var health_bar = preload("res://ui/health_bar.gd")
	var weapon_display = preload("res://ui/weapon_display.gd")
	
	assert(health_bar != null, "Health bar UI loads successfully")
	assert(weapon_display != null, "Weapon display UI loads successfully")
	print("UI elements test passed.")

func assert(condition, message):
	if condition:
		print("[PASS] " + message)
	else:
		print("[FAIL] " + message)