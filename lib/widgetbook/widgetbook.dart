import 'package:flutter/material.dart';
import 'package:flutter_template/architecture.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/theme/theme_config.dart';
import 'package:flutter_template/widgetbook/widgetbook.directories.g.dart';
import 'package:flutter_template/widgetbook/widgetbook_widgets/widgetbook_screen.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Future<void> main() async {
  await initArchitecture();

  const values = FlavorValues(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    logNetworkInfo: true,
    showFullErrorMessages: true,
  );

  FlavorConfig(
    flavor: Flavor.dev,
    name: 'DEV',
    color: Colors.red,
    values: values,
  );
  await configureDependencies(Environments.dev);

  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        DeviceFrameAddon(devices: [
          ...Devices.ios.all,
          ...Devices.android.all,
        ]),
        InspectorAddon(),
        BuilderAddon(
          name: 'main',
          builder: (context, widget) => WidgetBookScreen(child: widget),
        ),
        ThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: FlutterTemplateThemeData.lightTheme,
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: FlutterTemplateThemeData.darkTheme,
            ),
          ],
          themeBuilder: (context, getTheme, child) {
            final theme = getTheme(context.isIOSTheme ? TargetPlatform.iOS : TargetPlatform.android);
            getIt<ThemeConfigUtil>().themeMode = theme.brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
            return child;
          },
        ),
      ],
      directories: directories,
    );
  }
}
