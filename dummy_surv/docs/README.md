# Simple 2D Game in Godot

This is a basic 2D game created in Godot Engine that demonstrates:

- Player movement with arrow keys
- Enemy AI that follows the player
- Collision detection
- Score tracking
- Game over and restart functionality

## How to Run

1. Open Godot Engine
2. Import this project by selecting the `project.godot` file
3. Click "Play" (F5) to run the game
4. Control the player (blue square) with arrow keys
5. Avoid the enemies (red circles) to survive as long as possible
6. Your score increases the longer you survive

## Game Controls

- Arrow Keys: Move the player

## Game Features

- Player character that moves within screen boundaries
- Enemies that spawn at screen edges and chase the player
- Score that increases over time
- Game over when player collides with an enemy
- Restart button to play again

## Project Structure

The project has been organized into a clean domain-driven directory structure:

```
game/
├── assets/                # All game assets
│   ├── icons/             # Game icons
│   └── sprites/           # Sprite images and their import settings
├── config/                # Configuration files
├── core/                  # Core game systems and main scene
├── docs/                  # Documentation files
├── enemy/                 # Enemy system
├── player/                # Player system
├── tests/                 # Automated tests
├── ui/                    # UI system
└── .godot/                # Godot engine files (generated)
```

This organization groups related functionality together by domain/subject rather than by file type, making it easier to navigate and maintain.

For more details about the directory structure, see [GAME_STRUCTURE.md](GAME_STRUCTURE.md).

## Modular Architecture

The game uses a modular architecture that makes it easy to expand with new features. For more information about the modular design, see [MODULAR_ARCHITECTURE.md](MODULAR_ARCHITECTURE.md).

## Testing

The project includes automated tests in the `tests/` directory:

- `tests/organization_test.gd`: Verifies file paths are correct
- `tests/smoke_test_cli.gd`: Tests that modules can be loaded
- `tests/scene_generator_test.gd`: Tests scene generation capabilities
- `tests/run_all_tests.sh`: Runs all tests

For more information about testing, see [TESTING.md](TESTING.md).

## Requirements

- Godot Engine 4.x