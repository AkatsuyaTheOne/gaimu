extends Area2D

# Enemy for the mockup map
# Red geometric forms

class_name MapEnemy

# Enemy properties
var enemy_type = "basic"
var health = 30
var shape = "square"

func _ready():
	# Create a visual representation for the enemy
	create_enemy_visual()
	
	# Add to enemies group
	add_to_group("enemies")
	
	# Ensure the enemy is visible
	show()

func set_shape(new_shape):
	# Set the enemy's geometric shape
	shape = new_shape
	create_enemy_visual()

func create_enemy_visual():
	# Create a visual representation for the enemy
	if not has_node("Sprite2D"):
		print("ERROR: Sprite2D node not found in enemy scene")
		return
		
	var sprite = $Sprite2D
	
	# Create texture based on shape
	var texture = null
	match shape:
		"square":
			texture = create_square_texture()
		"triangle":
			texture = create_triangle_texture()
		"circle":
			texture = create_circle_texture()
		"diamond":
			texture = create_diamond_texture()
		_:
			texture = create_square_texture()  # Default to square
	
	# Set texture to sprite
	sprite.texture = texture
	sprite.centered = true
	
	# Make sure the sprite is visible
	sprite.visible = true
	sprite.show()
	
	print("Enemy visual created with texture: ", texture != null)

func create_square_texture():
	# Create a red square texture
	var image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	
	# Fill background with transparent color
	image.fill(Color(0, 0, 0, 0))
	
	# Draw red square in the center
	for x in range(8, 24):
		for y in range(8, 24):
			image.set_pixel(x, y, Color(1.0, 0.2, 0.2))
	
	return ImageTexture.create_from_image(image)

func create_triangle_texture():
	# Create a red triangle texture
	var image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	
	# Fill background with transparent color
	image.fill(Color(0, 0, 0, 0))
	
	# Draw red triangle
	for y in range(24):
		var width = int((1.0 - float(y) / 24.0) * 16)
		for x in range(max(0, 16 - width), min(32, 16 + width)):
			image.set_pixel(x, y, Color(1.0, 0.2, 0.2))
	
	return ImageTexture.create_from_image(image)

func create_circle_texture():
	# Create a red circle texture
	var image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	
	# Fill background with transparent color
	image.fill(Color(0, 0, 0, 0))
	
	# Draw red circle
	var center = Vector2(16, 16)
	var radius = 8
	for x in range(32):
		for y in range(32):
			var distance = (Vector2(x, y) - center).length()
			if distance <= radius:
				image.set_pixel(x, y, Color(1.0, 0.2, 0.2))
	
	return ImageTexture.create_from_image(image)

func create_diamond_texture():
	# Create a red diamond texture
	var image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	
	# Fill background with transparent color
	image.fill(Color(0, 0, 0, 0))
	
	# Draw red diamond
	var center = Vector2(16, 16)
	for x in range(32):
		for y in range(32):
			var distance = abs(x - center.x) + abs(y - center.y)
			if distance <= 8:
				image.set_pixel(x, y, Color(1.0, 0.2, 0.2))
	
	return ImageTexture.create_from_image(image)

func draw_square(image):
	# Draw a red square
	for x in range(8, 24):
		for y in range(8, 24):
			image.set_pixel(x, y, Color(1.0, 0.2, 0.2))

func draw_triangle(image):
	# Draw a red triangle
	for y in range(24):
		var width = int((1.0 - float(y) / 24.0) * 16)
		for x in range(max(0, 16 - width), min(32, 16 + width)):
			image.set_pixel(x, y, Color(1.0, 0.2, 0.2))

func draw_circle_shape(image):
	# Draw a red circle
	var center = Vector2(16, 16)
	var radius = 8
	for x in range(32):
		for y in range(32):
			var distance = (Vector2(x, y) - center).length()
			if distance <= radius:
				image.set_pixel(x, y, Color(1.0, 0.2, 0.2))

func draw_diamond(image):
	# Draw a red diamond
	var center = Vector2(16, 16)
	for x in range(32):
		for y in range(32):
			var distance = abs(x - center.x) + abs(y - center.y)
			if distance <= 8:
				image.set_pixel(x, y, Color(1.0, 0.2, 0.2))

func take_damage(damage):
	# Simple damage effect
	health -= damage
	
	# Flash white when hit (if sprite exists)
	if $Sprite2D != null:
		$Sprite2D.modulate = Color(1.0, 1.0, 1.0)  # White
		await get_tree().create_timer(0.1).timeout
		if $Sprite2D != null and is_instance_valid($Sprite2D):
			$Sprite2D.modulate = Color(1.0, 0.2, 0.2)  # Back to red
	
	if health <= 0:
		die()

func die():
	# Remove enemy when defeated
	queue_free()
