import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_input_field.dart';
import 'package:flutter_template/widget/general/theme_widget.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:scroll_when_needed/scroll_when_needed.dart';

class TodoAddScreen extends StatefulWidget {
  static const String routeName = RouteNames.todoAddScreen;

  const TodoAddScreen({Key? key}) : super(key: key);

  @override
  TodoAddScreenState createState() => TodoAddScreenState();
}

@visibleForTesting
class TodoAddScreenState extends State<TodoAddScreen> {
  @override
  Widget build(BuildContext context) {
    return ThemeWidget(
      child: ProviderWidget<TodoAddViewModel>(
        create: getIt,
        childBuilderWithViewModel: (context, viewModel, theme, localization) => ThemeWidget(
          child: Scaffold(
            backgroundColor: theme.colorsTheme.background,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              leading: FlutterTemplateBackButton.light(
                onClick: viewModel.onBackClicked,
              ),
              title: Text(localization.todoAddTitle),
              backgroundColor: theme.colorsTheme.primary,
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
        ),
      ),
    );
  }
}
