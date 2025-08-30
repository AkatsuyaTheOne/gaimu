# Input Actions Configuration

For the Xistra game to work properly, the following input actions need to be configured in the Godot project settings:

## Required Input Actions

1. **move_left**
   - Key: A or Left Arrow

2. **move_right**
   - Key: D or Right Arrow

3. **jump**
   - Key: Space or W/Up Arrow

4. **attack**
   - Key: J or Enter

## How to Configure

1. Open the Godot project
2. Go to Project -> Project Settings -> Input Map
3. Add the actions listed above
4. Assign the appropriate keys to each action

## Movement Physics

The player character uses proper platforming physics with:
- Accelerated left/right movement
- Gravity when not on floor
- Variable jump height (release jump button for shorter jumps)
- Proper collision detection with platforms