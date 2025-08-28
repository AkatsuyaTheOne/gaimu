extends Button

func _ready():
	pass

func _on_RestartButton_pressed():
	# This function will be called from the main script
	# Restart the game
	get_tree().reload_current_scene()