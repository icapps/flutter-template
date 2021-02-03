import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@injectable
class MockAuthStorage extends Mock implements AuthStoring {}
