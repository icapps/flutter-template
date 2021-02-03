import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@injectable
class MockDebugRepository extends Mock implements DebugRepo {}
