extends CharacterBody2D

# O morto da costa - The dead of the coast (pirate)

# Enemy properties
var health = 50
var damage = 10
var speed = 80.0

func _physics_process(delta):
	# Move toward player if in range
	var player = get_parent().get_node("Player")
	if player:
		var direction = (player.position - position).normalized()
		velocity = direction * speed
		move_and_slide()

func take_damage(damage_amount):
	health -= damage_amount
	if health <= 0:
		die()

func die():
	# Drop Áncora weapon when defeated
	get_parent().get_node("GameManager").player_node.weapons.append("Áncora")
	queue_free()