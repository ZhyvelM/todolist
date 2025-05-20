import 'package:flutter/cupertino.dart';
import 'package:todolist/ui_kit/icons/app_icons.dart';
import 'package:todolist/ui_kit/palette.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({super.key, required this.onChanged, required this.value, this.isPrioritized = false});

  final Function(bool?) onChanged;
  final bool value;
  final bool isPrioritized;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  late bool value;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return GestureDetector(
      onTap: () {
        widget.onChanged(!value);
        setState(() {
          value = !value;
        });
      },
      child: SizedBox(
        height: 24,
        width: 24,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.all(3),
          decoration:
              value
                  ? BoxDecoration(color: palette.green, borderRadius: BorderRadius.circular(2))
                  : BoxDecoration(
                    color: widget.isPrioritized ? palette.red.withAlpha(16) : palette.transparent,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: widget.isPrioritized ? palette.red : palette.separator, width: 2),
                  ),
          child: value ? Icon(AppIcons.check, color: palette.backPrimary, size: 14) : null,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }
}
