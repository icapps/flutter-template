import 'package:flutter_template/repository/secure_storage/secure_storing.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@injectable
class MockSecureStorage extends Mock implements SecureStoring {}
