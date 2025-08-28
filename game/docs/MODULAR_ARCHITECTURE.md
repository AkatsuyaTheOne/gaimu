# Modular Game Architecture

This document describes the modular architecture for the game, designed to make it easily expandable.

## Directory Structure

```
game/
├── assets/                # All game assets
│   ├── icons/             # Game icons
│   └── sprites/           # Sprite images and their import settings
├── config/                # Configuration files
├── docs/                  # Documentation files
├── modules/               # Game modules (modular functionality)
│   ├── core/              # Base classes and core functionality
│   ├── player/            # Player-related modules
│   ├── enemy/             # Enemy-related modules
│   ├── ui/                # UI-related modules
│   └── managers/          # Game managers and systems
├── scenes/                # Game scenes
├── scripts/               # Utility scripts and scene behaviors
└── .godot/                # Godot engine files (generated)
```

## Module System

All modules inherit from `BaseModule` which provides a consistent interface:

```gdscript
class_name BaseModule
extends Node

func initialize() -> void:
    pass

func cleanup() -> void:
    pass

func update(delta: float) -> void:
    pass
```

## Adding New Modules

To add a new module:

1. Create a new script in the appropriate directory under `modules/`
2. Inherit from `BaseModule`
3. Implement the required methods
4. Add your custom functionality

Example:
```gdscript
# modules/powerups/powerup_module.gd
class_name PowerupModule
extends BaseModule

func initialize() -> void:
    super.initialize()  # Call parent method
    # Insert here your powerup initialization code

func update(delta: float) -> void:
    super.update(delta)  # Call parent method
    # Insert here your powerup update code

# Insert here your new powerup methods
# func activate_powerup() -> void:
#     pass
```

## Expanding the Game

To add new features:

1. Create new modules in the appropriate directories
2. Add module instances to the relevant scenes
3. Connect modules through the main game script
4. Use the comments in the code as entry points for new functionality:
   - "Insert here your new module-specific methods"
   - "Insert here your [module] initialization code"
   - "Insert here your [module] update code"

## Running the Smoke Test

To verify that all modules can be loaded correctly:

```
godot --headless -s scripts/smoke_test_cli.gd
```

This will load all module scripts and verify they can be instantiated without errors.

## Module Descriptions

### Core Module
- `BaseModule`: The base class for all modules, providing a consistent interface

### Player Module
- `PlayerModule`: Handles player movement and behavior

### Enemy Module
- `EnemyModule`: Handles enemy AI and behavior

### UI Module
- `UIManagerModule`: Handles UI updates and interactions

### Managers
- `GameManagerModule`: Handles game state and logic
- `EnemySpawnerModule`: Handles enemy spawning logic

## Adding New Sprites

To add new sprites to the game:

1. Create a new sprite image file in the `assets/sprites/` directory
2. Add import settings in a `.import` file in the same directory
3. Reference the sprite in your module code:
   ```gdscript
   # Insert here your new sprite
   var new_sprite = preload("res://assets/sprites/new_sprite.png")
   ```

4. Add the sprite to your scene as needed