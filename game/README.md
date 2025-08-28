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

- `main.tscn`: Main game scene
- `player.tscn`: Player scene with movement script
- `enemy.tscn`: Enemy scene with AI script
- `*.gd`: Game scripts
- `*.png`: Generated sprite assets

## Requirements

- Godot Engine 4.x