enum AttendanceStatus { onTime, late }

abstract final class AttendancePolicy {
  static DateTime wib(DateTime instant) => instant.toUtc().add(const Duration(hours: 7));
  static AttendanceStatus status(DateTime instant) {
    final date = wib(instant);
    final deadline = DateTime.utc(date.year, date.month, date.day, 7);
    return date.isAfter(deadline) ? AttendanceStatus.late : AttendanceStatus.onTime;
  }

  static String label(DateTime? instant) => instant == null
      ? 'Menyimpan…'
      : status(instant) == AttendanceStatus.late
      ? 'Telat'
      : 'Tepat waktu';
}
