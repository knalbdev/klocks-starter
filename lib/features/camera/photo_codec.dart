import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

abstract final class PhotoCodec {
  static Future<Uint8List> compress(Uint8List source) => compute(_encode, source);
  static Uint8List _encode(Uint8List source) {
    final decoded = img.decodeImage(source);
    if (decoded == null) throw StateError('Foto tidak terbaca. Coba ambil ulang.');
    final oriented = img.bakeOrientation(decoded);
    final image = img.copyResize(oriented, width: oriented.width > 480 ? 480 : oriented.width);
    for (final quality in [75, 55, 35, 20]) {
      final bytes = Uint8List.fromList(img.encodeJpg(image, quality: quality));
      if (bytes.length <= 102400) return bytes;
    }
    throw StateError('Foto terlalu besar. Coba ambil ulang.');
  }
}
