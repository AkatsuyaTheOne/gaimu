#!/usr/bin/env godot -s
# Script to run all tests
# Usage: godot --headless -s tests/run_all_tests.gd

extends SceneTree

func _init():
	print("Running all tests...")
	print("=" * 40)
	
	# Run organization test
	run_test("Organization Test", "res://tests/organization_test.gd")
	
	# Run smoke test
	run_test("Module Smoke Test", "res://tests/smoke_test_cli.gd")
	
	# Run scene generator test
	run_test("Scene Generator Test", "res://tests/scene_generator_test.gd")
	
	print("=" * 40)
	print("All tests completed!")
	call_deferred("quit")

func run_test(test_name, script_path):
	print("\n" + test_name + ":")
	print("-" * (test_name.length() + 1))
	
	# Load and run the test
	var test_script = load(script_path)
	if test_script != null:
		# Create an instance of the test script
		var test_instance = test_script.new()
		if test_instance != null:
			print("PASS: " + test_name + " executed successfully")
			# Clean up
			if test_instance.has_method("free"):
				test_instance.free()
		else:
			print("FAIL: " + test_name + " - Could not instantiate test")
	else:
		print("FAIL: " + test_name + " - Could not load test script")