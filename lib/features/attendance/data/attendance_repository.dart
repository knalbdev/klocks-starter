import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/attendance.dart';

abstract class AttendanceRepository {
  Stream<List<Attendance>> watch();
  Future<void> submit(Uint8List photo);
  Future<Uint8List> photo(String id);
}

class FirestoreAttendanceRepository implements AttendanceRepository {
  FirestoreAttendanceRepository(this.db, this.uid);
  final FirebaseFirestore db;
  final String uid;
  CollectionReference<Map<String, dynamic>> get records =>
      db.collection('students').doc(uid).collection('attendance');
  @override
  Stream<List<Attendance>> watch() {
    // TODO-F07: Urutkan createdAt desc, limit 60, snapshots, lalu map model.
    throw UnimplementedError('TODO-F07: baca metadata absensi realtime.');
  }

  @override
  Future<void> submit(Uint8List photo) async {
    if (photo.isEmpty || photo.length > 102400) {
      throw StateError('Foto harus berukuran maksimal 100 KB. Ambil ulang foto.');
    }
    // TODO-F08: Satu batch: metadata + evidence/photo + guards/daily.
    // Gunakan serverTimestamp dan Blob. Commit sekali, bukan tiga set terpisah.
    throw UnimplementedError('TODO-F08: simpan absensi secara atomik.');
  }

  @override
  Future<Uint8List> photo(String id) async {
    // TODO-F09: Ambil evidence/photo hanya untuk record yang diketuk.
    throw UnimplementedError('TODO-F09: baca Blob bukti foto.');
  }
}
