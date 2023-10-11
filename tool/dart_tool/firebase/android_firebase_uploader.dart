// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'firebase_uploader.dart';

const _packageNamesForFlavors = {
  'dev': 'com.icapps.fluttertemplate.debug',
  'alpha': 'com.icapps.fluttertemplate.alpha',
  'beta': 'com.icapps.fluttertemplate.beta',
  'prod': 'com.icapps.fluttertemplate',
};

Future<void> checkIfFirebaseCliIsInstalled() async {
  final result = await Process.run('which', ['firebase']);
  if (result.stdout.toString().contains('not found')) {
    throw Exception('Firebase CLI is required for to upload the android symbols.\n'
        'Make sure this is installed `https://firebase.google.com/docs/cli#install_the_firebase_cli`\n\n'
        'Run command to install firebase cli: `type firebase || curl -sL https://firebase.tools | bash`\n');
  }
  print('firebase cli is installed');
}

Future<void> uploadAndroidSymbols(String packageNameOrFlavor, Directory symbolsDirectory, String? package) async {
  if (!(await symbolsDirectory.exists())) throw Exception('Symbols directory not found at ${symbolsDirectory.path}');
  try {
    print('Check if $packageNameOrFlavor is a package name');
    await _uploadAndroidSymbolsForPackageName(packageNameOrFlavor, symbolsDirectory, package);
  } on Exception catch (error) {
    print(error);
    print('Check if $packageNameOrFlavor is a flavor');
    await _uploadAndroidSymbolsForFlavor(packageNameOrFlavor, symbolsDirectory, package);
  }
}

Future<void> _uploadAndroidSymbolsForFlavor(String flavor, Directory symbolsDirectory, String? package) async {
  final key = package == null ? flavor : '$package-$flavor';
  final packageName = _packageNamesForFlavors[key];
  if (packageName == null) throw Exception('No package name found for flavor `$flavor` (tested with key: $key)');
  await _uploadAndroidSymbolsForPackageName(packageName, symbolsDirectory, package);
}

Future<void> _uploadAndroidSymbolsForPackageName(String packageName, Directory symbolsDirectory, String? package) async {
  File? activeGoogleServiceFile;
  final androidSrcDirectory = Directory('android/app/src');
  for (final directory in await androidSrcDirectory.list().toList()) {
    if (directory is Directory) {
      final flavor = directory.path.split('/').last;
      final googleServiceFlavorFile = File('${androidSrcDirectory.path}/$flavor/google-services.json');
      if (await googleServiceFlavorFile.exists()) {
        activeGoogleServiceFile = googleServiceFlavorFile;
      }
    }
  }
  final googleServiceFile = File('android/app/google-services.json');
  if (activeGoogleServiceFile == null) {
    if (await googleServiceFile.exists()) {
      activeGoogleServiceFile = googleServiceFile;
    } else {
      throw Exception('No google-services.json file found at `${googleServiceFile.path}` or `${androidSrcDirectory.path}/*/google');
    }
  }
  final fileContent = await activeGoogleServiceFile.readAsString();
  final clients = AndroidGoogleServiceData.parseGoogleServices(fileContent);
  final correctClients = clients.where((element) => element.packageName == packageName);
  if (correctClients.isEmpty) {
    throw Exception('No client found with package name `$packageName` in ${activeGoogleServiceFile.path}');
  } else if (correctClients.length > 1) {
    throw Exception('To many clients found with package name `$packageName` in ${activeGoogleServiceFile.path}: ${correctClients.length}');
  }
  final correctClient = correctClients.first;
  final appId = correctClient.appId;
  print('AppId found for $packageName in ${activeGoogleServiceFile.path}: $appId');
  print('Uploading the symbols to Firebase:...');
  await runProcess("firebase", ["crashlytics:symbols:upload", "--app=$appId", symbolsDirectory.path]);
}

class AndroidGoogleServiceData {
  final String appId;
  final String packageName;

  AndroidGoogleServiceData._({
    required this.appId,
    required this.packageName,
  });

  static List<AndroidGoogleServiceData> parseGoogleServices(String jsonData) {
    final data = jsonDecode(jsonData) as Map<String, dynamic>;
    final clientsData = data['client'] as List<dynamic>;
    return clientsData
        .map(
          (dynamic e) => AndroidGoogleServiceData._(
            appId: e['client_info']['mobilesdk_app_id'] as String,
            packageName: e['client_info']['android_client_info']['package_name'] as String,
          ),
        )
        .toList();
  }
}
