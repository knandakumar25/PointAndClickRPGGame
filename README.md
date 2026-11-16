# Point & Click RPG: The Trial of Varuna

[![Godot Engine](https://img.shields.io/badge/Engine-Godot_4.4-blue.svg)](https://godotengine.org/)
[![Language](https://img.shields.io/badge/Language-GDScript-brightgreen.svg)]()
[![Platform](https://img.shields.io/badge/Platform-Windows_|_macOS_|_Linux-orange.svg)]()
[![Course](https://img.shields.io/badge/Course-CSC_486-purple.svg)]()
[![Team](https://img.shields.io/badge/Developed_By-The_Marines-red.svg)]()

> A multi-stage 2D puzzle adventure combining shoreline survival, timed dungeon escape chambers, numerical ciphers, and a climactic philosophical reckoning with the ocean deity Varuna.

---

## Overview

**PointAndClickRPGGame** is an episodic 2D adventure game developed in **Godot 4.4** by **The Marines** for CSC 486. Serving as a crucial chapter in the maritime narrative, the game follows the surviving crew members—Andrew, Raul, Mastan, Robert, Arjun, and Captain Hancock—after making landfall on a mysterious island.

Players must safely shepherd the crew across perilous coastal terrain, navigate trap-laden subterranean temple chambers, solve mathematical code locks and lever combinations before falling spikes descend, and ultimately face an ethereal underwater communion with **Varuna**, the ancient Hindu deity of the ocean.

---

## Gameplay Acts & Progression

```
   ┌────────────────────────────────┐
   │     Act I: Beach Shoreline     │
   │  Path navigation & crew health │
   └───────────────┬────────────────┘
                   ▼
   ┌────────────────────────────────┐
   │ Act II: Subterranean Ruins     │
   │ Escape Rooms 1, 2, & 3         │
   │ • Timed Falling Spikes         │
   │ • Keypad Code Verification     │
   │ • Multi-Switch Lever Logic     │
   └───────────────┬────────────────┘
                   ▼
   ┌────────────────────────────────┐
   │ Act III: Underwater Mirror     │
   │ Philosophical Trial of Varuna  │
   │ • Conscience & Morality        │
   │ • Belief & Self-Doubt          │
   └────────────────────────────────┘
```

### 1. Act I: The Beach March (`BeachScene1.tscn`)
- Guide the animated crew procession along winding coastline path curves using `Path2D` and `PathFollow2D`.
- Monitor collective party health (`health: 5`). Taking fatal damage reloads the traversal sequence.

### 2. Act II: Escape Room Chambers (`EscapeRoomLevel1.tscn` – `Level3.tscn`)
- **Timed Falling Spike Traps (`spikes.tscn`, `SpikeTimer`)**: In each puzzle chamber, an overhead ceiling of deadly spikes descends toward the floor. You must deduce the exit solution before time runs out!
- **Interactive Code Keypads (`code.gd`, `LineEdit`)**: Enter multi-digit security ciphers via on-screen input boxes and submit to open sealed iron doors.
- **Lever & Hallway Sequencing (`lever.gd` – `lever_5.gd`, `hall_1.tscn` – `hall_4.tscn`)**: Flip mechanical switches in correct permutations to disable barriers and reveal passage through ancient corridors.

### 3. Act III: The Reflection of Varuna (`scenes/DialogueScene.gd`)
- Suspended in still underwater currents, you stand before Varuna—neither drowning nor swimming.
- Rather than combat, Varuna presents a **Mirror of Conscience**: an interactive branching dialogue tree examining the player's choices, family longings, morality, and true motives.

---

## Controls

| Key / Action | Binding |
| :--- | :--- |
| **Move Up** | `W` or `Up Arrow` |
| **Move Down** | `S` or `Down Arrow` |
| **Move Left** | `A` or `Left Arrow` |
| **Move Right** | `D` or `Right Arrow` |
| **Interact / Click** | `Left Mouse Button` (Levers, Buttons, Keypads, Choices) |
| **Submit Code / Confirm** | `Enter` or `Spacebar` |
| **Reset / Reload Scene** | `Spacebar` (During traversal fail states) |

---

## Running the Game in Godot

### Requirements
- [Godot Engine 4.4](https://godotengine.org/download)

### How to Run
1. Clone this repository:
   ```bash
   git clone https://github.com/knandakumar25/PointAndClickRPGGame.git
   ```
2. Open Godot 4.4, click **Import**, and navigate to the project root directory to open `project.godot`.
3. Press **F5** to run the project from its main menu (`res://main_menu.tscn`).

---

## Project Structure

```
PointAndClickRPGGame/
├── project.godot            # Godot 4.4 engine configurations and input mappings
├── main_menu.tscn / .gd     # Title screen and difficulty selection launcher
├── difficulty.tscn / .gd    # Game difficulty configuration
├── BeachScene1.tscn / .gd   # Act I beach patrol scene
├── crew.gd                  # Crew party animation and health manager
├── player.gd                # Top-down player movement controller
├── scenes/
│   ├── EscapeRoomLevel1 - 3 # Timed spike puzzle chambers
│   ├── hall_1 - hall_4      # Connecting corridor scenes
│   ├── DialogueScene.tscn   # Climactic underwater dialogue with Varuna
│   ├── spikes.tscn          # Descending hazard scene
│   ├── code.gd - code_3.gd  # Keypad code validation scripts
│   └── lever.gd - lever_5.gd# Lever toggle triggers
├── assets/
│   ├── fonts/               # Custom typeface (JainiPurva-Regular.ttf)
│   └── sprites/             # Crew sprites, spikes, doors, bullets, enemies
└── README.md                # Project documentation
```

---

## Credits

- **Development Team**: The Marines (CSC 486)
- **Engine**: [Godot Engine](https://godotengine.org/)
- **Custom Fonts**: Jaini Purva
