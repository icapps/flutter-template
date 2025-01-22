import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/viewmodel/log_detail/log_detail_viewmodel.dart';
import 'package:flutter_template/widget/general/base_screen/base_screen.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

@flutterRoute
class LogDetailScreen extends StatefulWidget {
  final String date;

  const LogDetailScreen({
    required this.date,
    super.key,
  });

  @override
  LogDetailScreenState createState() => LogDetailScreenState();
}

class LogDetailScreenState extends State<LogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LogDetailViewModel>(
      create: () => getIt()..init(widget.date),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: viewModel.logs.length,
              itemBuilder: (context, index) {
                final log = viewModel.logs.reversed.toList()[index];
                return Text(
                  log,
                  style: theme.text.bodySmall,
                );
              },
            ),
          ),
          FlutterTemplateButton(
            isEnabled: !viewModel.isLoading,
            text: 'Upload log',
            onClick: viewModel.uploadLog,
          ),
        ],
      ),
    );
  }
}
