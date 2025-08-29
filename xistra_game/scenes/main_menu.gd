extends Control

# Main menu for Xistra game

func _ready():
	# Connect buttons
	$VBoxContainer/NewGameButton.pressed.connect(_on_new_game_pressed)
	$VBoxContainer/LoadGameButton.pressed.connect(_on_load_game_pressed)
	$VBoxContainer/QuitButton.pressed.connect(_on_quit_pressed)

func _on_new_game_pressed():
	# Start a new game
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_load_game_pressed():
	# Load saved game
	var game_manager = get_node("/root/GameManager")
	if game_manager.load_game():
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	else:
		# Show error message
		$VBoxContainer/ErrorMessage.show()

func _on_quit_pressed():
	# Quit the game
	get_tree().quit()