# Smoke test for the game
# This script tests basic functionality of the game modules
extends Node

func _ready() -> void:
	print("Starting smoke test...")
	
	# Test module instantiation
	test_module_instantiation()
	
	# If we get here, all tests passed
	print("All smoke tests completed!")
	get_tree().quit()

func test_module_instantiation() -> void:
	print("Testing module instantiation...")
	
	# Try to create instances of our modules
	var test_node = Node.new()
	add_child(test_node)
	
	# Test BaseModule
	var base_module_script = load("res://modules/core/base_module.gd")
	if base_module_script == null:
		print("  ERROR: Failed to load BaseModule script")
		assert(false, "Failed to load BaseModule script")
	var base_module = base_module_script.new()
	if base_module == null:
		print("  ERROR: Failed to instantiate BaseModule")
		assert(false, "Failed to instantiate BaseModule")
	test_node.add_child(base_module)
	print("  BaseModule: OK")
	
	# Test PlayerModule
	var player_module_script = load("res://modules/player/player_module.gd")
	if player_module_script == null:
		print("  ERROR: Failed to load PlayerModule script")
		assert(false, "Failed to load PlayerModule script")
	var player_module = player_module_script.new()
	if player_module == null:
		print("  ERROR: Failed to instantiate PlayerModule")
		assert(false, "Failed to instantiate PlayerModule")
	test_node.add_child(player_module)
	print("  PlayerModule: OK")
	
	# Test EnemyModule
	var enemy_module_script = load("res://modules/enemy/enemy_module.gd")
	if enemy_module_script == null:
		print("  ERROR: Failed to load EnemyModule script")
		assert(false, "Failed to load EnemyModule script")
	var enemy_module = enemy_module_script.new()
	if enemy_module == null:
		print("  ERROR: Failed to instantiate EnemyModule")
		assert(false, "Failed to instantiate EnemyModule")
	test_node.add_child(enemy_module)
	print("  EnemyModule: OK")
	
	# Test GameManagerModule
	var game_manager_module_script = load("res://modules/managers/game_manager_module.gd")
	if game_manager_module_script == null:
		print("  ERROR: Failed to load GameManagerModule script")
		assert(false, "Failed to load GameManagerModule script")
	var game_manager_module = game_manager_module_script.new()
	if game_manager_module == null:
		print("  ERROR: Failed to instantiate GameManagerModule")
		assert(false, "Failed to instantiate GameManagerModule")
	test_node.add_child(game_manager_module)
	print("  GameManagerModule: OK")
	
	# Test EnemySpawnerModule
	var enemy_spawner_module_script = load("res://modules/managers/enemy_spawner_module.gd")
	if enemy_spawner_module_script == null:
		print("  ERROR: Failed to load EnemySpawnerModule script")
		assert(false, "Failed to load EnemySpawnerModule script")
	var enemy_spawner_module = enemy_spawner_module_script.new()
	if enemy_spawner_module == null:
		print("  ERROR: Failed to instantiate EnemySpawnerModule")
		assert(false, "Failed to instantiate EnemySpawnerModule")
	test_node.add_child(enemy_spawner_module)
	print("  EnemySpawnerModule: OK")
	
	# Test UIManagerModule
	var ui_manager_module_script = load("res://modules/ui/ui_manager_module.gd")
	if ui_manager_module_script == null:
		print("  ERROR: Failed to load UIManagerModule script")
		assert(false, "Failed to load UIManagerModule script")
	var ui_manager_module = ui_manager_module_script.new()
	if ui_manager_module == null:
		print("  ERROR: Failed to instantiate UIManagerModule")
		assert(false, "Failed to instantiate UIManagerModule")
	test_node.add_child(ui_manager_module)
	print("  UIManagerModule: OK")
	
	# Clean up
	test_node.queue_free()