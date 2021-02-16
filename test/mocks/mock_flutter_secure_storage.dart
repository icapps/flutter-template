import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@Singleton(as: FlutterSecureStorage)
class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}
