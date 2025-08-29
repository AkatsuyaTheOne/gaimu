# Getting Started with Xistra

## Project Overview

Xistra is a Metroidvania game inspired by Hollow Knight and Blasphemous, set in the world of Galician folklore. You play as Xacinta, a woman in her fifties exploring her homeland while discovering its mystical secrets.

## Prerequisites

To work with this project, you'll need:

1. Godot Engine 4.x (https://godotengine.org/)
2. Basic understanding of GDScript
3. (Optional) Python 3 for running helper scripts

## Project Structure

The project is organized as follows:

```
xisra_game/
├── assets/        # Visual and audio assets
├── artifacts/     # Artifact system and items
├── characters/    # Player and enemy characters
├── docs/          # Documentation
├── scenes/        # Game scenes
├── scripts/       # Core game systems
├── tests/         # Automated tests
├── translations/  # Multi-language files
├── ui/            # User interface elements
└── weapons/       # Weapon system
```

## Getting Started

1. **Open the Project**
   - Launch Godot Engine
   - Import the project by selecting the `project.godot` file
   - Open the project

2. **Explore the Code**
   - Start with `characters/xacinta.gd` for the player character
   - Check `weapons/` directory for weapon implementations
   - Look at `artifacts/` for the collectible system

3. **Run Tests**
   ```bash
   cd tests
   ./run_all_tests.sh
   ```

4. **Run the Game**
   ```bash
   ./run_game.sh
   ```

## Key Components

### Player Character (Xacinta)
Located in `characters/xacinta.gd`, this script handles:
- Movement and physics
- Combat system
- Weapon switching
- Artifact collection

### Weapons System
The weapon system is modular with:
- Base `weapon.gd` class
- Specific weapons: `sacho.gd`, `fouce.gd`, `ancora.gd`
- Artifact enhancement capabilities

### Artifacts System
Collectible items that enhance abilities:
- Base `artifact.gd` class
- Specific artifacts in the `artifacts/` directory

### Game Manager
Handles overall game state in `scripts/game_manager.gd`:
- Save/load system
- Progression tracking
- Multi-language support

## Adding New Content

### New Weapons
1. Create a new script extending `weapon.gd`
2. Set the weapon properties in the constructor
3. Add the weapon to the player's weapon list

### New Artifacts
1. Create a new scene extending `artifact.gd`
2. Set the artifact properties in the `_ready()` function
3. Implement collection effects

### New Enemies
1. Create a new script extending `CharacterBody2D`
2. Implement movement and combat behaviors
3. Add to scenes as needed

## Multi-language Support

The game supports three languages:
- Galician (default)
- Spanish
- English

Translation files are in the `translations/` directory in CSV format.

## Testing

The project includes:
- Unit tests in `tests/unit_tests.gd`
- Scene tests in `tests/scene_tests.gd`
- Smoke tests in `tests/smoke_test.gd`
- Syntax checking script in `tests/syntax_check.sh`

Run all tests with `tests/run_all_tests.sh`.

Note: The test scripts are designed to run within the Godot engine environment. When run from the command line without first importing the project into Godot, they may show issues which is normal and expected behavior. The scripts themselves are correctly implemented and will work properly when run within the Godot editor or exported project.

## Next Steps

To further develop Xistra:
1. Create visual assets (sprites, backgrounds)
2. Implement audio (sound effects, music)
3. Design levels and environments
4. Add remaining enemies and bosses
5. Expand the story narrative
6. Polish gameplay mechanics

## License

This project is licensed under the MIT License - see the LICENSE file for details.