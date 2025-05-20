import 'package:flutter/material.dart';
import 'package:todolist/ui_kit/palette.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({super.key, required this.onTap, required this.icon});

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return GestureDetector(onTap: onTap, child: Icon(icon, size: 24, color: palette.labelTertiary));
  }
}
