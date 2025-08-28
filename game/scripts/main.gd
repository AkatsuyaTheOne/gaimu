extends Node2D

# Game variables
var score: float = 0
var game_over: bool = false
var enemy_scene = preload("res://scenes/enemy.tscn")

@onready var score_label = $ScoreLabel
@onready var game_over_label = $GameOverLabel
@onready var restart_button = $RestartButton
@onready var enemy_timer = $EnemyTimer

func _ready():
	# Start the game
	score_label.text = "Score: 0"
	# Start enemy spawn timer
	enemy_timer.start()
	# Connect restart button signal
	restart_button.connect("pressed", _on_RestartButton_pressed)

func _process(delta):
	if not game_over:
		# Update score every second
		score += delta
		score_label.text = "Score: " + str(int(score))

func _on_EnemyTimer_timeout():
	if not game_over:
		# Spawn a new enemy
		spawn_enemy()

func spawn_enemy():
	# Create a new enemy instance
	var enemy = enemy_scene.instantiate()
	
	# Position the enemy at a random location on the screen edges
	var screen_size = get_viewport_rect().size
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
	add_child(enemy)

func _on_Player_area_entered(area):
	if area.is_in_group("enemies"):
		# Game over when player touches an enemy
		game_over = true
		enemy_timer.stop()
		game_over_label.visible = true
		restart_button.visible = true

func _on_RestartButton_pressed():
	# Restart the game using the game manager
	get_node("/root/GameManager").restart_game()
