import 'package:flutter_template/repository/refresh/refresh_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@injectable
class MockRefreshRepository extends Mock implements RefreshRepo {}
