extends CanvasLayer

# UI for the mockup map
# Shows current weapon and instructions

func _ready():
	# Set up the UI
	update_weapon_display("Sacho")

func update_weapon_display(weapon_name):
	# Update the weapon display
	$WeaponLabel.text = "Current Weapon: " + weapon_name

func _process(delta):
	# Update UI every frame
	var player = get_parent().get_node("Player")
	if player:
		update_weapon_display(player.current_weapon)
		
		# Update instructions
		$Instructions.text = "Arrow Keys: Move\nEnter: Switch Weapon\nSpace: Attack"