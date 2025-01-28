import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_input_field.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:scroll_when_needed/scroll_when_needed.dart';

@flutterRoute
class TodoAddScreen extends StatefulWidget {
  const TodoAddScreen({super.key});

  @override
  TodoAddScreenState createState() => TodoAddScreenState();
}

@visibleForTesting
class TodoAddScreenState extends State<TodoAddScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TodoAddViewModel>(
      create: getIt.call,
      childBuilderWithViewModel: (context, viewModel, theme, localization) => Scaffold(
        backgroundColor: theme.level2,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: FlutterTemplateBackButton.light(
            onClick: viewModel.onBackClicked,
          ),
          title: Text(localization.todoAddTitle),
          backgroundColor: theme.main,
        ),
        body: ScrollConfiguration(
          behavior: ScrollWhenNeededBehavior(),
          child: Scrollbar(
            child: ListView(
              physics: ScrollWhenNeededPhysics(targetPlatform: Theme.of(context).platform),
              padding: const EdgeInsets.all(16),
              children: [
                FlutterTemplateInputField(
                  hint: localization.todoAddInputHint,
                  onChanged: viewModel.onTodoChanged,
                ),
                Container(height: 16),
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
