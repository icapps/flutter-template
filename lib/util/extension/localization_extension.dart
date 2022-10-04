import 'package:flutter_template/util/locale/localization.dart';
import 'package:get_it/get_it.dart';

extension LocalizationExtension on Object {
  Localization get localization => GetIt.I();
}
