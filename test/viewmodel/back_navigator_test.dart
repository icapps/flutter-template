import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/viewmodel/back_navigator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../di/test_kiwi_util.dart';
import '../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../screen/seed.dart';
import '../util/test_extensions.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async {
    await TestKiwiUtil.init();
  });

  testWidgets('Test splash screen navigator', (tester) async {
    seedGlobalViewModel();

    final mockNavigation = MockMainNavigation();
    final debugKey = GlobalKey<BackScreenState>();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: BackScreen(key: debugKey),
    );
    await TestUtil.loadScreen(tester, sut);

    debugKey.currentState.goBack<void>();
    verify(mockNavigation.goBack<void>()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    debugKey.currentState.goBack(result: 'testing');
    verify(mockNavigation.goBack(result: 'testing')).calledOnce();
    verifyNoMoreInteractions(mockNavigation);
  });
}

class BackScreen extends StatefulWidget {
  const BackScreen({Key key}) : super(key: key);

  @override
  BackScreenState createState() => BackScreenState();
}

@visibleForTesting
class BackScreenState extends State<BackScreen> with BackNavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
