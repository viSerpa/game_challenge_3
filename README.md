# Space Invaders - 20 Games Challenge - #3
Space Invaders — A clone of Space Invaders built using Godot & GDScript.

## Features
- 3 Lives
- Mothership (Bonus points)
- Shooting Enemies

## How to Play
Controls:
- A / D — Move Ship / Player.
- Spacebar — Shoot.
Objective:
- Kill all of the enemies without loosing all of your lives.

## Setup & Installation
- **Prerequisites**: Godot version 4.7 or later.
- **Clone the repo**: [git clone https://github.com](https://github.com/viSerpa/game_challenge_3.git)
- **Run the game**: Press F5 to play game.

## What I Learned
- **Component-Based Architecture:** Explored modular design by separating input and movement into distinct components, moving away from single-script player logic to create highly reusable code blocks.
- **Hierarchical Group Movement:** Solved complex synchronized movement by nesting different enemy rows into a singular parent container, allowing the entire grid to track screen boundaries and advance down as a unified front.
- **Composition vs. Inheritance in Collisions:** Overcame a modular collision bug by creating distinct Hitbox components for the player and enemies, learning how to safely differentiate collision layers and areas when objects share component logic.
- **Independent Problem-Solving & Rule Adherence:** Branched away from a tutorial early on to strictly follow the challenge guidelines, successfully independently implementing weapon mechanics, enemy variants, and independent group movement.
