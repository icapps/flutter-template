import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/navigator/mixin/back_navigator.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_input_field.dart';
import 'package:get_it/get_it.dart';
import 'package:scroll_when_needed/scroll_when_needed.dart';

class TodoAddScreen extends StatefulWidget {
  static const String routeName = 'todo_add';

  const TodoAddScreen({Key? key}) : super(key: key);

  @override
  TodoAddScreenState createState() => TodoAddScreenState();
}

@visibleForTesting
class TodoAddScreenState extends State<TodoAddScreen> with BackNavigatorMixin, ErrorNavigatorMixin implements TodoAddNavigator {

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TodoAddViewModel>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, _, localization) => Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
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
                FlutterTemplateInputField(
                  hint: localization.todoAddInputHint,
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
    );
  }
}
