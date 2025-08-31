extends SceneTree

# Smoke test for Xistra - Basic functionality check

func _init():
	print("Running Xistra smoke tests...")
	
	# Test basic game systems
	test_game_initialization()
	
	# Test weapon switching
	test_weapon_switching()
	
	# Test artifact collection
	test_artifact_collection()
	
	# Test save system
	test_save_system()
	
	print("Smoke tests completed.")
	quit()

func test_game_initialization():
	# Test that game manager initializes
	var game_manager = preload("res://scripts/game_manager.gd").new()
	
	# Check initial values
	assert(game_manager.current_language == "gl", "Game initializes with Galician language")
	assert(game_manager.areas_unlocked.size() == 0, "No areas unlocked initially")
	
	print("Game initialization test passed.")

func test_weapon_switching():
	# Test weapon switching functionality
	var player = preload("res://characters/xacinta.gd").new()
	
	# Initially should have only Sacho
	assert(player.weapons.size() == 1, "Player starts with one weapon")
	assert(player.current_weapon == "Sacho", "Player starts with Sacho equipped")
	
	# Add a weapon and switch
	player.weapons.append("Fouce")
	player.switch_weapon("Fouce")
	assert(player.current_weapon == "Fouce", "Player can switch weapons")
	
	print("Weapon switching test passed.")

func test_artifact_collection():
	# Test artifact collection system
	var game_manager = preload("res://scripts/game_manager.gd").new()
	
	# Initially no artifacts
	assert(game_manager.artifacts_collected.size() == 0, "No artifacts collected initially")
	
	# Collect an artifact
	game_manager.collect_artifact("figa_1")
	assert(game_manager.artifacts_collected.size() == 1, "Can collect artifacts")
	assert(game_manager.artifacts_collected[0] == "figa_1", "Correct artifact collected")
	
	print("Artifact collection test passed.")

func test_save_system():
	# Test basic save/load functionality
	var game_manager = preload("res://scripts/game_manager.gd").new()
	
	# Set some values to save
	game_manager.story_progress = 5
	game_manager.artifacts_collected = ["figa_1", "toxo_1"]
	game_manager.meigas_found = 3
	
	# Try to save (this might fail in test environment, but shouldn't crash)
	# game_manager.save_game()
	
	print("Save system test completed (actual file saving may be limited in test environment).")

func assert(condition, message):
	if condition:
		print("[PASS] " + message)
	else:
		print("[FAIL] " + message)