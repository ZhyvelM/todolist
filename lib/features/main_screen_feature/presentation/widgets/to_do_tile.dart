import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/icons/app_icons.dart';
import 'package:todolist/ui_kit/palette.dart';
import 'package:todolist/ui_kit/widgets/app_check_box.dart';
import 'package:todolist/ui_kit/widgets/app_icon_button.dart';
import 'package:todolist/utils/enums.dart';
import 'package:todolist/utils/models/to_do_task.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({
    super.key,
    required this.task,
    required this.onTap,
    required this.onCompletionChanged,
    required this.onDelete,
  });

  final ToDoTask task;

  final VoidCallback onTap;

  final VoidCallback onDelete;

  final Function(bool) onCompletionChanged;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textStyles = AppTextStyle();
    final date = intl.DateFormat('dd MMMM yyyy', 'ru').format(task.doUntil ?? DateTime.now());

    final icon = switch (task.priority) {
      TaskPriority.none => SizedBox.shrink(),
      TaskPriority.low => Icon(AppIcons.priorityLow, color: palette.gray, size: 20),
      TaskPriority.high => Icon(AppIcons.priorityHigh, color: palette.red, size: 20),
    };

    ///calculating count of lines of text
    ///because of it needs to be a centering offset when there is only one line
    final screenWidth = MediaQuery.of(context).size.width;
    final width = screenWidth - 120;
    final textSpan = TextSpan(
      children: [
        WidgetSpan(child: icon),
        TextSpan(
          text: task.description,
          style:
              task.completed
                  ? textStyles.body.copyWith(color: palette.labelTertiary, decoration: TextDecoration.lineThrough)
                  : null,
        ),
      ],
      style: textStyles.body.copyWith(color: palette.labelPrimary),
    );
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr, maxLines: 3)..setPlaceholderDimensions([
      PlaceholderDimensions(
        size: task.priority == TaskPriority.none ? Size(0, 0) : Size(20, 20),
        alignment: PlaceholderAlignment.middle,
      ),
    ]);
    tp.layout(maxWidth: width);
    int lines = (tp.height / 20).ceil();
    final height = (20 * lines) + 24 + (lines > 1 ? 0 : 4) + (task.doUntil != null ? 24 : 0);

    return ClipRect(
      child: Slidable(
        enabled: !task.completed,
        key: ValueKey(task.id),
        groupTag: 'to_do_list_task',
        startActionPane: ActionPane(
          extentRatio: height / (screenWidth - 16),
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => onCompletionChanged(true),
              icon: AppIcons.check,
              backgroundColor: palette.green,
              foregroundColor: palette.white,
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: height / (screenWidth - 16),
          motion: ScrollMotion(),
          dragDismissible: false,
          dismissible: ColoredBox(
            color: palette.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all((height - 24) / 2),
                  child: Icon(AppIcons.delete, color: palette.white, size: 24),
                ),
              ],
            ),
          ),
          children: [
            CustomSlidableAction(
              onPressed: (context) {
                final controller = Slidable.of(context);
                controller?.dismiss(
                  ResizeRequest(const Duration(milliseconds: 300), onDelete),
                  duration: const Duration(milliseconds: 300),
                );
              },
              backgroundColor: palette.red,
              foregroundColor: palette.white,
              autoClose: false,
              child: Icon(AppIcons.delete, size: 24),
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            color: palette.backSecondary,
            padding: EdgeInsets.only(left: 4, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppCheckBox(onChanged: (value) => onCompletionChanged(value), value: task.completed),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: lines > 1 ? EdgeInsets.zero : const EdgeInsets.only(top: 2),
                                child: RichText(text: textSpan, maxLines: 3, overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                        if (date.isNotEmpty) ...[
                          SizedBox(height: 4),
                          Text(date, style: textStyles.subhead.copyWith(color: palette.labelTertiary)),
                        ],
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: AppIconButton(onTap: () {}, icon: AppIcons.infoOutline),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
