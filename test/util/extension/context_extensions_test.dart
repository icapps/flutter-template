import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_template/util/extension/context_extensions.dart';

import '../../di/test_kiwi_util.dart';
import '../test_util.dart';

void main() {
  setUp(() async => TestKiwiUtil.init());

  testWidgets('BuildContextAndroidTest isAndroid', (tester) async {
    final sut = BuildContextAndroidTest();
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'context_extensions_is_android');
  });

  testWidgets('BuildContextAndroidTest isAndroid', (tester) async {
    final sut = BuildContextAndroidFalseTest();
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'context_extensions_is_android_false');
  });

  testWidgets('BuildContextIOSTest isIOS', (tester) async {
    final sut = BuildContextIOSTest();
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'context_extensions_is_ios');
  });

  testWidgets('BuildContextIOSFalseTest isIOS', (tester) async {
    final sut = BuildContextIOSFalseTest();
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'context_extensions_is_ios_false');
  });
}

class BuildContextAndroidTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.android),
      child: LayoutBuilder(
        builder: (context, constraint) {
          final isAndroid = context.isAndroid;
          return Text(isAndroid.toString());
        },
      ),
    );
  }
}

class BuildContextAndroidFalseTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.iOS),
      child: LayoutBuilder(
        builder: (context, constraint) {
          final isAndroid = context.isAndroid;
          return Text(isAndroid.toString());
        },
      ),
    );
  }
}

class BuildContextIOSTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.iOS),
      child: LayoutBuilder(
        builder: (context, constraint) {
          final isIOS = context.isIOS;
          return Text(isIOS.toString());
        },
      ),
    );
  }
}

class BuildContextIOSFalseTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.android),
      child: LayoutBuilder(
        builder: (context, constraint) {
          final isIOS = context.isIOS;
          return Text(isIOS.toString());
        },
      ),
    );
  }
}
