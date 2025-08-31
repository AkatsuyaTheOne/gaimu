extends CharacterBody2D

# O veciño - The neighbor enemy

# Enemy properties
var health = 30
var damage = 5
var speed = 100.0

# Animation
var direction = 1

func _physics_process(delta):
	# Simple patrol movement
	velocity.x = speed * direction
	
	# Simple collision detection for turning around
	if is_on_wall():
		direction *= -1
		$Sprite2D.flip_h = not $Sprite2D.flip_h
	
	move_and_slide()

func take_damage(damage_amount):
	health -= damage_amount
	if health <= 0:
		die()

func die():
	# Drop Fouce weapon when defeated
	get_parent().get_node("GameManager").player_node.weapons.append("Fouce")
	queue_free()