# Godot Game Project Development Notes

## Project Structure

The game project has been reorganized into a subject-based directory structure:

- `assets/` - All game assets (icons, sprites)
- `config/` - Configuration files 
- `core/` - Core game systems and main scene
- `docs/` - Documentation files
- `enemy/` - Enemy system components
- `player/` - Player system components
- `tests/` - Automated tests
- `ui/` - UI system components

## Key Improvements

### Development Workflow Improvements

- Implemented subject-based file organization (grouped by functionality rather than file type)
- Created comprehensive automated testing framework
- Added proper resource cleanup in tests
- Configured .gitignore to exclude Godot temporary files
- Cleaned repository of generated/temporary files

### Modular Architecture

Implemented modular architecture with:
- Base module system for consistent interfaces
- Domain-specific modules (Player, Enemy, UI, etc.)
- Clear separation of concerns
- Easy extensibility through placeholder comments

## Automated Testing

Tests are organized in the `tests/` directory:

- `organization_test.gd` - Verifies file paths
- `smoke_test_cli.gd` - Tests module loading
- `scene_generator_test.gd` - Tests scene creation
- `run_all_tests.sh` - Runs all tests

Execute with: `./tests/run_all_tests.sh`

### Important Note About Test Errors

**By launching smoke tests remember to check for errors even if the test says that all passed.**

Some tests may show "All tests passed!" but still output errors in the stderr stream. These can include:
- Resource leaks (RID allocations)
- ObjectDB instance leaks
- Godot engine warnings

While these errors may not affect the functionality of our tests, they indicate potential issues with resource management that should be addressed. Always check both stdout and stderr when running tests.

Example of what to look for:
```
ERROR: 1 RID allocations of type 'P11GodotArea2D' were leaked at exit.
WARNING: ObjectDB instances leaked at exit
```

## Version Control

.gitignore configured to exclude:
- `*.gd.uid` and `*.tscn.uid` files
- `*.import` asset configuration files
- `export_presets.cfg` export settings
- Godot's `.godot/` cache directory

## Bug Fixes

### Enemy Spawning Issue
**Problem**: Enemies were not spawning in the game.
**Fix**: Connected the EnemyTimer's timeout signal in the main script:
```gdscript
# In _ready() function:
enemy_timer.connect("timeout", _on_EnemyTimer_timeout)
```

### Player Movement Issue
**Problem**: Player could not move backward from the center of the screen.
**Fix**: Simplified the player scene structure to remove the unnecessary root Node2D:
- Removed the root Node2D from player.tscn
- Made the Player Area2D the root node of the scene
- Ensured the movement script applies directly to the root node

## Best Practices

1. Always run tests before committing changes
2. Check both stdout and stderr output from tests
3. Keep related functionality grouped in the same directory
4. Use placeholder comments for easy extensibility
5. Follow the modular design patterns established
6. Test game functionality after making changes to scene structure
7. Ensure proper signal connections for interactive elements