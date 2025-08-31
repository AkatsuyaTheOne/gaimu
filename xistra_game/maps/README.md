# Xistra Map Mockup

This directory contains a mockup metroidvania-style map for the Xistra game.

## Features

- **Metroidvania-style map**: Four distinct areas with different themes
- **Player character**: Blue geometric form with movement controls
- **Enemies**: Red geometric forms (squares, triangles, circles, diamonds)
- **Weapon system**: Three weapons (Sacho, Fouce, Áncora) with different attack animations
- **Combat system**: Attack enemies with spacebar
- **UI**: Shows current weapon and controls

## Controls

- **Arrow Keys**: Move player
- **Enter**: Switch weapons
- **Space**: Attack with current weapon

## Areas

1. **Starting Area** (Light Green) - Basic square enemies
2. **Forest Area** (Dark Green) - Triangle enemies
3. **Coastal Area** (Blue) - Circle enemies
4. **Mountain Area** (Gray) - Diamond enemies

## Testing

Run the map mockup test with:
```bash
cd tests
./run_all_tests.sh
```

Or run just the map tests:
```bash
godot --path /workspace/xistra_game --no-window --quiet -s tests/map_mockup_test.gd
```

## Integration

The map demo can be accessed from the main menu by selecting "Map Demo".