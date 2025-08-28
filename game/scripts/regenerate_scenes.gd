#!/usr/bin/env godot -s
# Script to regenerate scene files
# Usage: godot -s scripts/regenerate_scenes.gd

extends SceneTree

func _init():
	print("Regenerating scene files...")
	
	# Regenerate player scene
	regenerate_player_scene()
	
	# Regenerate enemy scene
	regenerate_enemy_scene()
	
	# Regenerate main scene
	regenerate_main_scene()
	
	print("Scene files regenerated!")
	call_deferred("quit")

func regenerate_player_scene():
	print("Regenerating player scene...")
	
	# Create a new scene
	var scene = Node2D.new()
	scene.name = "Player"
	
	# Create player node
	var player = Area2D.new()
	player.name = "Player"
	player.set_script(load("res://scripts/player.gd"))
	player.collision_layer = 1
	player.collision_mask = 1
	scene.add_child(player)
	player.owner = scene
	
	# Create sprite
	var sprite = Sprite2D.new()
	sprite.name = "Sprite2D"
	sprite.texture = load("res://assets/sprites/player_sprite.png")
	player.add_child(sprite)
	sprite.owner = scene
	
	# Create collision shape
	var collision_shape = CollisionShape2D.new()
	collision_shape.name = "CollisionShape2D"
	collision_shape.position = Vector2(0, 0)
	player.add_child(collision_shape)
	collision_shape.owner = scene
	
	# Create rectangle shape resource
	var rectangle_shape = RectangleShape2D.new()
	rectangle_shape.size = Vector2(28, 28)
	collision_shape.shape = rectangle_shape
	
	# Save the scene
	var packed_scene = PackedScene.new()
	packed_scene.pack(scene)
	ResourceSaver.save(packed_scene, "res://scenes/player.tscn")
	
	# Clean up
	scene.free()

func regenerate_enemy_scene():
	print("Regenerating enemy scene...")
	
	# Create a new scene
	var scene = Node2D.new()
	scene.name = "Enemy"
	
	# Create enemy node
	var enemy = Area2D.new()
	enemy.name = "Enemy"
	enemy.set_script(load("res://scripts/enemy.gd"))
	enemy.collision_layer = 2
	enemy.collision_mask = 2
	scene.add_child(enemy)
	enemy.owner = scene
	
	# Create sprite
	var sprite = Sprite2D.new()
	sprite.name = "Sprite"
	sprite.texture = load("res://assets/sprites/enemy_sprite.png")
	enemy.add_child(sprite)
	sprite.owner = scene
	
	# Save the scene
	var packed_scene = PackedScene.new()
	packed_scene.pack(scene)
	ResourceSaver.save(packed_scene, "res://scenes/enemy.tscn")
	
	# Clean up
	scene.free()

func regenerate_main_scene():
	print("Regenerating main scene...")
	
	# Create a new scene
	var scene = Node2D.new()
	scene.name = "Main"
	scene.set_script(load("res://scripts/main.gd"))
	
	# Create player instance
	var player_scene = load("res://scenes/player.tscn")
	var player_instance = player_scene.instantiate()
	player_instance.name = "Player"
	player_instance.position = Vector2(640, 360)
	scene.add_child(player_instance)
	player_instance.owner = scene
	
	# Create score label
	var score_label = Label.new()
	score_label.name = "ScoreLabel"
	score_label.text = "Score: 0"
	score_label.anchor_right = 0.0
	score_label.anchor_bottom = 0.0
	score_label.margin_left = 10.0
	score_label.margin_top = 10.0
	score_label.margin_right = 200.0
	score_label.margin_bottom = 50.0
	scene.add_child(score_label)
	score_label.owner = scene
	
	# Create game over label
	var game_over_label = Label.new()
	game_over_label.name = "GameOverLabel"
	game_over_label.text = "Game Over!"
	game_over_label.visible = false
	game_over_label.anchor_right = 0.0
	game_over_label.anchor_bottom = 0.0
	game_over_label.margin_left = 590.0
	game_over_label.margin_top = 300.0
	game_over_label.margin_right = 830.0
	game_over_label.margin_bottom = 340.0
	game_over_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	scene.add_child(game_over_label)
	game_over_label.owner = scene
	
	# Create restart button
	var restart_button = Button.new()
	restart_button.name = "RestartButton"
	restart_button.text = "Restart Game"
	restart_button.visible = false
	restart_button.anchor_right = 0.0
	restart_button.anchor_bottom = 0.0
	restart_button.margin_left = 620.0
	restart_button.margin_top = 350.0
	restart_button.margin_right = 780.0
	restart_button.margin_bottom = 390.0
	restart_button.set_script(load("res://scripts/restart_button.gd"))
	scene.add_child(restart_button)
	restart_button.owner = scene
	
	# Create enemy timer
	var enemy_timer = Timer.new()
	enemy_timer.name = "EnemyTimer"
	enemy_timer.wait_time = 2.0
	enemy_timer.autostart = false
	scene.add_child(enemy_timer)
	enemy_timer.owner = scene
	
	# Save the scene
	var packed_scene = PackedScene.new()
	packed_scene.pack(scene)
	ResourceSaver.save(packed_scene, "res://scenes/main.tscn")
	
	# Clean up
	scene.free()