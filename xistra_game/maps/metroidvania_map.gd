extends Node2D

# Mockup metroidvania map for Xistra
# Features different areas with enemies and obstacles

func _ready():
	# Initialize the map
	print("Initializing map...")
	create_map_areas()
	initialize_scene_enemies()
	spawn_enemies()
	setup_obstacles()
	print("Map initialization complete.")

func initialize_scene_enemies():
	# Initialize the enemies that are part of the scene file
	var enemy1 = get_node("Enemy1")
	if enemy1 != null:
		enemy1.set_shape("square")
	
	var enemy2 = get_node("Enemy2")
	if enemy2 != null:
		enemy2.set_shape("triangle")
	
	var enemy3 = get_node("Enemy3")
	if enemy3 != null:
		enemy3.set_shape("circle")
	
	var enemy4 = get_node("Enemy4")
	if enemy4 != null:
		enemy4.set_shape("diamond")

func create_map_areas():
	# Create different themed areas of the map
	# Each area will have a different background color for visual distinction
	
	# Area 1: Starting area (light green)
	var area1 = ColorRect.new()
	area1.color = Color(0.7, 0.9, 0.7, 0.3)  # Light green with transparency
	area1.position = Vector2(0, 0)
	area1.size = Vector2(300, 300)
	add_child(area1)
	
	# Area 2: Forest area (dark green)
	var area2 = ColorRect.new()
	area2.color = Color(0.3, 0.6, 0.3, 0.3)  # Dark green with transparency
	area2.position = Vector2(300, 0)
	area2.size = Vector2(300, 300)
	add_child(area2)
	
	# Area 3: Coastal area (blue)
	var area3 = ColorRect.new()
	area3.color = Color(0.4, 0.6, 0.9, 0.3)  # Blue with transparency
	area3.position = Vector2(0, 300)
	area3.size = Vector2(300, 300)
	add_child(area3)
	
	# Area 4: Mountain area (gray)
	var area4 = ColorRect.new()
	area4.color = Color(0.6, 0.6, 0.6, 0.3)  # Gray with transparency
	area4.position = Vector2(300, 300)
	area4.size = Vector2(300, 300)
	add_child(area4)

func spawn_enemies():
	# Spawn enemies in different areas with different geometric shapes
	
	# Basic square enemies in starting area
	spawn_enemy(Vector2(100, 100), "square")
	spawn_enemy(Vector2(200, 200), "square")
	
	# Triangle enemies in forest area
	spawn_enemy(Vector2(400, 100), "triangle")
	spawn_enemy(Vector2(500, 200), "triangle")
	
	# Circle enemies in coastal area
	spawn_enemy(Vector2(100, 400), "circle")
	spawn_enemy(Vector2(200, 500), "circle")
	
	# Diamond enemies in mountain area
	spawn_enemy(Vector2(400, 400), "diamond")
	spawn_enemy(Vector2(500, 500), "diamond")

func spawn_enemy(position, shape):
	# Spawn an enemy with a specific geometric shape
	var enemy_scene = preload("res://maps/map_enemy.tscn")
	var enemy = enemy_scene.instantiate()
	enemy.position = position
	enemy.set_shape(shape)
	add_child(enemy)

func setup_obstacles():
	# Create some obstacles to make the map more interesting
	# These represent walls, platforms, and other environmental elements
	
	# Floor (visual only for demo)
	var floor = Node2D.new()
	floor.name = "Floor"
	
	# Floor visual
	var floor_rect = ColorRect.new()
	floor_rect.color = Color(0.4, 0.2, 0.1)
	floor_rect.position = Vector2(0, 580)
	floor_rect.size = Vector2(600, 20)
	floor.add_child(floor_rect)
	
	add_child(floor)
	
	# More platforms for better navigation
	# Platform 1
	var platform1 = Node2D.new()
	platform1.name = "Platform1"
	
	# Platform visual
	var platform1_rect = ColorRect.new()
	platform1_rect.color = Color(0.5, 0.3, 0.1)
	platform1_rect.position = Vector2(50, 450)
	platform1_rect.size = Vector2(80, 20)
	platform1.add_child(platform1_rect)
	
	add_child(platform1)
	
	# Platform 2
	var platform2 = Node2D.new()
	platform2.name = "Platform2"
	
	# Platform visual
	var platform2_rect = ColorRect.new()
	platform2_rect.color = Color(0.5, 0.3, 0.1)
	platform2_rect.position = Vector2(200, 350)
	platform2_rect.size = Vector2(80, 20)
	platform2.add_child(platform2_rect)
	
	add_child(platform2)
	
	# Platform 3
	var platform3 = Node2D.new()
	platform3.name = "Platform3"
	
	# Platform visual
	var platform3_rect = ColorRect.new()
	platform3_rect.color = Color(0.5, 0.3, 0.1)
	platform3_rect.position = Vector2(350, 450)
	platform3_rect.size = Vector2(80, 20)
	platform3.add_child(platform3_rect)
	
	add_child(platform3)
	
	# Platform 4
	var platform4 = Node2D.new()
	platform4.name = "Platform4"
	
	# Platform visual
	var platform4_rect = ColorRect.new()
	platform4_rect.color = Color(0.5, 0.3, 0.1)
	platform4_rect.position = Vector2(500, 350)
	platform4_rect.size = Vector2(80, 20)
	platform4.add_child(platform4_rect)
	
	add_child(platform4)
	
	# Additional platforms
	# Platform 5
	var platform5 = Node2D.new()
	platform5.name = "Platform5"
	
	# Platform visual
	var platform5_rect = ColorRect.new()
	platform5_rect.color = Color(0.5, 0.3, 0.1)
	platform5_rect.position = Vector2(150, 250)
	platform5_rect.size = Vector2(80, 20)
	platform5.add_child(platform5_rect)
	
	add_child(platform5)
	
	# Platform 6
	var platform6 = Node2D.new()
	platform6.name = "Platform6"
	
	# Platform visual
	var platform6_rect = ColorRect.new()
	platform6_rect.color = Color(0.5, 0.3, 0.1)
	platform6_rect.position = Vector2(400, 250)
	platform6_rect.size = Vector2(80, 20)
	platform6.add_child(platform6_rect)
	
	add_child(platform6)
	
	# Platform 7
	var platform7 = Node2D.new()
	platform7.name = "Platform7"
	
	# Platform visual
	var platform7_rect = ColorRect.new()
	platform7_rect.color = Color(0.5, 0.3, 0.1)
	platform7_rect.position = Vector2(250, 150)
	platform7_rect.size = Vector2(80, 20)
	platform7.add_child(platform7_rect)
	
	add_child(platform7)
	
	# Horizontal wall
	var wall1 = Node2D.new()
	wall1.name = "Wall1"
	
	# Wall visual
	var wall1_rect = ColorRect.new()
	wall1_rect.color = Color(0.3, 0.3, 0.3)
	wall1_rect.position = Vector2(150, 150)
	wall1_rect.size = Vector2(300, 20)
	wall1.add_child(wall1_rect)
	
	add_child(wall1)
	
	# Vertical wall
	var wall2 = Node2D.new()
	wall2.name = "Wall2"
	
	# Wall visual
	var wall2_rect = ColorRect.new()
	wall2_rect.color = Color(0.3, 0.3, 0.3)
	wall2_rect.position = Vector2(400, 200)
	wall2_rect.size = Vector2(20, 200)
	wall2.add_child(wall2_rect)
	
	add_child(wall2)