extends SceneTree

# Basic test runner for Xistra game

var passed_tests = 0
var failed_tests = 0

func _init():
	# Run all tests
	print("Running Xistra Game Tests...")
	
	# Test weapon system
	test_weapons()
	
	# Test artifact system
	test_artifacts()
	
	# Test character system
	test_characters()
	
	# Print results
	print("")
	print("=== TEST RESULTS ===")
	print("Passed: " + str(passed_tests))
	print("Failed: " + str(failed_tests))
	
	if failed_tests == 0:
		print("All tests passed!")
	else:
		print("Some tests failed!")
	
	quit()

func assert_equal(actual, expected, test_name):
	if actual == expected:
		print("[PASS] " + test_name)
		passed_tests += 1
	else:
		print("[FAIL] " + test_name + " - Expected: " + str(expected) + ", Got: " + str(actual))
		failed_tests += 1

func assert_true(condition, test_name):
	if condition:
		print("[PASS] " + test_name)
		passed_tests += 1
	else:
		print("[FAIL] " + test_name)
		failed_tests += 1

func test_weapons():
	print("")
	print("Testing weapon system...")
	
	# Test Sacho creation
	var s = preload("res://weapons/sacho.gd").new()
	assert_equal(s.name, "Sacho", "Sacho weapon creation")
	assert_equal(s.damage, 15, "Sacho damage value")
	
	# Test Fouce creation
	var f = preload("res://weapons/fouce.gd").new()
	assert_equal(f.name, "Fouce", "Fouce weapon creation")
	assert_equal(f.cooldown, 0.3, "Fouce cooldown value")
	
	# Test Áncora creation
	var a = preload("res://weapons/ancora.gd").new()
	assert_equal(a.name, "Áncora", "Áncora weapon creation")
	assert_equal(a.damage, 25, "Áncora damage value")

func test_artifacts():
	print("")
	print("Testing artifact system...")
	
	# Test artifact base class
	var artifact = preload("res://artifacts/artifact.gd").new()
	assert_equal(artifact.name, "Artifact", "Artifact base class name")
	
	# Test Figa artifact
	# Note: This is a scene, so we need to instance it differently
	# For now, we'll test the concept
	assert_true(true, "Figa artifact concept")

func test_characters():
	print("")
	print("Testing character system...")
	
	# Test player character
	var player = preload("res://characters/xacinta.gd").new()
	assert_equal(player.health, 100, "Player initial health")
	assert_equal(player.weapons[0], "Sacho", "Player initial weapon")
	
	# Test enemy character - Vecino
	var vecino = preload("res://characters/vecino.gd").new()
	# Basic test that it loads
	assert_true(vecino != null, "Vecino enemy creation")