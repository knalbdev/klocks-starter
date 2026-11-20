import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/surface_card.dart';
import '../../../../core/clock_provider.dart';
import '../../domain/attendance.dart';
import '../../domain/attendance_policy.dart';
import '../providers.dart';
import '../capture_page.dart';
import 'scan_emblem.dart';

class CheckInCard extends ConsumerWidget {
  const CheckInCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(attendanceProvider);
    final now = AttendancePolicy.wib(ref.watch(clockProvider).asData?.value ?? DateTime.now());
    Attendance? today;
    for (final record in records.asData?.value ?? <Attendance>[]) {
      final date = record.createdAt == null ? null : AttendancePolicy.wib(record.createdAt!);
      if (date?.year == now.year && date?.month == now.month && date?.day == now.day) {
        today = record;
      }
    }
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                today == null ? Icons.camera_alt_outlined : Icons.task_alt,
                color:
                    today?.createdAt != null &&
                        AttendancePolicy.status(today!.createdAt!) == AttendanceStatus.late
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  today == null ? 'Absen hari ini' : today.statusLabel,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Center(child: ScanEmblem()),
          const SizedBox(height: 12),
          Text(
            today == null ? 'Wajah siap, absen beres.' : 'Absenmu sudah tersimpan.',
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600, letterSpacing: -.5),
          ),
          const SizedBox(height: 8),
          Text(
            today == null
                ? 'Pakai kamera depan, cek fotonya, lalu kirim. Lewat 07.00 WIB tercatat telat.'
                : 'Kamu bisa lihat foto dan jam masuknya di Riwayat.',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, height: 1.6),
          ),
          const SizedBox(height: 22),
          FilledButton.icon(
            onPressed: today != null || !records.hasValue
                ? null
                : () =>
                      Navigator.of(context)
                          .push(MaterialPageRoute<void>(builder: (_) => const CapturePage())),
            icon: Icon(today == null ? Icons.camera_alt_outlined : Icons.done),
            label: Text(today == null ? 'Foto & absen' : 'Sudah absen'),
          ),
          if (records.hasError)
            TextButton(
              onPressed: () => ref.invalidate(attendanceProvider),
              child: const Text('Belum terhubung · Coba lagi'),
            ),
        ],
      ),
    );
  }
}
