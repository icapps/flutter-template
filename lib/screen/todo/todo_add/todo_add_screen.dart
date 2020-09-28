import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/todoAdd/todo_add_cubit.dart';
import 'package:flutter_template/navigators/back_navigator.dart';
import 'package:flutter_template/navigators/error_navigator.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_input_field.dart';
import 'package:kiwi/kiwi.dart';
import 'package:scroll_when_needed/scroll_when_needed.dart';

class TodoAddScreen extends StatefulWidget {
  static const String routeName = 'todo_add';

  const TodoAddScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TodoAddScreenState();
}

class TodoAddScreenState extends State<TodoAddScreen> with BackNavigatorMixin, ErrorNavigatorMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'TodoAddScaffoldKey');
  String _todo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<TodoAddCubit>(),
      child: BlocBuilder<TodoAddCubit, TodoAddState>(
        builder: (context, state) {
          return buildContent(context);
        },
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    final localization = Localization.of(context);
    final cubit = context.bloc<TodoAddCubit>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: FlutterTemplateBackButton.light(onClick: () => goBack(context)),
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
                onChanged: onTodoChanged,
              ),
              Container(height: ThemeDimens.padding16),
              FlutterTemplateButton(
                text: localization.generalLabelSave,
                isEnabled: _todo?.isNotEmpty == true,
                onClick: () async {
                  await cubit.saveTodo(_todo);
                  goBack(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTodoChanged(String todo) {
    setState(() {
      _todo = todo.trim();
    });
  }
}
