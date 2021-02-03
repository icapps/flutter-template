import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

@test
@injectable
class MockSharedPreferences extends Mock implements SharedPreferences {}
