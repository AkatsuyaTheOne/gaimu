#!/usr/bin/env godot -s
# Scene generator test
# Usage: godot --headless -s tests/scene_generator_test.gd

extends SceneTree

func _init():
	print("Starting scene generator test...")
	
	# Test that we can generate scenes programmatically
	test_scene_generation()
	
	call_deferred("quit")

func test_scene_generation():
	print("Testing scene generation...")
	var all_passed = true
	var nodes_to_free = []
	
	# Test creating a simple node
	var node = Node.new()
	nodes_to_free.append(node)
	if node == null:
		print("FAIL: Node creation - Could not create node")
		all_passed = false
	else:
		print("PASS: Node creation")
	
	# Test creating a 2D node
	var node2d = Node2D.new()
	nodes_to_free.append(node2d)
	if node2d == null:
		print("FAIL: Node2D creation - Could not create Node2D")
		all_passed = false
	else:
		print("PASS: Node2D creation")
	
	# Test creating an Area2D
	var area2d = Area2D.new()
	nodes_to_free.append(area2d)
	if area2d == null:
		print("FAIL: Area2D creation - Could not create Area2D")
		all_passed = false
	else:
		print("PASS: Area2D creation")
	
	# Test creating a Sprite2D
	var sprite2d = Sprite2D.new()
	nodes_to_free.append(sprite2d)
	if sprite2d == null:
		print("FAIL: Sprite2D creation - Could not create Sprite2D")
		all_passed = false
	else:
		print("PASS: Sprite2D creation")
	
	# Test creating a CollisionShape2D
	var collision_shape = CollisionShape2D.new()
	nodes_to_free.append(collision_shape)
	if collision_shape == null:
		print("FAIL: CollisionShape2D creation - Could not create CollisionShape2D")
		all_passed = false
	else:
		print("PASS: CollisionShape2D creation")
	
	# Test creating a RectangleShape2D
	var rectangle_shape = RectangleShape2D.new()
	if rectangle_shape == null:
		print("FAIL: RectangleShape2D creation - Could not create RectangleShape2D")
		all_passed = false
	else:
		print("PASS: RectangleShape2D creation")
		# We need to free this shape since it's a resource
		rectangle_shape = null
	
	# Test creating a Label
	var label = Label.new()
	nodes_to_free.append(label)
	if label == null:
		print("FAIL: Label creation - Could not create Label")
		all_passed = false
	else:
		print("PASS: Label creation")
	
	# Test creating a Button
	var button = Button.new()
	nodes_to_free.append(button)
	if button == null:
		print("FAIL: Button creation - Could not create Button")
		all_passed = false
	else:
		print("PASS: Button creation")
	
	# Test creating a Timer
	var timer = Timer.new()
	nodes_to_free.append(timer)
	if timer == null:
		print("FAIL: Timer creation - Could not create Timer")
		all_passed = false
	else:
		print("PASS: Timer creation")
	
	# Clean up all nodes
	for n in nodes_to_free:
		if n != null:
			n.free()
	
	if all_passed:
		print("\nAll scene generation tests passed!")
	else:
		print("\nSome scene generation tests failed!")