from PIL import Image, ImageDraw

# Create a simple game icon
icon_img = Image.new('RGBA', (64, 64), (50, 50, 50, 255))  # Dark gray background
draw = ImageDraw.Draw(icon_img)

# Draw a blue square (player) in the center
draw.rectangle([20, 20, 44, 44], fill=(50, 150, 255, 255), outline=(20, 80, 200, 255), width=2)

# Draw a red circle (enemy) in the top-right corner
draw.ellipse([40, 10, 58, 28], fill=(255, 50, 50, 255), outline=(200, 20, 20, 255), width=2)

# Save the icon
icon_img.save('/workspace/game/icon.png')

print("Game icon generated successfully!")