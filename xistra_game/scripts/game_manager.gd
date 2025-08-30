extends Node2D

# Game manager for Xistra
# Handles game state, progression, and systems

# Game state
var game_paused = false
var current_language = "gl"  # Default to Galician
var player_node = null

# Game progression
var areas_unlocked = []
var story_progress = 0
var save_points = []

# Enemies defeated
var enemies_defeated = []

# Collections
var artifacts_collected = []
var meigas_found = 0  # For 100% completion

func _ready():
	# Initialize game
	initialize_game()

func initialize_game():
	# Set up initial game state
	setup_translations()
	setup_player()
	setup_save_points()
	
	print("Xistra game initialized!")

func setup_translations():
	# Set up game translations
	TranslationServer.set_locale(current_language)

func setup_player():
	# Set up player character
	player_node = get_node("Player")

func setup_save_points():
	# Initialize save points (horreos)
	save_points = [
		{"name": "horreo_inicio", "position": Vector2(100, 100)},
		# More save points will be added as areas are unlocked
	]

func unlock_area(area_name):
	# Unlock a new area for exploration
	if not area_name in areas_unlocked:
		areas_unlocked.append(area_name)
		print("Unlocked area: " + area_name)

func collect_artifact(artifact_name):
	# Add artifact to collection
	if not artifact_name in artifacts_collected:
		artifacts_collected.append(artifact_name)
		print("Collected artifact: " + artifact_name)
		
		# Check for special combinations
		check_artifact_combinations()

func check_artifact_combinations():
	# Check if player has collected combinations that unlock new abilities
	pass

func find_meiga():
	# Track when player finds a hidden meiga
	meigas_found += 1
	print("Found a meiga! Total: " + str(meigas_found) + "/???")
	
	# Check for 100% completion
	if meigas_found >= 10:  # Example number
		unlock_achievement("habelas_hailas")

func unlock_achievement(achievement_name):
	# Unlock special achievements
	match achievement_name:
		"habelas_hailas":
			print("Achievement unlocked: Habelas Hailas! 100% Meigas found!")
		_:
			print("Achievement unlocked: " + achievement_name)

func save_game():
	# Save current game state
	var save_data = {
		"story_progress": story_progress,
		"areas_unlocked": areas_unlocked,
		"artifacts_collected": artifacts_collected,
		"meigas_found": meigas_found,
		"enemies_defeated": enemies_defeated
	}
	
	# Save to user directory
	var save_game = FileAccess.open("user://xistra_savegame.save", FileAccess.WRITE)
	save_game.store_var(save_data)
	save_game.close()

func load_game():
	# Load saved game state
	if FileAccess.file_exists("user://xistra_savegame.save"):
		var save_game = FileAccess.open("user://xistra_savegame.save", FileAccess.READ)
		var save_data = save_game.get_var()
		save_game.close()
		
		# Restore game state
		story_progress = save_data.get("story_progress", 0)
		areas_unlocked = save_data.get("areas_unlocked", [])
		artifacts_collected = save_data.get("artifacts_collected", [])
		meigas_found = save_data.get("meigas_found", 0)
		enemies_defeated = save_data.get("enemies_defeated", [])
		
		print("Game loaded successfully!")
		return true
	else:
		print("No save game found.")
		return false