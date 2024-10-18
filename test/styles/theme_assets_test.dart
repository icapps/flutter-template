import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/test_util.dart';

void main() {
  group('Android Asset icons', () {
    testWidgets('ThemeAsset list', (tester) async {
      const sut = IconAssetTesterAndroid(asset: ThemeAssets.todoIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_list_android');
    });

    testWidgets('ThemeAsset settings', (tester) async {
      const sut = IconAssetTesterAndroid(asset: ThemeAssets.settingsIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_settings_android');
    });

    testWidgets('ThemeAsset add', (tester) async {
      const sut = IconAssetTesterAndroid(asset: ThemeAssets.addIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_add_android');
    });

    testWidgets('ThemeAsset download', (tester) async {
      const sut = IconAssetTesterAndroid(asset: ThemeAssets.downloadIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_download_android');
    });

    testWidgets('ThemeAsset close', (tester) async {
      const sut = IconAssetTesterAndroid(asset: ThemeAssets.arrowLeftIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_close_android');
    });

    testWidgets('ThemeAsset back', (tester) async {
      const sut = IconAssetTesterAndroid(asset: ThemeAssets.arrowLeftIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_back_android');
    });

    testWidgets('ThemeAsset done', (tester) async {
      const sut = IconAssetTesterAndroid(asset: ThemeAssets.checkIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_done_android');
    });
  });

  group('IOS Asset icons', () {
    testWidgets('ThemeAsset list', (tester) async {
      const sut = IconAssetTesterIOS(asset: ThemeAssets.todoIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_list_ios');
    });

    testWidgets('ThemeAsset settings', (tester) async {
      const sut = IconAssetTesterIOS(asset: ThemeAssets.settingsIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_settings_ios');
    });

    testWidgets('ThemeAsset add', (tester) async {
      const sut = IconAssetTesterIOS(asset: ThemeAssets.addIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_add_ios');
    });

    testWidgets('ThemeAsset download', (tester) async {
      const sut = IconAssetTesterIOS(asset: ThemeAssets.downloadIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_download_ios');
    });

    testWidgets('ThemeAsset close', (tester) async {
      const sut = IconAssetTesterIOS(asset: ThemeAssets.arrowLeftIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_close_ios');
    });

    testWidgets('ThemeAsset back', (tester) async {
      const sut = IconAssetTesterIOS(asset: ThemeAssets.arrowLeftIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_back_ios');
    });

    testWidgets('ThemeAsset done', (tester) async {
      const sut = IconAssetTesterIOS(asset: ThemeAssets.checkIcon);

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'theme_asset_done_ios');
    });
  });
}

class IconAssetTesterAndroid extends StatelessWidget {
  final String asset;

  const IconAssetTesterAndroid({
    required this.asset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.android),
      child: LayoutBuilder(
        builder: (context, constraint) => SvgPicture.asset(
          asset,
          height: 64,
          width: 64,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class IconAssetTesterIOS extends StatelessWidget {
  final String asset;

  const IconAssetTesterIOS({
    required this.asset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.iOS),
      child: LayoutBuilder(
        builder: (context, constraint) => SvgPicture.asset(
          asset,
          height: 64,
          width: 64,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
    );
  }
}
