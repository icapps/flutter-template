import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/viewmodel/back_navigator.dart';
import 'package:flutter_template/viewmodel/error_navigator.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:provider/provider.dart';
import 'package:scroll_when_needed/scroll_when_needed.dart';

class TodoAddScreen extends StatefulWidget {
  static const String routeName = 'todo_add';

  @override
  _TodoAddScreenState createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> with BackNavigatorMixin, ErrorNavigatorMixin implements TodoAddNavigator {
  final _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'TodoAddScaffoldKey');

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);
    return ChangeNotifierProvider<TodoAddViewModel>(
      child: Consumer<TodoAddViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          appBar: AppBar(
            leading: FlutterTemplateBackButton.light(onClick: viewModel.onBackClicked),
            title: Text(localization.todoAddTitle),
          ),
          body: ScrollConfiguration(
            behavior: ScrollWhenNeededBehavior(),
            child: Scrollbar(
              child: ListView(
                physics: ScrollWhenNeededPhysics(targetPlatform: Theme.of(context).platform),
                padding: const EdgeInsets.all(ThemeDimens.padding16),
                children: [
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: localization.todoAddInputHint,
                    ),
                    onChanged: viewModel.onTodoChanged,
                  ),
                  Container(height: ThemeDimens.padding16),
                  FlutterTemplateButton(
                    text: localization.generalLabelSave,
                    isEnabled: viewModel.isSaveEnabled,
                    onClick: viewModel.onSaveClicked,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      create: (context) => KiwiContainer.resolve()..init(this),
    );
  }

  @override
  ScaffoldState getScaffoldState() => _scaffoldKey.currentState;
}