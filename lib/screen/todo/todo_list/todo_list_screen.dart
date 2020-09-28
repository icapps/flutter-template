import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/todoList/todo_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/navigators/main_navigator.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/general/action/action_item.dart';
import 'package:flutter_template/util/extension/context_extensions.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/todo/todo_row_item.dart';
import 'package:kiwi/kiwi.dart';

class TodoListScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'TodoListScaffoldKey');

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<TodoListCubit>(),
      child: BlocBuilder<TodoListCubit, TodoListState>(
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              centerTitle: context.isIOS,
              title: Text(localization.todoTitle),
              actions: [
                ActionItem(
                  key: Keys.downloadAction,
                  svgAsset: ThemeAssets.downloadIcon(context),
                  onClick: () => context.bloc<TodoListCubit>().fetchTodos(),
                ),
                ActionItem(
                  key: Keys.addAction,
                  svgAsset: ThemeAssets.addIcon(context),
                  onClick: () => goToAddTodo(context),
                ),
              ],
            ),
            body: Stack(
              children: [
                if (state is TodoListError) ...{
                  buildError(localization, state),
                } else if (state is TodoListLoading) ...{
                  buildLoading(),
                } else if (state is TodoListInitial) ...{
                  buildContent(context, localization, state),
                }
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildContent(BuildContext context, Localization localization, TodoListInitial state) {
    return Scrollbar(
      child: StreamBuilder<List<Todo>>(
        stream: state.dataStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          if (snapshot.data.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(ThemeDimens.padding32),
                child: Text(
                  localization.todoEmptyState,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final item = snapshot.data[index];
              return TodoRowItem(
                title: item.title,
                value: item.completed,
                onChanged: (completed) => context.bloc<TodoListCubit>().todoChanged(id: item.id, completed: completed),
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: ThemeDimens.padding16),
              child: Container(
                height: 1,
                color: ThemeColors.primary.withOpacity(0.1),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return const Center(child: FlutterTemplateProgressIndicator.dark());
  }

  Widget buildError(Localization localization, TodoListError state) {
    return Center(
      child: Text(localization.getTranslation(state.errorKey)),
    );
  }

  void goToAddTodo(BuildContext context) => MainNavigatorWidget.of(context).goToAddTodo();
}
