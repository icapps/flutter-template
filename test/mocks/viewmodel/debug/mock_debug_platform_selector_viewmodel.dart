import 'package:flutter/cupertino.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@injectable
class MockDebugPlatformSelectorViewModel extends Mock with ChangeNotifier implements DebugPlatformSelectorViewModel {}
