# Modular Game Architecture

This document describes the modular architecture for the game, designed to make it easily expandable.

## Directory Structure

```
game/
├── assets/                # All game assets
│   ├── icons/             # Game icons
│   └── sprites/           # Sprite images and their import settings
├── config/                # Configuration files
├── core/                  # Core game systems and main scene
│   ├── base_module.gd           # Base module class
│   ├── enemy_spawner_module.gd  # Enemy spawner module
│   ├── game_manager.gd          # Game manager autoload
│   ├── game_manager_module.gd   # Game manager module
│   ├── main.gd                  # Main scene script
│   └── main.tscn                # Main scene file
├── docs/                  # Documentation files
├── enemy/                 # Enemy system
│   ├── enemy.gd             # Enemy behavior script
│   ├── enemy_module.gd      # Enemy module
│   └── enemy.tscn           # Enemy scene file
├── player/                # Player system
│   ├── player.gd            # Player behavior script
│   ├── player_module.gd     # Player module
│   └── player.tscn          # Player scene file
├── ui/                    # UI system
│   ├── restart_button.gd       # Restart button script
│   └── ui_manager_module.gd    # UI manager module
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

1. Create a new script in the appropriate directory
2. Inherit from `../core/base_module.gd` (or `base_module.gd` if in core directory)
3. Implement the required methods
4. Add your custom functionality

Example:
```gdscript
# enemy/special_enemy_module.gd
class_name SpecialEnemyModule
extends "../core/base_module.gd"

func initialize() -> void:
    super.initialize()  # Call parent method
    # Insert here your special enemy initialization code

func update(delta: float) -> void:
    super.update(delta)  # Call parent method
    # Insert here your special enemy update code

# Insert here your new special enemy methods
# func activate_special_ability() -> void:
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
godot --headless -s core/smoke_test_cli.gd
```

This will load all module scripts and verify they can be instantiated without errors.

## Module Descriptions

### Core Module
- `base_module.gd`: The base class for all modules, providing a consistent interface
- `game_manager_module.gd`: Handles game state and logic
- `enemy_spawner_module.gd`: Handles enemy spawning logic

### Player Module
- `player_module.gd`: Handles player movement and behavior

### Enemy Module
- `enemy_module.gd`: Handles enemy AI and behavior

### UI Module
- `ui_manager_module.gd`: Handles UI updates and interactions

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