# Pixel Adventure

Pixel Adventure is a 2D platformer built with Flutter and Flame. It features tile-based levels created with Tiled, animated characters, collision detection and physics, and both mobile (joystick + jump button) and desktop (keyboard) controls.

- Flutter + Flame powered
- Tiled maps for level design
- Fixed-resolution camera (pixel-perfect style)
- Mobile and desktop input support

## Demo

Add a GIF or screenshot here:

- docs/media/demo.gif
- docs/media/screenshot-1.png

## Features

- Multiple playable characters
- Tile-based levels using Tiled maps
- Collision detection and basic physics
- Joystick and keyboard controls
- Camera with fixed resolution (600x360) for a classic pixel aesthetic
- Sound toggle and volume configuration
- Asset preloading for smooth performance

## Tech Stack

- Flutter
- Flame (game engine)
- Tiled (level editor)

## Project Structure

A typical layout:

- lib/
  - pixel_adventure.dart (main game class and camera/control setup)
  - components/
    - player.dart
    - level.dart
    - jump_button.dart
- assets/
  - images/ (sprites, UI, tilesets)
  - levels/ (Tiled maps, e.g., Level-01.tmx/tsx and related)
  - audio/ (sfx, music)
- docs/
  - media/ (screenshots, gifs)
- pubspec.yaml

## Getting Started

### Prerequisites

- Flutter SDK (latest stable recommended)
- Dart SDK (bundled with Flutter)
- Tiled Map Editor (optional, for editing levels)

### Installation

Clone the repository:

```sh
git clone https://github.com/yourusername/pixel_adventure.git
cd pixel_adventure
```

Install dependencies:

```sh
flutter pub get
```

Run on your target platform:

```sh
# Android
flutter run -d android

# iOS (on macOS)
flutter run -d ios

# Web
flutter run -d chrome

# Windows / macOS / Linux (if enabled)
flutter run -d windows
# or
flutter run -d macos
# or
flutter run -d linux
```

### Assets Configuration (pubspec.yaml)

Ensure your assets are listed so Flame can load them (images.loadAllImages relies on asset registration):

```yaml
flutter:
  assets:
    - assets/images/
    - assets/levels/
    - assets/audio/
```

Organize tileset and sprite assets referenced by your Tiled maps inside assets/images. Make sure any external tilesets (TSX) and image paths used by Tiled match your asset directory structure.

## Running and Controls

- Desktop:
  - Move: Left/Right Arrow or A/D
  - Jump: Up Arrow or W or Space (depending on your Player implementation)

- Mobile:
  - On-screen joystick for movement
  - On-screen Jump button

You can toggle mobile controls with the showControls flag (see Configuration).

## Configuration

The main game class is lib/pixel_adventure.dart. Key fields and how to adjust them:

- showControls: Show joystick and jump button (intended for mobile builds).
- playSounds: Enable/disable sound playback.
- soundVolume: Volume multiplier (0.0–1.0).
- levelNames: Ordered list of level identifiers (e.g., [ 'Level-01', 'Level-02' ]).
- currentLevelIndex: Which level to start on.

Example initialization snippet:

```dart
final game = PixelAdventure()
  ..showControls = true
  ..playSounds = true
  ..soundVolume = 0.8
  ..levelNames = ['Level-01', 'Level-02', 'Level-03'];
```

Notes:
- Camera uses a fixed resolution of 600x360 with top-left anchor for a pixel-perfect feel across devices.
- Assets are preloaded via images.loadAllImages() during onLoad().

## Levels (Tiled Integration)

- Create levels in Tiled.
- Save maps as TMX (and TSX tilesets if external).
- Place files in assets/levels (and their referenced images in assets/images).
- Add the level name to levelNames. The name should match your level identifier used by Level (e.g., "Level-01").

Adding a new level:

1. Create Level-03.tmx in Tiled and save it under assets/levels/.
2. Ensure all tileset images used by the map are under assets/images/ and paths are correct.
3. Add "Level-03" to levelNames.
4. Update pubspec.yaml assets if adding new directories or files.

Level progression:
- Call loadNextLevel() to remove the current Level and load the next one in levelNames. When reaching the end, it wraps around to the first.

## Code Overview

High-level behavior in PixelAdventure (lib/pixel_adventure.dart):

- Asset Preload: images.loadAllImages() caches all images at startup for performance.
- Controls:
  - If showControls is true, a JoystickComponent and JumpButton are added.
  - update(dt) polls the joystick and updates player.horizontalMovement accordingly.
- Camera:
  - CameraComponent.withFixedResolution(world: level, width: 600, height: 360) for pixel-perfect scaling.
  - Anchor is set to top-left.
- Level Management:
  - _loadLevel() constructs a Level with the current player and level name, then adds the world and camera.
  - loadNextLevel() removes the current Level and loads the next one.

Components of interest:
- Player (components/player.dart): Character logic, physics, animations, input handling.
- Level (components/level.dart): Loads the map, spawns entities, and sets up collisions.
- JumpButton (components/jump_button.dart): On-screen jump control for mobile/touch.

## Build

Release builds:

```sh
# Android
flutter build apk --release
# or
flutter build appbundle --release

# iOS (requires Xcode setup)
flutter build ios --release

# Web
flutter build web --release

# Windows / macOS / Linux
flutter build windows --release
flutter build macos --release
flutter build linux --release
```

## Troubleshooting

- Blank/black screen on start:
  - Verify pubspec.yaml assets are correctly listed.
  - Confirm Tiled maps reference valid image paths within assets/images.

- Tiles not rendering:
  - Ensure external tilesets (TSX) are included and their image paths resolve relative to your project assets.

- Controls not visible on mobile:
  - Set showControls = true before running the game.

- Camera cropping or scaling issues:
  - The fixed resolution (600x360) scales to fit device screens; adjust if your art uses a different base resolution.

- Sound not playing:
  - Confirm audio files are included in assets/audio and declared in pubspec.yaml.
  - Check playSounds and soundVolume are set appropriately.

## Roadmap

- More characters and animations
- Additional level tilesets and props
- Enemies and collectibles
- Parallax backgrounds
- Settings UI (audio, controls)
- Save/load progress

## Contributing

Contributions are welcome! Please:
- Open an issue to discuss significant changes.
- Keep PRs focused and include a clear description.
- Follow Flutter and Dart style guidelines (dart format).

## License

MIT License. See LICENSE for details.

## Acknowledgements

- Flame Engine
- Tiled Map Editor
- Open game art communities and artists for inspiration and assets
```

