import 'package:flutter_template/styles/theme_data.dart';
import 'package:get_it/get_it.dart';

extension ThemeExtension on Object {
  FlutterTemplateTheme get theme => GetIt.I();
}
