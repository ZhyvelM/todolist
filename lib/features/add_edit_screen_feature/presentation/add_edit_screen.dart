import 'package:flutter/material.dart';
import 'package:todolist/features/add_edit_screen_feature/presentation/widgets/date_time_toggle_tile.dart';
import 'package:todolist/features/add_edit_screen_feature/presentation/widgets/task_delete_button.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/icons/app_icons.dart';
import 'package:todolist/ui_kit/palette.dart';
import 'package:todolist/ui_kit/widgets/app_drop_down.dart';
import 'package:todolist/ui_kit/widgets/app_text_field.dart';
import 'package:todolist/utils/enums.dart';

class AddEditScreen extends StatelessWidget {
  const AddEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textStyle = AppTextStyle();
    return Scaffold(
      backgroundColor: palette.backPrimary,
      appBar: AppBar(
        backgroundColor: palette.backPrimary,
        toolbarHeight: 56,
        scrolledUnderElevation: 4,
        surfaceTintColor: palette.backPrimary,
        shadowColor: Color(0xff000000),
        leading: IconButton(onPressed: () {}, icon: Icon(AppIcons.close, color: palette.labelPrimary)),
        actions: [
          TextButton(onPressed: () {}, child: Text('Сохранить', style: textStyle.button.copyWith(color: palette.blue))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppTextField(controller: TextEditingController(), hintText: 'Что надо сделать…', initialText: ''),
            ),
            SizedBox(height: 12),
            AppDropdown(initialValue: TaskPriority.none, onChange: (value) {}),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(color: palette.separator, height: 0.5),
            ),
            DateTimeToggleTile(isActive: true, onDateSelected: (date) {}, onActiveChanged: (bool) {}),
            SizedBox(height: 24),
            Divider(color: palette.separator, height: 0.5),
            SizedBox(height: 8),
            TaskDeleteButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
