import 'package:flutter/material.dart';

import 'klock_mark.dart';
import 'theme_picker.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});
  @override
  Widget build(BuildContext context) => const Row(
    children: [
      KlockMark(size: 36),
      SizedBox(width: 10),
      Expanded(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            'klock',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, letterSpacing: -1),
          ),
        ),
      ),
      SizedBox(width: 12),
      ThemePicker(),
    ],
  );
}
