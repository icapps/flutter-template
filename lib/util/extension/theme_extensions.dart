import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_data.dart';

extension ThemeExtension on Object {
  FlutterTemplateTheme get theme => getIt();
}
