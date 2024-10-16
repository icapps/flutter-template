import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/extension/date_time_extension.dart';
import 'package:flutter_template/viewmodel/logs/logs_viewmodel.dart';
import 'package:flutter_template/widget/general/simple_screen/base_screen.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

@flutterRoute
class LogsScreen extends StatefulWidget {
  const LogsScreen({super.key});

  @override
  LogsScreenState createState() => LogsScreenState();
}

class LogsScreenState extends State<LogsScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LogsViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen.child(
        title: 'Logs',
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: viewModel.availableDates.length,
                itemBuilder: (context, index) {
                  final item = viewModel.availableDates[index];
                  return TouchFeedBack(
                    onTapped: () => viewModel.onLogTapped(item),
                    child: Text(
                      item.shortDateWeekdayFormat,
                      style: theme.text.bodyBig,
                    ),
                  );
                },
              ),
            ),
            FlutterTemplateButton(
              text: 'Trigger crash',
              onClick: viewModel.triggerError,
            ),
          ],
        ),
      ),
    );
  }
}