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
├── docs/                  # Documentation files
│   ├── MODULAR_ARCHITECTURE.md   # Modular architecture documentation
│   └── README.md                 # Main project documentation
├── modules/               # Game modules (modular functionality)
│   ├── core/              # Base classes and core functionality
│   │   └── base_module.gd        # Base module class
│   ├── player/            # Player-related modules
│   │   └── player_module.gd      # Player module
│   ├── enemy/             # Enemy-related modules
│   │   └── enemy_module.gd       # Enemy module
│   ├── ui/                # UI-related modules
│   │   └── ui_manager_module.gd  # UI manager module
│   └── managers/          # Game managers and systems
│       ├── enemy_spawner_module.gd  # Enemy spawner module
│       └── game_manager_module.gd   # Game manager module
├── scenes/                # Game scenes
│   ├── enemy.tscn         # Enemy scene
│   ├── main.tscn          # Main game scene
│   ├── player.tscn        # Player scene
│   ├── smoke_test.tscn    # Smoke test scene
│   └── sprite_generator.tscn # Sprite generator scene
├── scripts/               # Utility scripts and scene behaviors
│   ├── enemy.gd           # Enemy behavior script
│   ├── enemy_modular.gd   # Modular enemy behavior script
│   ├── game_manager.gd    # Game manager script
│   ├── icon_generator.gd  # Icon generator script
│   ├── main.gd            # Main scene script
│   ├── main_modular.gd    # Modular main scene script
│   ├── player.gd          # Player behavior script
│   ├── player_modular.gd  # Modular player behavior script
│   ├── restart_button.gd  # Restart button script
│   ├── smoke_test.gd      # Smoke test script
│   ├── smoke_test_cli.gd  # CLI smoke test script
│   └── sprite_generator.gd # Sprite generator script
└── .godot/                # Godot engine files (generated)
├── project.godot          # Godot project configuration
```

This structure provides a clean separation of concerns:
- Assets are organized by type
- Configuration files are grouped together
- Documentation is in its own directory
- Modules are organized by functionality
- Scenes are grouped together
- Scripts are organized together

This makes the project much easier to navigate and maintain.