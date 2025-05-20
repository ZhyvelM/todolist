import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/icons/app_icons.dart';
import 'package:todolist/ui_kit/palette.dart';
import 'package:todolist/ui_kit/widgets/app_check_box.dart';
import 'package:todolist/ui_kit/widgets/app_icon_button.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textStyles = AppTextStyle();
    final date = 'дата';
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.2,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {},
            icon: AppIcons.check,
            backgroundColor: palette.green,
            foregroundColor: palette.white,
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {},
            icon: AppIcons.delete,
            backgroundColor: palette.red,
            foregroundColor: palette.white,
          ),
        ],
      ),
      child: Container(
        color: palette.backSecondary,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCheckBox(onChanged: (_) {}, value: true),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(AppIcons.priorityHigh, color: palette.red),
                      Icon(AppIcons.priorityLow, color: palette.gray),
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            ///calculating count of lines of text
                            ///because of it needs to be a centering offset when there is only one line
                            final textSpan = TextSpan(
                              text: 'Купить что-то',
                              style: textStyles.body.copyWith(color: palette.labelPrimary),
                            );
                            final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
                            tp.layout();
                            final lines = tp.width / constraints.maxWidth;

                            return Padding(
                              padding: lines > 1 ? EdgeInsets.zero : const EdgeInsets.only(top: 2),
                              child: RichText(text: textSpan, maxLines: 3, overflow: TextOverflow.ellipsis),
                            );
                          },
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
            SizedBox(width: 12),
            AppIconButton(onTap: () {}, icon: AppIcons.infoOutline),
          ],
        ),
      ),
    );
  }
}
