# Game manager module - handles game state and logic
extends "base_module.gd"

# Game variables
var score: float = 0
var game_over_flag: bool = false  # Renamed to avoid conflict

func initialize() -> void:
	# Call parent method
	super.initialize()
	# Insert here your game manager initialization code

func update(delta: float) -> void:
	# Call parent method
	super.update(delta)
	
	# Update score every second if game is not over
	if not game_over_flag and get_parent() != null:
		score += delta
		# Update score label if it exists
		var score_label = get_parent().get_node_or_null("ScoreLabel")
		if score_label != null:
			score_label.text = "Score: " + str(int(score))

func set_game_over() -> void:  # Renamed to avoid conflict
	game_over_flag = true
	# Stop enemy spawn timer if it exists
	var enemy_timer = get_parent().get_node_or_null("EnemyTimer")
	if enemy_timer != null:
		enemy_timer.stop()
		
	# Show game over UI
	var game_over_label = get_parent().get_node_or_null("GameOverLabel")
	if game_over_label != null:
		game_over_label.visible = true
		
	var restart_button = get_parent().get_node_or_null("RestartButton")
	if restart_button != null:
		restart_button.visible = true

func restart_game() -> void:
	get_tree().reload_current_scene()

# Insert here your new game manager methods
# func your_custom_method() -> void:
#     pass