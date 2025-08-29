extends Area2D

# Horreo - Save point based on traditional Galician granaries

# Save point properties
var is_active = false

func _ready():
	# Connect signal
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# When player enters save point
	if body.name == "Xacinta":
		activate_save_point()

func activate_save_point():
	# Activate save point and save game
	if not is_active:
		is_active = true
		$AnimationPlayer.play("activate")
		get_parent().get_node("GameManager").save_game()

func _on_animation_finished(anim_name):
	# Handle animation finished
	if anim_name == "activate":
		$Sprite2D.frame = 1  # Show active state