# Subject-Based Game Organization

This document describes the final subject-based organization for the game.

## Final Directory Structure

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
│   ├── main.tscn                # Main scene file
│   ├── organization_test.gd     # Organization test script
│   └── smoke_test_cli.gd        # Module smoke test script
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
├── project.godot          # Godot project configuration
```

## Benefits of Subject-Based Organization

1. **Easier Navigation**: Related files are grouped together by functionality rather than file type
2. **Better Maintainability**: Changes to a specific system only require working within one directory
3. **Clearer Architecture**: The directory structure reflects the game's domain model
4. **Scalability**: New features can be added by creating new subject directories
5. **Reduced Cognitive Load**: Developers can focus on one domain at a time

## Testing

Both organization and module tests pass:
- `godot --headless -s core/organization_test.gd`
- `godot --headless -s core/smoke_test_cli.gd`

This confirms that the file paths are correct and all modules can be loaded properly.