# Simple smoke test that can be run from command line
# Usage: godot --headless -s smoke_test_cli.gd

extends SceneTree

func _init():
	print("Starting smoke test...")
	
	# Test that we can load all module scripts
	test_module_loading()
	
	# Delay quitting to let the engine finish
	call_deferred("quit")

func test_module_loading():
	print("Testing module loading...")
	var all_passed = true
	
	# Test BaseModule
	var base_module_script = load("res://modules/core/base_module.gd")
	if base_module_script == null:
		print("FAIL: BaseModule loading - Could not load script")
		all_passed = false
	else:
		print("PASS: BaseModule loading")
	
	# Test PlayerModule
	var player_module_script = load("res://modules/player/player_module.gd")
	if player_module_script == null:
		print("FAIL: PlayerModule loading - Could not load script")
		all_passed = false
	else:
		print("PASS: PlayerModule loading")
	
	# Test EnemyModule
	var enemy_module_script = load("res://modules/enemy/enemy_module.gd")
	if enemy_module_script == null:
		print("FAIL: EnemyModule loading - Could not load script")
		all_passed = false
	else:
		print("PASS: EnemyModule loading")
	
	# Test GameManagerModule
	var game_manager_module_script = load("res://modules/managers/game_manager_module.gd")
	if game_manager_module_script == null:
		print("FAIL: GameManagerModule loading - Could not load script")
		all_passed = false
	else:
		print("PASS: GameManagerModule loading")
	
	# Test EnemySpawnerModule
	var enemy_spawner_module_script = load("res://modules/managers/enemy_spawner_module.gd")
	if enemy_spawner_module_script == null:
		print("FAIL: EnemySpawnerModule loading - Could not load script")
		all_passed = false
	else:
		print("PASS: EnemySpawnerModule loading")
	
	# Test UIManagerModule
	var ui_manager_module_script = load("res://modules/ui/ui_manager_module.gd")
	if ui_manager_module_script == null:
		print("FAIL: UIManagerModule loading - Could not load script")
		all_passed = false
	else:
		print("PASS: UIManagerModule loading")
	
	if all_passed:
		print("\nAll tests passed!")
	else:
		print("\nSome tests failed!")