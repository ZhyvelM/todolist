import 'package:flutter/material.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/icons/app_icons.dart';
import 'package:todolist/ui_kit/palette.dart';

class TaskDeleteButton extends StatelessWidget {
  const TaskDeleteButton({super.key, required this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textStyle = AppTextStyle();
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(AppIcons.delete, color: onTap == null ? palette.labelDisabled : palette.red),
            SizedBox(width: 12),
            Text('Удалить', style: textStyle.body.copyWith(color: onTap == null ? palette.labelDisabled : palette.red)),
          ],
        ),
      ),
    );
  }
}
