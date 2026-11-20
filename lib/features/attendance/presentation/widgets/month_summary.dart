import 'package:flutter/material.dart';

import '../../../../core/surface_card.dart';
import '../../domain/attendance.dart';
import '../../domain/attendance_policy.dart';

class MonthSummary extends StatelessWidget {
  const MonthSummary({super.key, required this.items});
  final List<Attendance> items;
  @override
  Widget build(BuildContext context) {
    final confirmed = items.where((item) => item.createdAt != null).toList();
    final late = confirmed
        .where((item) => AttendancePolicy.status(item.createdAt!) == AttendanceStatus.late)
        .length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _tile(
                context,
                '${confirmed.length - late}',
                'Tepat waktu',
                Icons.check_rounded,
                const Color(0xFF3B9E8B),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _tile(
                context,
                '$late',
                'Telat',
                Icons.schedule_rounded,
                const Color(0xFFD58B54),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Dari ${confirmed.length} absensi terakhir.',
          style: TextStyle(fontSize: 11, color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }

  Widget _tile(BuildContext context, String value, String label, IconData icon, Color color) =>
      SurfaceCard(
        padding: 18,
        tint: color.withValues(alpha: .25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: .15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Theme.of(context).colorScheme.onSurface, size: 19),
            ),
            const SizedBox(height: 14),
            Text(
              value,
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w700, letterSpacing: -1),
            ),
            Text(
              label,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12),
            ),
          ],
        ),
      );
}
