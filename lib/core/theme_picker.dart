import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_provider.dart';

class ThemePicker extends ConsumerWidget {
  const ThemePicker({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(themeProvider).asData?.value ?? ThemeMode.system;
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: scheme.surface.withValues(alpha: .55),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: scheme.outlineVariant.withValues(alpha: .4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final mode in [ThemeMode.light, ThemeMode.system, ThemeMode.dark])
            Tooltip(
              message: _label(mode),
              child: Semantics(
                button: true,
                selected: selected == mode,
                label: _label(mode),
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () async {
                    try {
                      await ref.read(themeProvider.notifier).setMode(mode);
                    } catch (_) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Tampilan belum tersimpan. Coba lagi, ya.')),
                        );
                      }
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 280),
                    curve: Curves.easeOutCubic,
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: selected == mode ? scheme.primary : Colors.transparent,
                      boxShadow: selected == mode
                          ? [
                              BoxShadow(
                                color: scheme.primary.withValues(alpha: .25),
                                blurRadius: 12,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : [],
                    ),
                    child: AnimatedRotation(
                      turns: selected == mode ? 0 : -.08,
                      duration: const Duration(milliseconds: 350),
                      child: Icon(
                        _icon(mode),
                        size: 19,
                        color: selected == mode ? scheme.onPrimary : scheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _label(ThemeMode mode) => switch (mode) {
    ThemeMode.system => 'Ikuti HP',
    ThemeMode.light => 'Terang',
    ThemeMode.dark => 'Gelap',
  };
  IconData _icon(ThemeMode mode) => switch (mode) {
    ThemeMode.system => Icons.phone_android_rounded,
    ThemeMode.light => Icons.wb_sunny_outlined,
    ThemeMode.dark => Icons.nightlight_outlined,
  };
}
