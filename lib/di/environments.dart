import 'package:injectable/injectable.dart';

class Environments {
  static const String ALPHA = 'alpha';
  static const String BETA = 'beta';
  static const String PROD = 'prod';
  static const String DEV = 'dev';
  static const String DUMMY = 'dummy';
  static const String TEST = 'test';
}

const dummy = Environment(Environments.DUMMY);
const alpha = Environment(Environments.ALPHA);
const beta = Environment(Environments.BETA);
// Dev, prod and test are defined in injectable
