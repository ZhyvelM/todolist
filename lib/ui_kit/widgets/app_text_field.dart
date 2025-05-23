import 'package:flutter/material.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/palette.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.controller, required this.hintText, required this.initialText});

  final TextEditingController controller;
  final String hintText;
  final String initialText;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textStyle = AppTextStyle();
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: palette.backSecondary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Color(0x1f000000), offset: Offset(0, 2), blurRadius: 2),
          BoxShadow(color: Color(0x0f000000), blurRadius: 2),
        ],
      ),
      child: TextField(
        maxLines: null,
        minLines: 3,
        decoration: InputDecoration(
          labelStyle: textStyle.body.copyWith(color: palette.labelPrimary, height: 8 / 9),
          hintText: hintText,
          hintStyle: textStyle.body.copyWith(color: palette.labelTertiary, height: 8 / 9),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
