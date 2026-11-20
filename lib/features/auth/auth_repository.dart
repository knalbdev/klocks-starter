import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(FirebaseAuth.instance),
);

class AuthRepository {
  AuthRepository(this.auth);
  final FirebaseAuth auth;

  Future<void> signIn(String email, String password) async {
    // TODO-F03: Login Email/Password. Biarkan exception ditangani UI.
    throw UnimplementedError('TODO-F03: hubungkan login ke Firebase Auth.');
  }

  Stream<User?> watchSession() {
    // TODO-F04: Dengarkan perubahan sesi; jangan simpan status login sendiri.
    throw UnimplementedError('TODO-F04: dengarkan sesi Firebase Auth.');
  }

  String get studentName {
    // TODO-F04: Gunakan displayName, lalu email sebelum @, lalu "Siswi".
    return 'Siswi';
  }

  Future<void> signOut() async {
    // TODO-F05: Keluar dari Firebase Auth, bukan hanya pindah halaman.
    throw UnimplementedError('TODO-F05: tutup sesi Firebase Auth.');
  }
}
