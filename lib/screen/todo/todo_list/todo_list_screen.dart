import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/navigator/mixin/back_navigator.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_template/widget/general/action/action_item.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:flutter_template/widget/todo/todo_row_item.dart';
import 'package:get_it/get_it.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({
    Key? key,
  }) : super(key: key);

  @override
  TodoListScreenState createState() => TodoListScreenState();
}

@visibleForTesting
class TodoListScreenState extends State<TodoListScreen> with BackNavigatorMixin, ErrorNavigatorMixin implements TodoListViewNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TodoListViewModel>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
        final errorKey = viewModel.errorKey;
        return Scaffold(
          appBar: AppBar(
            brightness: Brightness.dark,
            centerTitle: context.isIOSTheme,
            title: Text(localization.todoTitle),
            actions: [
              ActionItem(
                key: Keys.downloadAction,
                svgAsset: ThemeAssets.downloadIcon(context),
                onClick: viewModel.onDownloadClicked,
              ),
              ActionItem(
                key: Keys.addAction,
                svgAsset: ThemeAssets.addIcon(context),
                onClick: viewModel.onAddClicked,
              ),
            ],
          ),
          body: Stack(
            children: [
              if (!viewModel.isLoading && errorKey != null)
                Center(
                  child: Text(localization.getTranslation(errorKey)),
                ),
              if (viewModel.isLoading) const Center(child: FlutterTemplateProgressIndicator.dark()),
              if (!viewModel.isLoading && errorKey == null)
                Scrollbar(
                  child: StreamBuilder<List<Todo>>(
                    stream: viewModel.dataStream,
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      if (data == null) return Container();
                      if (data.isEmpty) {
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
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return TodoRowItem(
                            title: item.title,
                            value: item.completed,
                            onChanged: (value) => viewModel.onTodoChanged(id: item.id, value: value),
                          );
                        },
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: ThemeDimens.padding16),
                          child: Container(
                            height: 1,
                            color: theme.colorsTheme.primary.withOpacity(0.1),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  void goToAddTodo() => MainNavigatorWidget.of(context).goToAddTodo();
}
