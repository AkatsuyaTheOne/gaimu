from PIL import Image, ImageDraw
import os

# Create the images directory if it doesn't exist
os.makedirs('/workspace/game', exist_ok=True)

# Create player sprite (blue square)
player_img = Image.new('RGBA', (32, 32), (0, 0, 0, 0))
draw = ImageDraw.Draw(player_img)

# Draw a blue square with a darker border
draw.rectangle([4, 4, 28, 28], fill=(50, 150, 255, 255), outline=(20, 80, 200, 255), width=2)

# Save the player sprite
player_img.save('/workspace/game/player_sprite.png')

# Create enemy sprite (red circle)
enemy_img = Image.new('RGBA', (32, 32), (0, 0, 0, 0))
draw = ImageDraw.Draw(enemy_img)

# Draw a red circle with a darker border
draw.ellipse([4, 4, 28, 28], fill=(255, 50, 50, 255), outline=(200, 20, 20, 255), width=2)

# Save the enemy sprite
enemy_img.save('/workspace/game/enemy_sprite.png')

print("Placeholder sprites generated successfully!")