extends Node2D

# Game variables
var score = 0
var game_over = false
var enemy_scene = preload("res://enemy.tscn")

func _ready():
	# Start the game
	$ScoreLabel.text = "Score: 0"
	# Start enemy spawn timer
	$EnemyTimer.start()

func _process(delta):
	if not game_over:
		# Update score every second
		score += delta
		$ScoreLabel.text = "Score: " + str(int(score))

func _on_EnemyTimer_timeout():
	if not game_over:
		# Spawn a new enemy
		spawn_enemy()

func spawn_enemy():
	# Create a new enemy instance
	var enemy = enemy_scene.instance()
	
	# Position the enemy at a random location on the screen edges
	var screen_size = get_viewport_rect().size
	var side = randi() % 4  # 0=top, 1=right, 2=bottom, 3=left
	
	match side:
		0:  # Top
			enemy.position = Vector2(randf() * screen_size.x, 0)
		1:  # Right
			enemy.position = Vector2(screen_size.x, randf() * screen_size.y)
		2:  # Bottom
			enemy.position = Vector2(randf() * screen_size.x, screen_size.y)
		3:  # Left
			enemy.position = Vector2(0, randf() * screen_size.y)
	
	# Add the enemy to the scene
	add_child(enemy)

func _on_Player_area_entered(area):
	if area.is_in_group("enemies"):
		# Game over when player touches an enemy
		game_over = true
		$EnemyTimer.stop()
		$GameOverLabel.visible = true
		$RestartButton.visible = true

func _on_RestartButton_pressed():
	# Restart the game
	get_tree().reload_current_scene()