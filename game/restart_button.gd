extends Button

func _ready():
	connect("pressed", self, "_on_RestartButton_pressed")

func _on_RestartButton_pressed():
	# Restart the game
	get_tree().reload_current_scene()