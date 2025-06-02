import 'package:flutter/cupertino.dart';
import 'package:todolist/ui_kit/icons/app_icons.dart';
import 'package:todolist/ui_kit/palette.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({super.key, required this.onChanged, required this.value, this.isPrioritized = false});

  final Function(bool) onChanged;
  final bool value;
  final bool isPrioritized;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        margin: EdgeInsets.all(12),
        height: 24,
        width: 24,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.all(3),
          decoration:
              value
                  ? BoxDecoration(color: palette.green, borderRadius: BorderRadius.circular(2))
                  : BoxDecoration(
                    color: isPrioritized ? palette.red.withAlpha(16) : palette.transparent,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: isPrioritized ? palette.red : palette.separator, width: 2),
                  ),
          child: value ? Icon(AppIcons.check, color: palette.backPrimary, size: 14) : null,
        ),
      ),
    );
  }
}
