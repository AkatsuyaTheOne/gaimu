# UI manager module - handles UI updates and interactions
extends "../core/base_module.gd"

func initialize() -> void:
	# Call parent method
	super.initialize()
	# Insert here your UI manager initialization code

func update_score(score: int) -> void:
	var score_label = get_parent().get_node_or_null("ScoreLabel")
	if score_label != null:
		score_label.text = "Score: " + str(score)

func show_game_over() -> void:
	var game_over_label = get_parent().get_node_or_null("GameOverLabel")
	if game_over_label != null:
		game_over_label.visible = true
		
	var restart_button = get_parent().get_node_or_null("RestartButton")
	if restart_button != null:
		restart_button.visible = true

# Insert here your new UI methods
# func your_custom_method() -> void:
#     pass