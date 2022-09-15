import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/navigator/mixin/back_navigator.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_template/widget/general/action/action_item.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({
    Key? key,
  }) : super(key: key);

  @override
  TodoListScreenState createState() => TodoListScreenState();
}

@visibleForTesting
class TodoListScreenState extends State<TodoListScreen> with BackNavigatorMixin, ErrorNavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TodoListViewModel>(
      create: () => GetIt.I()..init(TodoListNavigatorImpl()),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
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
          body: Center(
            child: FlutterTemplateButton(
              text: 'Go To Detail',
              onClick: viewModel.goToDetail,
            ),
          ),
        );
      },
    );
  }
}

class TodoListNavigatorImpl extends TodoListNavigator {
  @override
  void goToAddTodo() => MainNavigator.goToAddTodo();

  @override
  void goToDetail({required String id}) => MainNavigator.goToDetail(id: id);
}
