import 'package:flutter/material.dart';
import 'package:todolist/features/add_edit_screen_feature/presentation/widgets/date_time_toggle_tile.dart';
import 'package:todolist/features/add_edit_screen_feature/presentation/widgets/task_delete_button.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/icons/app_icons.dart';
import 'package:todolist/ui_kit/palette.dart';
import 'package:todolist/ui_kit/widgets/app_drop_down.dart';
import 'package:todolist/ui_kit/widgets/app_text_field.dart';
import 'package:todolist/utils/enums.dart';
import 'package:todolist/utils/models/to_do_task.dart';

class AddEditScreen extends StatefulWidget {
  const AddEditScreen({super.key, required this.task});

  final ToDoTask? task;

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.task?.description ?? '');
    super.initState();
  }

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
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          icon: Icon(AppIcons.close, color: palette.labelPrimary),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            child: Text('Сохранить', style: textStyle.button.copyWith(color: palette.blue)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppTextField(controller: controller, hintText: 'Что надо сделать…', initialText: controller.text),
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
            TaskDeleteButton(
              onTap: () {
                Navigator.of(context).maybePop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
