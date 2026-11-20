import 'package:cloud_firestore/cloud_firestore.dart';

import 'attendance_policy.dart';

class Attendance {
  const Attendance({required this.id, required this.createdAt});
  String get statusLabel => AttendancePolicy.label(createdAt);
  final String id;
  final DateTime? createdAt;
  factory Attendance.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) =>
      Attendance(id: doc.id, createdAt: (doc.data()?['createdAt'] as Timestamp?)?.toDate());
}
