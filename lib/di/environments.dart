import 'package:injectable/injectable.dart';

class Environments {
  static const String prod = 'prod';
  static const String dev = 'dev';
  static const String dummy = 'dummy';
  static const String test = 'test';
}

const dummy = Environment(Environments.dummy);
// Dev, prod and test are defined in injectable
