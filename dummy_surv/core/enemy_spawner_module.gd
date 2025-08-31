# Enemy spawner module - handles enemy spawning logic
extends "base_module.gd"

var enemy_scene = preload("res://enemy/enemy.tscn")

func initialize() -> void:
	# Call parent method
	super.initialize()
	# Insert here your spawner initialization code

func spawn_enemy(parent_node: Node, screen_size: Vector2) -> void:
	# Create a new enemy instance
	var enemy = enemy_scene.instantiate()
	
	# Position the enemy at a random location on the screen edges
	var side = randi() % 4  # 0=top, 1=right, 2=bottom, 3=left
	
	match side:
		0:  # Top
			enemy.position = Vector2(randf_range(0, screen_size.x), 0)
		1:  # Right
			enemy.position = Vector2(screen_size.x, randf_range(0, screen_size.y))
		2:  # Bottom
			enemy.position = Vector2(randf_range(0, screen_size.x), screen_size.y)
		3:  # Left
			enemy.position = Vector2(0, randf_range(0, screen_size.y))
	
	# Add the enemy to the scene
	parent_node.add_child(enemy)

# Insert here your new spawner methods
# func spawn_special_enemy() -> void:
#     pass