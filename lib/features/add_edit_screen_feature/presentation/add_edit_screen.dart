import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/features/add_edit_screen_feature/presentation/bloc/add_edit_screen_bloc.dart';
import 'package:todolist/features/add_edit_screen_feature/presentation/widgets/date_time_toggle_tile.dart';
import 'package:todolist/features/add_edit_screen_feature/presentation/widgets/task_delete_button.dart';
import 'package:todolist/generated/l10n.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/icons/app_icons.dart';
import 'package:todolist/ui_kit/palette.dart';
import 'package:todolist/features/add_edit_screen_feature/presentation/widgets/priority_dropdown.dart';
import 'package:todolist/ui_kit/widgets/app_text_field.dart';
import 'package:todolist/utils/enums.dart';
import 'package:todolist/utils/models/to_do_task.dart';

class AddEditScreen extends StatelessWidget {
  const AddEditScreen.add({super.key}) : onDelete = null, task = null;

  const AddEditScreen.edit({super.key, required this.task, required this.onDelete});

  final ToDoTask? task;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textStyle = AppTextStyle();
    final locale = AppLocale.of(context);
    return BlocProvider(
      create: (context) => AddEditScreenBloc(task),
      child: BlocBuilder<AddEditScreenBloc, AddEditScreenState>(
        builder: (context, state) {
          final bloc = context.read<AddEditScreenBloc>();
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
                    bloc.add(Save());
                    Navigator.of(context).maybePop();
                  },
                  child: Text(locale.save, style: textStyle.button.copyWith(color: palette.blue)),
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
                    child: AppTextField(
                      hintText: locale.what_to_do,
                      initialText: task?.description ?? '',
                      onChanged: (text) => bloc.add(DescriptionChanged(newText: text)),
                    ),
                  ),
                  SizedBox(height: 12),
                  PriorityDropdown(
                    initialValue: task?.priority ?? TaskPriority.none,
                    onChange: (value) => bloc.add(PriorityChanged(newPriority: value)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: palette.separator, height: 0.5),
                  ),
                  DateTimeToggleTile(
                    isActive: state.doUntilSwitch,
                    initialDate: state.doUntil,
                    onDateSelected: (date) => bloc.add(DateSelected(newDate: date)),
                    onActiveChanged: (value) => bloc.add(DateSwitched(newValue: value)),
                  ),
                  SizedBox(height: 24),
                  Divider(color: palette.separator, height: 0.5),
                  SizedBox(height: 8),
                  TaskDeleteButton(
                    onTap:
                        onDelete == null
                            ? null
                            : () {
                              bloc.add(Delete());
                              Navigator.of(context).maybePop();
                              onDelete?.call();
                            },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
