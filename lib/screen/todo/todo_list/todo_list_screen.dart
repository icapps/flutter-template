import 'package:kiwi/kiwi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/viewmodel/back_navigator.dart';
import 'package:flutter_template/viewmodel/error_navigator.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_template/widget/general/action/action_item.dart';
import 'package:flutter_template/util/extension/context_extensions.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:flutter_template/widget/todo/todo_row_item.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({
    Key key,
  }) : super(key: key);

  @override
  TodoListScreenState createState() => TodoListScreenState();
}

@visibleForTesting
class TodoListScreenState extends State<TodoListScreen> with BackNavigatorMixin, ErrorNavigatorMixin implements TodoListViewNavigator {
  final _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'TodoListScaffoldKey');

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);
    return ProviderWidget<TodoListViewModel>(
      consumer: (context, viewModel, child) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: context.isIOS,
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
            if (!viewModel.isLoading && viewModel.errorKey != null)
              Center(
                child: Text(localization.getTranslation(viewModel.errorKey)),
              ),
            if (viewModel.isLoading) const Center(child: FlutterTemplateProgressIndicator.dark()),
            if (!viewModel.isLoading && viewModel.errorKey == null)
              Scrollbar(
                child: StreamBuilder<List<Todo>>(
                  stream: viewModel.dataStream,
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
                          onChanged: (value) => viewModel.onTodoChanged(id: item.id, value: value),
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
              ),
          ],
        ),
      ),
      create: () => KiwiContainer().resolve()..init(this),
    );
  }

  @override
  void goToAddTodo() => MainNavigatorWidget.of(context).goToAddTodo();

  @override
  ScaffoldState getScaffoldState() => _scaffoldKey.currentState;
}
