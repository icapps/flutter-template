import 'package:flutter/cupertino.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@Singleton(as: DebugViewModel)
class MockDebugViewModel extends Mock with ChangeNotifier implements DebugViewModel {}
