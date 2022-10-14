import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_injectable.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  group('Android Asset icons', () {
    testWidgets('ThemeAsset list', (tester) async {
      const sut = IconAssetTesterAndroid(getAsset: ThemeAssets.listIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_list_android');
    });

    testWidgets('ThemeAsset settings', (tester) async {
      const sut = IconAssetTesterAndroid(getAsset: ThemeAssets.settingsIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_settings_android');
    });

    testWidgets('ThemeAsset add', (tester) async {
      const sut = IconAssetTesterAndroid(getAsset: ThemeAssets.addIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_add_android');
    });

    testWidgets('ThemeAsset download', (tester) async {
      const sut = IconAssetTesterAndroid(getAsset: ThemeAssets.downloadIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_download_android');
    });

    testWidgets('ThemeAsset close', (tester) async {
      const sut = IconAssetTesterAndroid(getAsset: ThemeAssets.closeIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_close_android');
    });

    testWidgets('ThemeAsset back', (tester) async {
      const sut = IconAssetTesterAndroid(getAsset: ThemeAssets.backIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_back_android');
    });

    testWidgets('ThemeAsset done', (tester) async {
      const sut = IconAssetTesterAndroid(getAsset: ThemeAssets.doneIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_done_android');
    });
  });

  group('IOS Asset icons', () {
    testWidgets('ThemeAsset list', (tester) async {
      const sut = IconAssetTesterIOS(getAsset: ThemeAssets.listIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_list_ios');
    });

    testWidgets('ThemeAsset settings', (tester) async {
      const sut = IconAssetTesterIOS(getAsset: ThemeAssets.settingsIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_settings_ios');
    });

    testWidgets('ThemeAsset add', (tester) async {
      const sut = IconAssetTesterIOS(getAsset: ThemeAssets.addIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_add_ios');
    });

    testWidgets('ThemeAsset download', (tester) async {
      const sut = IconAssetTesterIOS(getAsset: ThemeAssets.downloadIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_download_ios');
    });

    testWidgets('ThemeAsset close', (tester) async {
      const sut = IconAssetTesterIOS(getAsset: ThemeAssets.closeIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_close_ios');
    });

    testWidgets('ThemeAsset back', (tester) async {
      const sut = IconAssetTesterIOS(getAsset: ThemeAssets.backIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_back_ios');
    });

    testWidgets('ThemeAsset done', (tester) async {
      const sut = IconAssetTesterIOS(getAsset: ThemeAssets.doneIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_done_ios');
    });
  });
}

class IconAssetTesterAndroid extends StatelessWidget {
  final String Function(BuildContext context) getAsset;

  const IconAssetTesterAndroid({
    required this.getAsset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.android),
      child: LayoutBuilder(
        builder: (context, constraint) => SvgPicture.asset(
          getAsset(context),
          height: ThemeDimens.padding64,
          width: ThemeDimens.padding64,
          color: Colors.black,
        ),
      ),
    );
  }
}

class IconAssetTesterIOS extends StatelessWidget {
  final String Function(BuildContext context) getAsset;

  const IconAssetTesterIOS({
    required this.getAsset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.iOS),
      child: LayoutBuilder(
        builder: (context, constraint) => SvgPicture.asset(
          getAsset(context),
          height: ThemeDimens.padding64,
          width: ThemeDimens.padding64,
          color: Colors.black,
        ),
      ),
    );
  }
}
