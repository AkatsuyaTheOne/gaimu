extends SceneTree

# Simple test to check texture creation

func _init():
	print("=== Texture Creation Test ===")
	
	# Create a simple test node
	var root = Node2D.new()
	root.name = "Root"
	
	# Test image creation
	var image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	print("Image created successfully: ", image != null)
	
	# Fill with color
	for x in range(32):
		for y in range(32):
			image.set_pixel(x, y, Color(1.0, 0.0, 0.0))  # Red color
	
	print("Image filled with color")
	
	# Create texture
	var texture = ImageTexture.create_from_image(image)
	print("Texture created successfully: ", texture != null)
	
	# Test with a sprite
	var sprite = Sprite2D.new()
	sprite.texture = texture
	print("Sprite texture set successfully: ", sprite.texture != null)
	
	print("=== Texture Creation Test Complete ===")
	
	# Clean up and quit
	root.queue_free()
	quit()