#!/usr/bin/env godot -s
# Simple test to verify file organization
# Usage: godot --headless -s core/organization_test.gd

extends SceneTree

func _init():
	print("Starting organization test...")
	
	# Test that we can load the main scene file
	test_scene_loading()
	
	call_deferred("quit")

func test_scene_loading():
	print("Testing scene loading...")
	var all_passed = true
	
	# Test main scene
	var main_scene = load("res://core/main.tscn")
	if main_scene == null:
		print("FAIL: Main scene loading - Could not load main scene")
		all_passed = false
	else:
		print("PASS: Main scene loading")
	
	# Test player scene
	var player_scene = load("res://player/player.tscn")
	if player_scene == null:
		print("FAIL: Player scene loading - Could not load player scene")
		all_passed = false
	else:
		print("PASS: Player scene loading")
	
	# Test enemy scene
	var enemy_scene = load("res://enemy/enemy.tscn")
	if enemy_scene == null:
		print("FAIL: Enemy scene loading - Could not load enemy scene")
		all_passed = false
	else:
		print("PASS: Enemy scene loading")
	
	# Test that we can load the main script
	var main_script = load("res://core/main.gd")
	if main_script == null:
		print("FAIL: Main script loading - Could not load main script")
		all_passed = false
	else:
		print("PASS: Main script loading")
	
	# Test that we can load the player script
	var player_script = load("res://player/player.gd")
	if player_script == null:
		print("FAIL: Player script loading - Could not load player script")
		all_passed = false
	else:
		print("PASS: Player script loading")
	
	# Test that we can load the enemy script
	var enemy_script = load("res://enemy/enemy.gd")
	if enemy_script == null:
		print("FAIL: Enemy script loading - Could not load enemy script")
		all_passed = false
	else:
		print("PASS: Enemy script loading")
	
	if all_passed:
		print("\nAll organization tests passed!")
	else:
		print("\nSome organization tests failed!")