import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@Singleton(as: LoginRepo)
class MockLoginRepository extends Mock implements LoginRepo {}
