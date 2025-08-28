# Game Directory Structure

This document describes the organized directory structure for the game.

## Directory Structure

```
game/
├── assets/                # All game assets
│   ├── icons/             # Game icons
│   │   ├── icon.png           # Game icon
│   │   └── icon.png.import    # Icon import settings
│   └── sprites/           # Sprite images and their import settings
│       ├── enemy_sprite.png       # Enemy sprite image
│       ├── enemy_sprite.png.import # Enemy sprite import settings
│       ├── player_sprite.png      # Player sprite image
│       └── player_sprite.png.import # Player sprite import settings
├── config/                # Configuration files
│   ├── default_bus_layout.tres    # Default input bus layout
│   ├── default_env.tres          # Default environment settings
│   └── export_presets.cfg        # Export presets for building the game
├── core/                  # Core game systems and main scene
│   ├── base_module.gd           # Base module class
│   ├── enemy_spawner_module.gd  # Enemy spawner module
│   ├── game_manager.gd          # Game manager autoload
│   ├── game_manager_module.gd   # Game manager module
│   ├── main.gd                  # Main scene script
│   └── main.tscn                # Main scene file
├── docs/                  # Documentation files
│   ├── MODULAR_ARCHITECTURE.md   # Modular architecture documentation
│   └── README.md                 # Main project documentation
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
├── project.godot          # Godot project configuration
```

This structure provides a clean separation of concerns organized by domain/subject:
- Assets are organized by type
- Configuration files are grouped together
- Core game systems are in the core directory
- Enemy-related functionality is in the enemy directory
- Player-related functionality is in the player directory
- UI-related functionality is in the ui directory
- Documentation is in its own directory

This makes the project much easier to navigate and maintain, as related functionality is grouped together.