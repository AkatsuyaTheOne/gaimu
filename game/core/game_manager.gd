extends Node

# Global game manager

func _ready():
	pass

# Function to restart the game
func restart_game():
	get_tree().reload_current_scene()