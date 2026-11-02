# Space Invaders - 20 Games Challenge - #3
Space Invaders — A clone of Space Invaders built using Godot & GDScript.

## Features
- 3 Lives
- Mothership (Bonus points)
- Shooting Enemies

## How to Play
Controls:
A / D — Move Ship / Player.
Spacebar — Shoot.
Objective: Kill all of the enemies without loosing all of your lives.

## Setup & Installation
Prerequisites: Godot version 4.7 or later.
Clone the repo: [git clone https://github.com](https://github.com/viSerpa/game_challenge_3.git)
Run the game: Press F5 to play game.

## What I Learned
This is the third game of the 20 Game Challenge. I chose Space Invaders.

Making the player movement was similar to Breakout:
    - make the player move left and right

The rest of the game was pretty different to what I was used to. I knew how to generate a grid of objects, but I had to make each row different and make the enemies move as a group.

For this project I wanted to try and learn how to make a game using components. I started off by watching a tutorial on how to create and use components in Godot. After creating the movement and movement input components for the player, I branched off the tutorial and as I didn't want to rely too much on tutorials on this project. And it is also stated in the rules that tutorials are mostly forbidden with some few exceptions.

Creating the bullet was also relatively simple. It was just an object that can move up. I however, didn't think about how the enemy can't use this bullet.

I mapped the controls to 'a' for left movement 'd' for right movement and 'space' to shoot.

I had 3 types of enemies that functioned the same, but they just looked different. I generated a row per enemy type.

Making the whole grid of enemies move was my first challenge. I first thought about moving each row separately, since the row of enemies were separate at first. I couldn't wrap my head around the logic for move 3 separate rows of enemies at the same time, so I just grouped them up. Now they move as one, going down and reversing their movement when they reach the edge.

The final challenge I had to face was having the players bullet kill the enemies. I did what I instincively did, call queue.free() on the enemies when a body enters them. However, since I was working with components for the first time, I had trouble wrapping my head around this since both the player and enemy have a hit box component.

My solution was the make the hit boxes separate by making another hit box component specifically for the player. 
