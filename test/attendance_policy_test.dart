import 'package:flutter_test/flutter_test.dart';
import 'package:klock_app/features/attendance/domain/attendance_policy.dart';

void main() {
  test('Deadline uses WIB, accepts early arrivals and exact 07:00:00', () {
    expect(
      AttendancePolicy.status(DateTime.parse('2026-11-18T06:59:59+07:00')),
      AttendanceStatus.onTime,
    );
    expect(
      AttendancePolicy.status(DateTime.parse('2026-11-18T00:00:00Z')),
      AttendanceStatus.onTime,
    );
    expect(
      AttendancePolicy.status(DateTime.parse('2026-11-18T00:00:00.001Z')),
      AttendanceStatus.late,
    );
    expect(
      AttendancePolicy.status(DateTime.parse('2026-11-18T07:00:01+07:00')),
      AttendanceStatus.late,
    );
  });
  test('WIB date rollover and unconfirmed server timestamp', () {
    expect(
      AttendancePolicy.status(DateTime.parse('2026-11-17T17:05:00Z')),
      AttendanceStatus.onTime,
    );
    expect(AttendancePolicy.label(null), 'Menyimpan…');
    expect(AttendancePolicy.label(DateTime.parse('2026-11-18T01:00:00Z')), 'Telat');
  });
}
