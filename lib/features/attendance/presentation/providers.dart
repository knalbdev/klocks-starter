import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../auth/auth_providers.dart';
import '../data/attendance_repository.dart';
import '../domain/attendance.dart';

final repositoryProvider = Provider.autoDispose<AttendanceRepository>((ref) {
  ref.watch(sessionProvider);
  return FirestoreAttendanceRepository(
    FirebaseFirestore.instance,
    FirebaseAuth.instance.currentUser!.uid,
  );
});
final attendanceProvider = StreamProvider.autoDispose<List<Attendance>>(
  (ref) => ref.watch(repositoryProvider).watch(),
);
final photoProvider = FutureProvider.autoDispose.family<Uint8List, String>(
  (ref, id) => ref.watch(repositoryProvider).photo(id),
);
