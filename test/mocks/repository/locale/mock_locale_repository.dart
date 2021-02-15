import 'package:flutter_template/repository/locale/locale_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@Singleton(as: LocaleRepo)
class MockLocaleRepoitory extends Mock implements LocaleRepo {}
