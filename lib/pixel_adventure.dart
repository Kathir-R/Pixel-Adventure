import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:pixel_adventure/levels/level.dart';

class PixelAdventure extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late final CameraComponent cam;

  
  // ignore: annotate_overrides
  final world = Level();

  @override
  FutureOr<void> onLoad() async{
    // Load all images into cache
    await images.loadAllImages();

    cam = CameraComponent.withFixedResolution(
      world: world, width: 640,  height: 360,);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);



    return super.onLoad();
  }
}
