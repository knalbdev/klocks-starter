import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:klock_app/features/camera/front_lens.dart';
import 'package:klock_app/features/camera/photo_codec.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const back = CameraDescription(
    name: 'back',
    lensDirection: CameraLensDirection.back,
    sensorOrientation: 90,
  );
  const front = CameraDescription(
    name: 'front',
    lensDirection: CameraLensDirection.front,
    sensorOrientation: 90,
  );
  test('Selects front even if rear is listed first; never falls back to rear', () {
    expect(FrontLens.select([back, front]), front);
    expect(() => FrontLens.select([back]), throwsStateError);
    expect(() => FrontLens.select([]), throwsStateError);
  });
  test('Photo compression produces a decodable JPEG within Firestore size limit', () async {
    final source = img.Image(width: 1600, height: 1200);
    final bytes = await PhotoCodec.compress(Uint8List.fromList(img.encodePng(source)));
    expect(bytes.length, lessThanOrEqualTo(102400));
    final decoded = img.decodeJpg(bytes)!;
    expect(decoded.width, 480);
    expect(decoded.height, 360);
  });
  test('Invalid photo is rejected', () async {
    await expectLater(PhotoCodec.compress(Uint8List.fromList([1, 2, 3])), throwsStateError);
  });
}
