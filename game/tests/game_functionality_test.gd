#!/usr/bin/env godot -s
# Game functionality test
# Usage: godot --headless -s tests/game_functionality_test.gd

extends SceneTree

var test_start_time = 0
var test_duration = 5.0  # Test for 5 seconds
var enemies_spawned = 0
var player_moved = false
var initial_player_pos = Vector2.ZERO

func _init():
	print("Starting game functionality test...")
	
	# Load and instantiate the main scene
	var main_scene = load("res://core/main.tscn")
	if main_scene == null:
		print("FAIL: Could not load main scene")
		quit()
		return
	
	var main_instance = main_scene.instantiate()
	if main_instance == null:
		print("FAIL: Could not instantiate main scene")
		quit()
		return
	
	# Add to root
	root.add_child(main_instance)
	
	# Store initial player position
	if main_instance.has_node("Player"):
		initial_player_pos = main_instance.get_node("Player").position
		print("Initial player position: ", initial_player_pos)
	
	# Start test timer
	test_start_time = Time.get_ticks_msec()
	
	# Schedule finish
	call_deferred("finish_test")

func finish_test():
	if (Time.get_ticks_msec() - test_start_time) / 1000.0 >= test_duration:
		# Check results
		check_test_results()
		quit()
	else:
		# Continue testing
		call_deferred("finish_test")

func check_test_results():
	print("\nTest Results:")
	print("- Test duration: ", test_duration, " seconds")
	print("- Enemies spawned: ", enemies_spawned)
	print("- Player moved: ", player_moved)
	
	if enemies_spawned > 0:
		print("PASS: Enemies are spawning")
	else:
		print("FAIL: No enemies spawned")
	
	if player_moved:
		print("PASS: Player can move")
	else:
		print("FAIL: Player did not move from initial position")
	
	print("\nGame functionality test completed!")