import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_template/widget/general/action/action_item.dart';
import 'package:flutter_template/widget/general/simple_screen/base_screen.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/general/svg_icon.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:flutter_template/widget/todo/todo_row_item.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  TodoListScreenState createState() => TodoListScreenState();
}

@visibleForTesting
class TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TodoListViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
        final errorKey = viewModel.errorKey;
        return BaseScreen.child(
          padding: EdgeInsets.zero,
          title: localization.todoTitle,
          actions: [
            ActionItem(
              key: Keys.downloadAction,
              svgAsset: ThemeAssets.downloadIcon,
              onClick: viewModel.onDownloadClicked,
              color: theme.appBarAction,
            ),
            ActionItem(
              key: Keys.addAction,
              svgAsset: ThemeAssets.addIcon,
              onClick: viewModel.onAddClicked,
              color: theme.appBarAction,
            ),
          ],
          child: Builder(
            builder: (context) {
              if (viewModel.isLoading) return Center(child: FlutterTemplateProgressIndicator(dark: theme.isLightTheme));
              if (errorKey != null) {
                return Center(
                  child: Text(
                    localization.getTranslation(errorKey),
                    style: theme.errorText.bodyNormal,
                  ),
                );
              }

              return Scrollbar(
                child: StreamBuilder<List<Todo>>(
                  stream: viewModel.dataStream,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (data == null) return Container();
                    if (data.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: theme.fillInformative,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgIcon(
                                  svgAsset: ThemeAssets.fileIcon,
                                  color: theme.accent,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  localization.todoEmptyState,
                                  textAlign: TextAlign.center,
                                  style: theme.text.bodyNormal,
                                ),
                              ],
                            ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          height: 1,
                          color: theme.primary.withOpacity(0.1),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
