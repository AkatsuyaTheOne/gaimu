# Main game script - orchestrates all modules
extends Node2D

# Module references
var game_manager_module: GameManagerModule
var enemy_spawner_module: EnemySpawnerModule

@onready var score_label = $ScoreLabel
@onready var game_over_label = $GameOverLabel
@onready var restart_button = $RestartButton
@onready var enemy_timer = $EnemyTimer

func _ready() -> void:
	# Initialize modules
	initialize_modules()
	
	# Start the game
	score_label.text = "Score: 0"
	# Start enemy spawn timer
	enemy_timer.start()
	# Connect restart button signal
	restart_button.connect("pressed", _on_RestartButton_pressed)

func initialize_modules() -> void:
	# Initialize game manager module
	game_manager_module = GameManagerModule.new()
	add_child(game_manager_module)
	game_manager_module.initialize()
	
	# Initialize enemy spawner module
	enemy_spawner_module = EnemySpawnerModule.new()
	add_child(enemy_spawner_module)
	enemy_spawner_module.initialize()

func _process(delta: float) -> void:
	# Update all modules
	if game_manager_module != null:
		game_manager_module.update(delta)

func _on_EnemyTimer_timeout() -> void:
	if game_manager_module != null and not game_manager_module.game_over:
		# Spawn a new enemy
		if enemy_spawner_module != null:
			enemy_spawner_module.spawn_enemy()

func _on_Player_area_entered(area) -> void:
	if area.is_in_group("enemies"):
		# Game over when player touches an enemy
		if game_manager_module != null:
			game_manager_module.game_over()

func _on_RestartButton_pressed() -> void:
	# Restart the game
	if game_manager_module != null:
		game_manager_module.restart_game()