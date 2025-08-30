#!/usr/bin/env python3

"""
Simple script to generate a placeholder icon for Xistra game
"""

import pygame
import math

# Initialize pygame
pygame.init()

# Set up the display
size = 256, 256
screen = pygame.display.set_mode(size)
pygame.display.set_caption("Xistra Icon Generator")

# Colors
BACKGROUND = (40, 40, 60)  # Dark blue
HOE_COLOR = (200, 180, 100)  # Golden yellow
DETAIL_COLOR = (120, 100, 60)  # Brown
ACCENT_COLOR = (220, 200, 120)  # Light gold

# Fill the background
screen.fill(BACKGROUND)

# Draw a stylized hoe (Sacho)
# Handle of the hoe
handle_points = [
    (120, 180),  # Bottom of handle
    (115, 120),  # Bend point
    (125, 60),   # Top of handle
    (135, 65),   # Top width
    (125, 125),  # Bend point 2
    (130, 185)   # Bottom width
]
pygame.draw.polygon(screen, HOE_COLOR, handle_points)

# Head of the hoe
head_points = [
    (125, 60),   # Top connection
    (135, 65),   # Top width
    (160, 40),   # Outer point
    (150, 35)    # Inner point
]
pygame.draw.polygon(screen, ACCENT_COLOR, head_points)

# Add some decorative elements
pygame.draw.circle(screen, DETAIL_COLOR, (140, 50), 3)  # Decorative dot

# Add a Galician flag element (white and blue stripes)
for i in range(4):
    y_pos = 200 + i * 10
    pygame.draw.rect(screen, (255, 255, 255), (40, y_pos, 176, 5))
    pygame.draw.rect(screen, (0, 100, 200), (40, y_pos+5, 176, 5))

# Save the icon
pygame.image.save(screen, "icon.png")
print("Icon saved as icon.png")

# Quit
pygame.quit()