import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/auth_providers.dart';
import '../../../core/brand_header.dart';
import '../../../core/enter_motion.dart';
import 'providers.dart';
import 'widgets/clock_card.dart';
import 'widgets/check_in_card.dart';
import 'widgets/month_summary.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => EnterMotion(
    child: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const BrandHeader(),
        const SizedBox(height: 26),
        Text(
          'Hai, ${ref.watch(studentNameProvider).split(' ').first}.',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: -.8),
        ),
        const SizedBox(height: 8),
        Text(
          'Sudah sampai? Bikin hari ini tercatat.',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 28),
        const ClockCard(),
        const SizedBox(height: 20),
        const CheckInCard(),
        const SizedBox(height: 32),
        const Text('Catatanmu', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
        const SizedBox(height: 14),
        ref
            .watch(attendanceProvider)
            .when(
              data: (items) => MonthSummary(items: items),
              loading: () => const LinearProgressIndicator(),
              error: (_, _) => const Text('Catatan belum bisa dimuat. Cek koneksimu, ya.'),
            ),
      ],
    ),
  );
}
