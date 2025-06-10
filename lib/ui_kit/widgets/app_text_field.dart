import 'package:flutter/material.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/palette.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({super.key, required this.hintText, required this.initialText, required this.onChanged});

  final String hintText;
  final String initialText;

  final Function(String) onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.initialText);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
        onChanged: widget.onChanged,
        controller: controller,
        maxLines: null,
        minLines: 3,
        decoration: InputDecoration(
          labelStyle: textStyle.body.copyWith(color: palette.labelPrimary, height: 8 / 9),
          hintText: widget.hintText,
          hintStyle: textStyle.body.copyWith(color: palette.labelTertiary, height: 8 / 9),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
