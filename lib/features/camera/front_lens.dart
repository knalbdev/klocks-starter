import 'package:camera/camera.dart';

abstract final class FrontLens {
  static CameraDescription select(List<CameraDescription> cameras) {
    final front = cameras.where((camera) => camera.lensDirection == CameraLensDirection.front);
    if (front.isEmpty) throw StateError('HP ini tidak punya kamera depan.');
    return front.first;
  }
}
