import 'package:flutter_template/repository/shared_prefs/local/local_storing.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@Singleton(as: LocalStoring)
class MockLocalStorage extends Mock implements LocalStoring {}
