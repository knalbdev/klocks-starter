import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/clock_provider.dart';
import '../../../../core/surface_card.dart';
import '../../../../core/orbit_clock.dart';
import '../../domain/attendance_policy.dart';

class ClockCard extends ConsumerWidget {
  const ClockCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = AttendancePolicy.wib(ref.watch(clockProvider).asData?.value ?? DateTime.now());
    final scheme = Theme.of(context).colorScheme;
    return SurfaceCard(
      tint: scheme.primaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(color: scheme.primary, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Text(
                DateFormat('EEEE, d MMM', 'id').format(now),
                style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('HH:mm').format(now),
                        style: const TextStyle(
                          fontSize: 58,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -3,
                          fontFeatures: [FontFeature.tabularFigures()],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6, bottom: 13),
                        child: Text(
                          DateFormat(':ss').format(now),
                          style: TextStyle(
                            fontSize: 22,
                            color: scheme.onSurfaceVariant,
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const OrbitClock(size: 84),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.schedule_rounded, size: 16, color: scheme.primary),
              const SizedBox(width: 7),
              const Expanded(child: Text('Masuk 07.00 WIB', style: TextStyle(fontSize: 12))),
              Text(
                'WIB',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: scheme.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
