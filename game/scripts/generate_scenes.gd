#!/usr/bin/env godot -s
# Script to generate fresh scene files
# Usage: godot -s scripts/generate_scenes.gd

extends SceneTree

func _init():
	# Generate fresh scene files
	generate_player_scene()
	generate_enemy_scene()
	generate_main_scene()
	
	print("Scene files generated successfully!")
	call_deferred("quit")

func generate_player_scene():
	print("Generating player scene...")
	
	# Create the root node
	var root = Node2D.new()
	root.name = "Root"
	
	# Create player node
	var player = Area2D.new()
	player.name = "Player"
	player.set_script(load("res://scripts/player.gd"))
	player.collision_layer = 1
	player.collision_mask = 1
	root.add_child(player)
	player.owner = root
	
	# Create sprite
	var sprite = Sprite2D.new()
	sprite.name = "Sprite2D"
	sprite.texture = load("res://assets/sprites/player_sprite.png")
	player.add_child(sprite)
	sprite.owner = root
	
	# Create collision shape node
	var collision_shape_node = CollisionShape2D.new()
	collision_shape_node.name = "CollisionShape2D"
	collision_shape_node.position = Vector2(0, 0)
	player.add_child(collision_shape_node)
	collision_shape_node.owner = root
	
	# Create rectangle shape resource
	var rectangle_shape = RectangleShape2D.new()
	rectangle_shape.size = Vector2(28, 28)
	collision_shape_node.shape = rectangle_shape
	
	# Pack and save the scene
	var packed_scene = PackedScene.new()
	packed_scene.pack(root)
	ResourceSaver.save(packed_scene, "res://scenes/player.tscn")
	
	# Clean up
	root.free()

func generate_enemy_scene():
	print("Generating enemy scene...")
	
	# Create the root node
	var root = Node2D.new()
	root.name = "Root"
	
	# Create enemy node
	var enemy = Area2D.new()
	enemy.name = "Enemy"
	enemy.set_script(load("res://scripts/enemy.gd"))
	enemy.collision_layer = 2
	enemy.collision_mask = 2
	root.add_child(enemy)
	enemy.owner = root
	
	# Create sprite
	var sprite = Sprite2D.new()
	sprite.name = "Sprite"
	sprite.texture = load("res://assets/sprites/enemy_sprite.png")
	enemy.add_child(sprite)
	sprite.owner = root
	
	# Pack and save the scene
	var packed_scene = PackedScene.new()
	packed_scene.pack(root)
	ResourceSaver.save(packed_scene, "res://scenes/enemy.tscn")
	
	# Clean up
	root.free()

func generate_main_scene():
	print("Generating main scene...")
	
	# Create the root node
	var root = Node2D.new()
	root.name = "Main"
	root.set_script(load("res://scripts/main.gd"))
	
	# Create player instance
	var player_scene = load("res://scenes/player.tscn")
	var player_instance = player_scene.instantiate()
	player_instance.name = "Player"
	player_instance.position = Vector2(640, 360)
	root.add_child(player_instance)
	player_instance.owner = root
	
	# Create score label
	var score_label = Label.new()
	score_label.name = "ScoreLabel"
	score_label.text = "Score: 0"
	score_label.anchor_right = 0.0
	score_label.anchor_bottom = 0.0
	score_label.set("margin_left", 10.0)
	score_label.set("margin_top", 10.0)
	score_label.set("margin_right", 200.0)
	score_label.set("margin_bottom", 50.0)
	root.add_child(score_label)
	score_label.owner = root
	
	# Create game over label
	var game_over_label = Label.new()
	game_over_label.name = "GameOverLabel"
	game_over_label.text = "Game Over!"
	game_over_label.visible = false
	game_over_label.anchor_right = 0.0
	game_over_label.anchor_bottom = 0.0
	game_over_label.set("margin_left", 590.0)
	game_over_label.set("margin_top", 300.0)
	game_over_label.set("margin_right", 830.0)
	game_over_label.set("margin_bottom", 340.0)
	game_over_label.horizontal_alignment = 1  # HORIZONTAL_ALIGNMENT_CENTER
	root.add_child(game_over_label)
	game_over_label.owner = root
	
	# Create restart button
	var restart_button = Button.new()
	restart_button.name = "RestartButton"
	restart_button.text = "Restart Game"
	restart_button.visible = false
	restart_button.anchor_right = 0.0
	restart_button.anchor_bottom = 0.0
	restart_button.set("margin_left", 620.0)
	restart_button.set("margin_top", 350.0)
	restart_button.set("margin_right", 780.0)
	restart_button.set("margin_bottom", 390.0)
	restart_button.set_script(load("res://scripts/restart_button.gd"))
	root.add_child(restart_button)
	restart_button.owner = root
	
	# Create enemy timer
	var enemy_timer = Timer.new()
	enemy_timer.name = "EnemyTimer"
	enemy_timer.wait_time = 2.0
	enemy_timer.autostart = false
	root.add_child(enemy_timer)
	enemy_timer.owner = root
	
	# Pack and save the scene
	var packed_scene = PackedScene.new()
	packed_scene.pack(root)
	ResourceSaver.save(packed_scene, "res://scenes/main.tscn")
	
	# Clean up
	root.free()