extends CharacterBody2D

# Xacinta - Main character of Xistra
# A woman in her fifties with a farmer background

# Movement variables
const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Player stats
var health = 100
var max_health = 100
var level = 1
var experience = 0

# Weapons
var current_weapon = "Sacho"  # Default weapon
var weapons = ["Sacho"]  # List of available weapons
var weapon_cooldown = 0.0

# Abilities
var abilities = []

# Galician artifacts collected
var artifacts = []

# Physics
var gravity = 1200.0

func _ready():
	# Initialize the player
	pass

func _physics_process(delta):
	# Handle gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Handle jumping
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle weapon attacks
	if weapon_cooldown > 0:
		weapon_cooldown -= delta

	if Input.is_action_just_pressed("attack") and weapon_cooldown <= 0:
		attack()

	move_and_slide()

func attack():
	# Basic attack with current weapon
	match current_weapon:
		"Sacho":
			sacho_attack()
		"Fouce":
			fouce_attack()
		"Áncora":
			ancora_attack()
		_:
			# Default attack
			sacho_attack()

func sacho_attack():
	# Balanced hoe attack
	print("Attacking with Sacho!")
	weapon_cooldown = 0.5

func fouce_attack():
	# Quick sickle attack
	print("Attacking with Fouce!")
	weapon_cooldown = 0.3

func ancora_attack():
	# Slow but powerful anchor attack
	print("Attacking with Áncora!")
	weapon_cooldown = 1.0

func collect_artifact(artifact_name):
	# Add artifact to collection
	if not artifact_name in artifacts:
		artifacts.append(artifact_name)
		apply_artifact_bonus(artifact_name)

func apply_artifact_bonus(artifact_name):
	# Apply bonuses from collected artifacts
	match artifact_name:
		"figa_1":
			max_health += 20
			health = min(health + 20, max_health)
		"figa_2":
			# Enhance Sacho
			pass
		"toxo_1":
			# Enhance Fouce
			pass
		"onda_1":
			# Enhance Áncora
			pass

func switch_weapon(weapon_name):
	# Switch to a different weapon if available
	if weapon_name in weapons:
		current_weapon = weapon_name
		print("Switched to weapon: " + weapon_name)