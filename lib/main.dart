import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id');
  Object? startupError;
  try {
    // TODO-F01: Tambahkan import firebase_core dan inisialisasi Firebase.
    // Konfigurasi native diunduh dari Console; tanpa Firebase CLI.
    await Future<void>.error(UnimplementedError('TODO-F01: inisialisasi Firebase.'));
  } catch (error) {
    startupError = error;
  }
  runApp(ProviderScope(child: KlockApp(startupError: startupError)));
}
