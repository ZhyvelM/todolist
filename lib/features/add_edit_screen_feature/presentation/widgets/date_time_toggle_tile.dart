import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/palette.dart';

class DateTimeToggleTile extends StatefulWidget {
  const DateTimeToggleTile({
    super.key,
    this.initialDate,
    required this.isActive,
    required this.onDateSelected,
    required this.onActiveChanged,
  });

  final DateTime? initialDate;
  final bool isActive;
  final Function(DateTime) onDateSelected;
  final Function(bool) onActiveChanged;

  @override
  State<DateTimeToggleTile> createState() => _DateTimeToggleTileState();
}

class _DateTimeToggleTileState extends State<DateTimeToggleTile> {
  late DateTime? date;
  late bool isActive;

  @override
  void initState() {
    date = widget.initialDate;
    isActive = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textStyle = AppTextStyle();
    final now = DateTime.now();
    return Theme(
      data: ThemeData(useMaterial3: false),
      child: InkWell(
        onTap: () async {
          final selectedDate = await showDatePicker(
            builder: (context, child) => Theme(data: ThemeData(useMaterial3: false), child: child ?? SizedBox.shrink()),
            context: context,
            firstDate: now,
            lastDate: now.add(Duration(days: 60)),
            initialDate: date ?? now,
            locale: Locale('ru'),
          );
          if (selectedDate != null) {
            widget.onDateSelected(selectedDate);
            setState(() {
              date = selectedDate;
            });
          }
        },
        child: Container(
          height: 72,
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Сделать до', style: textStyle.body.copyWith(color: palette.labelPrimary, height: 1)),
                  SizedBox(height: 4),
                  Text(
                    DateFormat('dd MMMM yyyy', "ru").format(date ?? now),
                    style: textStyle.subhead.copyWith(
                      color: isActive ? palette.blue : palette.labelDisabled,
                      height: 1,
                    ),
                  ),
                ],
              ),
              Switch(
                value: isActive,
                onChanged: (isActive) {
                  widget.onActiveChanged(isActive);
                  setState(() {
                    this.isActive = isActive;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
