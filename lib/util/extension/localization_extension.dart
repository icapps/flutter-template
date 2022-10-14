import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/util/locale/localization.dart';

extension LocalizationExtension on Object {
  Localization get localization => getIt();
}
