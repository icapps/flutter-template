// ignore_for_file: avoid_print
import 'dart:io';

import 'firebase_uploader.dart';

const _bundleIdsForFlavors = {
  'customer-dev': 'be.bluebike.rider.dev',
  'customer-alpha': 'be.bluebike.rider.alpha',
  'customer-beta': 'be.bluebike.rider.beta',
  'customer-prod': 'be.bluebike.rider',
  'service-dev': 'be.bluebike.service.dev',
  'service-alpha': 'be.bluebike.service.alpha',
  'service-beta': 'be.bluebike.service.beta',
  'service-prod': 'be.bluebike.service',
};

Future<void> uploadIosSymbols(String bundleIdOrFlavor, String? package) async {
  final dsymFile = File("Runner.app.dSYM.zip");
  if (!(await dsymFile.exists())) throw Exception('${dsymFile.path} not found. So it is not possible to upload dsym/symbol files to Firebase');
  try {
    print('Check if $bundleIdOrFlavor is a bundle id');
    await _uploadIosSymbolsForBundleId(bundleIdOrFlavor, dsymFile);
  } on Exception catch (error) {
    print(error);
    print('Check if $bundleIdOrFlavor is a flavor');
    await _uploadIosSymbolsForFlavor(bundleIdOrFlavor, dsymFile, package);
  }
}

Future<void> _uploadIosSymbolsForFlavor(String flavor, File dsymFile, String? package) async {
  final key = package == null ? flavor : '$package-$flavor';
  final bundleId = _bundleIdsForFlavors[key];
  if (bundleId == null) throw Exception('No bundle id found for flavor `$flavor` (tested with key: $key)');
  await _uploadIosSymbolsForBundleId(bundleId, dsymFile);
}

Future<void> _uploadIosSymbolsForBundleId(String bundleId, File dsymFile) async {
  final googleServicePlistFile = File('ios/Runner/GoogleService-Info.plist');
  if (!(await googleServicePlistFile.exists())) throw Exception('No GoogleService-Info.plist file found at `${googleServicePlistFile.path}`');
  final fileContent = await googleServicePlistFile.readAsString();
  final correctClient = IosGoogleServiceData.parseGoogleServicePlist(fileContent);
  if (correctClient.bundleId != bundleId) throw Exception('The bundleId in the ${googleServicePlistFile.path} file does not match the one provided: $bundleId');
  final appId = correctClient.appId;
  print('AppId found for $bundleId in ${googleServicePlistFile.path}: $appId');
  print('Uploading the symbols to Firebase:...');
  await runProcess("ios/Pods/FirebaseCrashlytics/upload-symbols", ["-gsp", googleServicePlistFile.path, "-p", "ios", dsymFile.path]);
}

class IosGoogleServiceData {
  final String appId;
  final String bundleId;

  IosGoogleServiceData._({
    required this.appId,
    required this.bundleId,
  });

  static IosGoogleServiceData parseGoogleServicePlist(String jsonData) => IosGoogleServiceData._(
        appId: _getStringValue('GOOGLE_APP_ID', jsonData),
        bundleId: _getStringValue('BUNDLE_ID', jsonData),
      );

  static String _getStringValue(String key, String input) {
    final regex = RegExp('<key>$key</key>\\n.*<string>(.*)</string>');
    final allMatches = regex.allMatches(input);
    if (allMatches.isEmpty) return throw Exception('No value found for key `$key` in $input');
    if (allMatches.length != 1) return throw Exception('More than 1 value found for key `$key` in $input');
    final match = allMatches.first;
    final value = match.group(1);
    if (value == null) return throw Exception('No value found for key `$key` in $input');
    return value;
  }
}
