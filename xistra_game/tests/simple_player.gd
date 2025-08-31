extends Area2D

# Simplified player for testing

func _ready():
	create_simple_visual()

func create_simple_visual():
	if not has_node("Sprite2D"):
		print("ERROR: Sprite2D node not found")
		return
	
	var sprite = $Sprite2D
	
	# Create the simplest possible texture - a single white pixel
	var image = Image.create(1, 1, false, Image.FORMAT_RGBA8)
	image.set_pixel(0, 0, Color(0.2, 0.4, 1.0))  # Blue
	var texture = ImageTexture.create_from_image(image)
	
	sprite.texture = texture
	sprite.scale = Vector2(32, 32)  # Scale up to make it visible
	sprite.visible = true
	sprite.show()
	print("Player visual created")