#!/bin/bash

echo "=== Testing Spawn Fixes ==="

# Check that the map scene file has been updated correctly
if grep -q "position = Vector2(100, 300)" /workspace/xistra_game/maps/metroidvania_map.tscn; then
    echo "[PASS] Player position updated in map scene"
else
    echo "[FAIL] Player position not updated in map scene"
fi

# Check that the map script has been updated with initialize_scene_enemies function
if grep -q "initialize_scene_enemies" /workspace/xistra_game/maps/metroidvania_map.gd; then
    echo "[PASS] Map script updated with initialize_scene_enemies function"
else
    echo "[FAIL] Map script not updated with initialize_scene_enemies function"
fi

# Check that the player script has been updated with show() call
if grep -q "show()" /workspace/xistra_game/maps/map_player.gd; then
    echo "[PASS] Player script updated with show() call"
else
    echo "[FAIL] Player script not updated with show() call"
fi

# Check that the enemy script has been updated with show() call
if grep -q "show()" /workspace/xistra_game/maps/map_enemy.gd; then
    echo "[PASS] Enemy script updated with show() call"
else
    echo "[FAIL] Enemy script not updated with show() call"
fi

echo "=== Spawn Fix Test Complete ==="