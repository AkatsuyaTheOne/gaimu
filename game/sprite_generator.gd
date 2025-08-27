extends Node2D

# This script generates simple placeholder sprites
# Add this script to a temporary scene to generate PNG files

func _ready():
	# Generate player sprite (blue square)
	generate_sprite("res://player_sprite.png", Color(0.2, 0.6, 1.0), Color(0.1, 0.3, 0.8))
	
	# Generate enemy sprite (red circle)
	generate_enemy_sprite("res://enemy_sprite.png", Color(1.0, 0.2, 0.2), Color(0.8, 0.1, 0.1))
	
	print("Placeholder sprites generated!")

# Generate a square sprite
func generate_sprite(path, fill_color, border_color):
	var image = Image.new()
	image.create(32, 32, false, Image.FORMAT_RGBA8)
	
	# Fill with background color
	image.fill(Color(0, 0, 0, 0))
	
	# Draw square
	var rect = Rect2(4, 4, 24, 24)
	
	# Draw border
	for x in range(rect.position.x, rect.position.x + rect.size.x):
		for y in range(rect.position.y, rect.position.y + rect.size.y):
			if x < rect.position.x + 2 or x >= rect.position.x + rect.size.x - 2 or \
			   y < rect.position.y + 2 or y >= rect.position.y + rect.size.y - 2:
				image.set_pixel(x, y, border_color)
			else:
				image.set_pixel(x, y, fill_color)
	
	# Save image
	image.save_png(path)

# Generate a circle sprite
func generate_enemy_sprite(path, fill_color, border_color):
	var image = Image.new()
	image.create(32, 32, false, Image.FORMAT_RGBA8)
	
	# Fill with background color
	image.fill(Color(0, 0, 0, 0))
	
	# Draw circle
	var center = Vector2(16, 16)
	var radius = 12
	
	for x in range(32):
		for y in range(32):
			var distance = center.distance_to(Vector2(x, y))
			if distance <= radius and distance >= radius - 2:
				# Border
				image.set_pixel(x, y, border_color)
			elif distance < radius - 2:
				# Fill
				image.set_pixel(x, y, fill_color)
	
	# Save image
	image.save_png(path)