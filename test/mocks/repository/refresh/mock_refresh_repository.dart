import 'package:flutter_template/repository/refresh/refresh_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@Singleton(as: RefreshRepo)
class MockRefreshRepository extends Mock implements RefreshRepo {}
