import 'package:flutter/material.dart';
import 'package:todolist/features/add_edit_screen_feature/presentation/add_edit_screen.dart';
import 'package:todolist/features/main_screen_feature/presentation/widgets/custom_header.dart';
import 'package:todolist/features/main_screen_feature/presentation/widgets/to_do_tile.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/icons/app_icons.dart';
import 'package:todolist/ui_kit/palette.dart';
import 'package:todolist/utils/enums.dart';
import 'package:todolist/utils/models/to_do_task.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController scrollController;

  late bool completedTasksVisibility;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textStyle = AppTextStyle();

    final double maxHeight = 116 + MediaQuery.of(context).padding.top;
    final double minHeight = 56 + MediaQuery.of(context).padding.top;

    final now = DateTime.now();
    return Scaffold(
      backgroundColor: palette.backPrimary,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddEditScreen(task: null)));
        },
        backgroundColor: palette.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(56)),
        child: Icon(AppIcons.add, color: palette.white),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: palette.backPrimary,
            primary: false,
            expandedHeight: maxHeight,
            collapsedHeight: minHeight,
            pinned: true,
            stretch: false,
            scrolledUnderElevation: 0,
            flexibleSpace: CustomHeader(
              title: 'Мои дела',
              subtitle: 'Выполнено — 5',
              maxHeight: maxHeight,
              minHeight: minHeight,
              onVisibilityIconTap: (value) {
                setState(() {
                  completedTasksVisibility = value;
                });
              },
              visibility: completedTasksVisibility,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            sliver: DecoratedSliver(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: palette.backSecondary,
                boxShadow: [
                  BoxShadow(color: Color(0x1f000000), blurRadius: 2, offset: Offset(0, 2)),
                  BoxShadow(color: Color(0x0f000000), blurRadius: 2),
                ],
              ),
              sliver: SliverPadding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final task = ToDoTask(
                      'Купить что-то, где-то, зачем-то, но зачем не очень понятно, но точно чтобы показать как обрезается',
                      TaskPriority.values[index % 3],
                      now.add(Duration(days: index)),
                    );
                    if (index == 15) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddEditScreen(task: null)));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(54, 14, 16, 14),
                          child: Text('Новое', style: textStyle.body.copyWith(color: palette.labelTertiary)),
                        ),
                      );
                    }
                    return ToDoTile(
                      task: task,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddEditScreen(task: task)));
                      },
                    );
                  }, childCount: 15 + 1),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  @override
  void initState() {
    completedTasksVisibility = true;
    scrollController = ScrollController();
    super.initState();
  }
}
