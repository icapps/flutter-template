import 'package:flutter/cupertino.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@injectable
class MockGlobalViewModel extends Mock with ChangeNotifier implements GlobalViewModel {}
