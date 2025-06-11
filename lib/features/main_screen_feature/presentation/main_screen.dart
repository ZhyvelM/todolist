import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist/features/add_edit_screen_feature/presentation/add_edit_screen.dart';
import 'package:todolist/features/main_screen_feature/presentation/widgets/custom_header.dart';
import 'package:todolist/features/main_screen_feature/presentation/widgets/to_do_tile.dart';
import 'package:todolist/generated/l10n.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/icons/app_icons.dart';
import 'package:todolist/ui_kit/palette.dart';

import 'bloc/main_screen_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController scrollController;

  late bool completedTasksVisibility;

  @override
  void initState() {
    completedTasksVisibility = true;
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return BlocProvider(
      create: (context) => MainScreenBloc(),
      child: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: palette.backPrimary,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddEditScreen.add()));
              },
              backgroundColor: palette.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(56)),
              child: Icon(AppIcons.add, color: palette.white),
            ),
            body: CustomScrollView(
              controller: scrollController,
              slivers: [
                _buildAppBar(context, state),
                _buildTasksList(context, state),
                SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            ),
          );
        },
      ),
    );
  }

  SliverPadding _buildTasksList(BuildContext context, MainScreenState state) {
    final textStyle = AppTextStyle();
    final palette = Palette.of(context);
    final locale = AppLocale.of(context);
    final taskList = state.tasks;
    return SliverPadding(
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
          padding: EdgeInsets.symmetric(vertical: 8),
          sliver: SlidableAutoCloseBehavior(
            child: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                if (index == taskList.length) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddEditScreen.add()));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(54, 14, 16, 14),
                      child: Text(locale.create_new, style: textStyle.body.copyWith(color: palette.labelTertiary)),
                    ),
                  );
                }
                final task = taskList[index];
                return SizedBox(
                  width: !completedTasksVisibility && task.completed ? 0 : null,
                  height: !completedTasksVisibility && task.completed ? 0 : null,
                  child: ToDoTile(
                    task: task,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (_) => AddEditScreen.edit(
                                task: task,
                                onDelete: () {
                                  context.read<MainScreenBloc>().add(DeleteTask(id: task.id));
                                },
                              ),
                        ),
                      );
                    },
                    onCompletionChanged:
                        (value) => context.read<MainScreenBloc>().add(CompleteTaskChanged(id: task.id, value: value)),
                    onDelete: () => context.read<MainScreenBloc>().add(DeleteTask(id: task.id)),
                  ),
                );
              }, childCount: taskList.length + 1),
            ),
          ),
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context, MainScreenState state) {
    final palette = Palette.of(context);
    final locale = AppLocale.of(context);
    final double maxHeight = 116 + MediaQuery.of(context).padding.top;
    final double minHeight = 56 + MediaQuery.of(context).padding.top;

    return SliverAppBar(
      backgroundColor: palette.backPrimary,
      primary: false,
      expandedHeight: maxHeight,
      collapsedHeight: minHeight,
      pinned: true,
      stretch: false,
      scrolledUnderElevation: 0,
      flexibleSpace: CustomHeader(
        title: locale.my_tasks,
        subtitle: '${locale.completed} — ${state.completedTasksCount}',
        maxHeight: maxHeight,
        minHeight: minHeight,
        onVisibilityIconTap: (value) {
          setState(() {
            completedTasksVisibility = value;
          });
        },
        visibility: completedTasksVisibility,
      ),
    );
  }
}
