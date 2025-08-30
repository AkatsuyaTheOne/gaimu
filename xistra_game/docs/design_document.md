# Xistra Game Design Document

## Overview

Xistra is a Metroidvania-style game that combines the exploration mechanics of Hollow Knight with the dark atmospheric storytelling of Blasphemous, all set within the rich cultural context of Galician folklore.

## Core Gameplay Loop

1. **Explore** - Navigate through interconnected environments
2. **Acquire** - Find new weapons, artifacts, and abilities
3. **Overcome** - Use new abilities to access previously unreachable areas
4. **Discover** - Uncover the story and folklore of Galicia

## Characters

### Main Character
**Xacinta** - A woman in her fifties with a farmer's background. She is exploring her homeland to discover its secrets and her own heritage.

### Enemies and Bosses
All enemies are based on creatures from Galician folklore:
- O veciño (The neighbor)
- O morto da costa (The dead of the coast)
- Sereas (Sea sirens)
- O lobisome (Werewolf)
- A moura (Mystical guardian)
- And many more...

## Weapons System

### Primary Weapon
**Sacho** (Hoe) - Balanced weapon with moderate speed and damage.

### Secondary Weapons
**Fouce** (Sickle) - Fast weapon with lower damage but higher attack speed.
**Áncora** (Anchor) - Slow but powerful weapon with high damage.

Each weapon can be enhanced with Galician artifacts to unlock special abilities.

## Artifacts and Abilities

### Figa Artifacts
Traditional Galician amulets that provide health and defensive bonuses.

### Toxo Artifacts
Related to briars and thorns, enhancing the Fouce weapon with crowd control abilities.

### Onda Artifacts
Connected to sea waves, enhancing the Áncora weapon with area-of-effect attacks.

## Progression System

### Ability Unlocks
As Xacinta collects artifacts, she unlocks new abilities that allow access to new areas:
- Double jump
- Wall climb
- Dash
- Special weapon techniques

### Area Access
Game world is divided into themed regions based on Galician geography:
- Coastal areas
- Mountain regions (O Courel)
- Historic cities (Lugo, Santiago, Tui)
- River valleys (Miño and Sil)

## Cultural Elements

### Language Support
- Galician (default)
- Spanish
- English

### Educational Aspect
Each artifact and enemy includes flavor text that explains the real folklore behind the elements, providing an educational experience about Galician culture.

### Environmental Storytelling
Environments are designed to reflect real locations in Galicia, with architectural elements and landscapes based on actual places.

## User Interface

### Health System
Traditional health bar showing Xacinta's current condition.

### Weapon Display
Shows the currently equipped weapon and its enhanced abilities.

### Map System
Interconnected map that reveals as areas are explored, with markers for points of interest.

### Inventory
System for managing collected artifacts and viewing their effects.

## Technical Implementation

### Engine
Godot Engine 4.x

### Platforms
Initially targeting PC (Linux, Windows, macOS) with potential for console ports.

### Resolution
Support for multiple resolutions with scalable UI elements.

## Audio Design

### Music
Atmospheric soundtrack that reflects the mystical nature of Galician folklore.

### Sound Effects
Environmental sounds and combat effects that enhance immersion.

## Visual Style

### Art Direction
"Naive" art style similar to Hollow Knight, with hand-drawn elements and rich color palettes.

### Animation
Fluid character animations for movement and combat.

### Particle Effects
Subtle effects for abilities and environmental elements.

## Testing

### Unit Tests
Automated tests for core systems like combat, progression, and save/load.

### Integration Tests
Scene loading and interaction tests.

### Playtesting
Regular playtesting sessions to refine gameplay balance and difficulty.