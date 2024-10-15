import 'package:flutter/widgets.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:intl/intl.dart';

extension DateTimeExtentions on DateTime {
  BuildContext get _context => getIt<MainNavigator>().context;

  String get shortDateFormat => _formatDateWithFormatString(formatString: 'dd/MM/yyyy');

  String get shortDateWeekdayFormat => _formatDateWithFormatString(formatString: 'EEEE dd/MM/yyyy');

  String _formatDateWithFormatString({required String formatString}) {
    final languageTag = Localization.of(_context).locale?.languageCode;
    final dateFormat = DateFormat(formatString, languageTag);
    return dateFormat.format(toLocal());
  }
}
