import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@injectable
class MockSharedPrefsStorage extends Mock implements SharedPrefsStoring {}
