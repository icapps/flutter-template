// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'android_firebase_uploader.dart';
import 'ios_firebase_uploader.dart';

Future<void> main(List<String> args) async {
  try {
    final platform = args[0].toLowerCase();
    final packageNameOrFlavor = args[1];
    if (platform == 'android') {
      final symbolsDirectory = args[2];
      final package = args[3];
      await checkIfFirebaseCliIsInstalled();
      await uploadAndroidSymbols(packageNameOrFlavor, Directory(symbolsDirectory), package);
    } else if (platform == 'ios') {
      final package = args[2];
      await uploadIosSymbols(packageNameOrFlavor, package);
    } else {
      throw Exception('Platform `$platform` not supported, Supported platforms: `android, ios`');
    }
  } on Exception catch (error) {
    print('Failed to complete the firebase uploader:');
    print(error);
    exit(-1);
  }
}

Future<void> runProcess(String command, List<String> args) async {
  print('\n  $command ${args.join(' ')}\n');
  final completer = Completer<void>();
  final result = await Process.start(
    command,
    args,
    mode: ProcessStartMode.detachedWithStdio,
  );
  print('======================================================================');
  final subscription = result.stdout.listen((codeUnits) => stdout.write(utf8.decode(codeUnits)));
  subscription.onDone(() {
    print('======================================================================');
    completer.complete();
  });
  subscription.onError((dynamic error) => completer.completeError('Failed to complete process run: $error'));
  return completer.future;
}
