#!/bin/bash

# Script to run the Xistra game

echo "Starting Xistra game..."

# Check if Godot is installed
if ! command -v godot &> /dev/null
then
    echo "Godot engine is not installed. Please install Godot to run this game."
    exit 1
fi

# Run the game
godot /workspace/xistra_game/project.godot