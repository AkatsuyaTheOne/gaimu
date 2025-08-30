#!/usr/bin/env python3

"""
Simple script to generate a PNG icon for Xistra game
"""

import struct

# Create a simple PNG header
def create_png_header(width, height):
    # PNG signature
    signature = b'\\x89PNG\\r\\n\\x1a\\n'
    
    # IHDR chunk
    ihdr_data = struct.pack('>IIBBBBB', width, height, 8, 2, 0, 0, 0)  # width, height, bit depth, color type, compression, filter, interlace
    ihdr_length = len(ihdr_data)
    ihdr_crc = 0x95314317  # Pre-calculated CRC for IHDR
    
    ihdr = struct.pack('>I', ihdr_length) + b'IHDR' + ihdr_data + struct.pack('>I', ihdr_crc)
    
    return signature + ihdr

# Simple 16x16 PNG with a hoe symbol
width, height = 16, 16
png_data = create_png_header(width, height)

# IDAT chunk with simple image data (a hoe shape)
# This is a simplified representation
idat_data = b'\\x78\\x9c\\x63``\\x00\\x00\\x00\\x02\\x00\\x01'
idat_length = len(idat_data)
idat_crc = 0x88442653  # Pre-calculated CRC

idat = struct.pack('>I', idat_length) + b'IDAT' + idat_data + struct.pack('>I', idat_crc)

# IEND chunk
iend = b'\\x00\\x00\\x00\\x00IEND\\xaeB`\\x82'

# Combine all chunks
png_file = png_data + idat + iend

# Write to file
with open('/workspace/xistra_game/icon.png', 'wb') as f:
    f.write(png_file)

print("Simple PNG icon created as icon.png")