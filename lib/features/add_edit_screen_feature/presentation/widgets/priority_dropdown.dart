import 'package:flutter/material.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/palette.dart';
import 'package:todolist/utils/enums.dart';

class PriorityDropdown extends StatefulWidget {
  const PriorityDropdown({super.key, required this.initialValue, required this.onChange});

  final TaskPriority initialValue;

  final Function(TaskPriority) onChange;

  @override
  State<PriorityDropdown> createState() => _PriorityDropdownState();
}

class _PriorityDropdownState extends State<PriorityDropdown> {
  late TaskPriority value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textStyles = AppTextStyle();
    return PopupMenuButton<TaskPriority>(
      elevation: 1,
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: TaskPriority.none,
            child: SizedBox(
              width: 164,
              child: Text(TaskPriority.none.toString(), style: textStyles.body.copyWith(color: palette.labelPrimary)),
            ),
          ),
          PopupMenuItem(
            value: TaskPriority.low,
            child: SizedBox(
              width: 164,
              child: Text(TaskPriority.low.toString(), style: textStyles.body.copyWith(color: palette.labelPrimary)),
            ),
          ),
          PopupMenuItem(
            value: TaskPriority.high,
            child: Row(
              children: [
                SizedBox(
                  width: 164,
                  child: Text('!! ${TaskPriority.high}', style: textStyles.body.copyWith(color: palette.red)),
                ),
              ],
            ),
          ),
        ];
      },
      onSelected: (newValue) {
        widget.onChange(newValue);
        setState(() {
          value = newValue;
        });
      },
      child: Container(
        height: 72,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Важность', style: textStyles.body.copyWith(color: palette.labelPrimary)),
            Text(value.toString(), style: textStyles.subhead.copyWith(color: palette.labelTertiary)),
          ],
        ),
      ),
    );
  }
}
