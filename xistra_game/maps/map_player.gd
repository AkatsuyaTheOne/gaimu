extends Area2D

# Player character for the mockup map
# Blue form with weapon-specific hit animations

class_name MapPlayer

# Player properties
var current_weapon = "Sacho"  # Default weapon
var weapons = ["Sacho", "Fouce", "Áncora"]
var weapon_index = 0
var weapon_switch_cooldown = 0.0

# Movement variables
var speed = 200.0
var velocity = Vector2(0, 0)
var gravity_scale = 800.0
var jump_speed = -300.0
var on_floor = false
var on_platform = false
var floor_y = 580  # Floor position

# Platform positions (y coordinates)
var platform_y_positions = [450, 350, 550, 250]  # Add more as needed
var platform_height = 20
var player_height = 32

func _ready():
	# Create a visual representation for the player
	create_player_visual()
	
	# Connect input signals
	set_process(true)
	
	# Ensure the player is visible
	show()

func create_player_visual():
	# Create a visual representation for the player
	if not has_node("Sprite2D"):
		print("ERROR: Sprite2D node not found in player scene")
		return
		
	var sprite = $Sprite2D
	
	# Create a simple colored texture using a different approach
	var texture = create_single_color_texture(Color(0.2, 0.4, 1.0))  # Blue color for player
	
	# Set texture to sprite
	sprite.texture = texture
	sprite.centered = true
	
	# Make sure the sprite is visible
	sprite.visible = true
	sprite.show()
	
	print("Player visual created with texture: ", texture != null)

func create_single_color_texture(color):
	# Create a 32x32 single color texture
	var image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	
	# Fill the entire image with the specified color
	image.fill(color)
	
	# Create and return texture
	var texture = ImageTexture.create_from_image(image)
	print("Texture created: ", texture != null)
	return texture

func _process(delta):
	# Update weapon switch cooldown
	if weapon_switch_cooldown > 0:
		weapon_switch_cooldown -= delta
	
	# Apply gravity
	if not on_floor and not on_platform:
		velocity.y += gravity_scale * delta
	
	# Handle movement
	var direction = Vector2()
	
	if Input.is_physical_key_pressed(KEY_RIGHT) or Input.is_physical_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_physical_key_pressed(KEY_LEFT) or Input.is_physical_key_pressed(KEY_A):
		direction.x -= 1
	
	if direction:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed * delta * 10)  # Faster deceleration

	# Handle jumping
	if (Input.is_physical_key_pressed(KEY_SPACE) or Input.is_physical_key_pressed(KEY_W) or Input.is_physical_key_pressed(KEY_UP)) and (on_floor or on_platform):
		velocity.y = jump_speed
		on_floor = false
		on_platform = false

	# Apply velocity
	position += velocity * delta
	
	# Platform collision detection
	on_platform = false
	var player_bottom = position.y + (player_height / 2)
	
	# Check collision with platforms
	for platform_y in platform_y_positions:
		var platform_top = platform_y - (platform_height / 2)
		var platform_bottom = platform_y + (platform_height / 2)
		
		# Check if player is falling and about to land on platform
		if velocity.y > 0 and player_bottom <= platform_top and player_bottom + velocity.y * delta >= platform_top:
			position.y = platform_y - (player_height / 2) - (platform_height / 2)
			velocity.y = 0
			on_platform = true
			break
	
	# Floor collision
	if position.y > floor_y - (player_height / 2):
		position.y = floor_y - (player_height / 2)
		velocity.y = 0
		on_floor = true
	else:
		on_floor = false
	
	# Handle weapon switching
	if (Input.is_physical_key_pressed(KEY_SPACE) and not (on_floor or on_platform) and weapon_switch_cooldown <= 0):
		switch_weapon()
		weapon_switch_cooldown = 0.3  # 0.3 second cooldown
	
	# Handle attacking
	if Input.is_physical_key_pressed(KEY_ENTER) or Input.is_physical_key_pressed(KEY_J):
		attack()

func switch_weapon():
	# Cycle through weapons
	weapon_index = (weapon_index + 1) % weapons.size()
	current_weapon = weapons[weapon_index]
	
	# Show hit animation based on weapon
	show_hit_animation()

func attack():
	# Perform attack based on current weapon
	show_hit_animation()
	
	# Create a temporary attack shape in front of player
	var attack_shape = ColorRect.new()
	attack_shape.color = Color(1.0, 1.0, 0.5, 0.7)  # Yellow with transparency
	attack_shape.size = Vector2(40, 20)
	
	# Position in front of player (based on direction or just to the right for demo)
	attack_shape.position = Vector2(position.x + 20, position.y - 10)
	
	# Add to scene
	get_parent().add_child(attack_shape)
	
	# Remove after a short time
	await get_tree().create_timer(0.1).timeout
	if is_instance_valid(attack_shape):
		attack_shape.queue_free()
	
	# Check for enemies in attack range
	var attack_area = RectangleShape2D.new()
	attack_area.size = Vector2(64, 64)  # Attack range
	
	# Get enemies in the area
	if get_world_2d() != null and get_world_2d().direct_space_state != null:
		var space_state = get_world_2d().direct_space_state
		var query = PhysicsShapeQueryParameters2D.new()
		query.shape = attack_area
		query.transform = Transform2D(0, position)
		
		var results = space_state.intersect_shape(query)
		
		# Damage enemies in range
		for result in results:
			if result.collider != null and result.collider.is_in_group("enemies"):
				result.collider.take_damage(10)

func show_hit_animation():
	# Show different hit animations based on current weapon
	# Check if Sprite2D exists before modifying it
	if $Sprite2D == null:
		return
		
	match current_weapon:
		"Sacho":
			sacho_hit_animation()
		"Fouce":
			fouce_hit_animation()
		"Áncora":
			ancora_hit_animation()

func sacho_hit_animation():
	# Balanced hoe attack animation
	$Sprite2D.modulate = Color(0.4, 0.6, 1.0)  # Lighter blue
	await get_tree().create_timer(0.1).timeout
	if is_instance_valid($Sprite2D):
		$Sprite2D.modulate = Color(0.2, 0.4, 1.0)  # Back to normal blue

func fouce_hit_animation():
	# Quick sickle attack animation
	$Sprite2D.modulate = Color(0.6, 0.8, 1.0)  # Even lighter blue
	await get_tree().create_timer(0.05).timeout
	if is_instance_valid($Sprite2D):
		$Sprite2D.modulate = Color(0.2, 0.4, 1.0)  # Back to normal blue

func ancora_hit_animation():
	# Slow but powerful anchor attack animation
	$Sprite2D.modulate = Color(0.1, 0.3, 0.8)  # Darker blue
	await get_tree().create_timer(0.2).timeout
	if is_instance_valid($Sprite2D):
		$Sprite2D.modulate = Color(0.2, 0.4, 1.0)  # Back to normal blue
