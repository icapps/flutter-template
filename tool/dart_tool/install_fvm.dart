import 'dart:convert';
import 'dart:io';

void main() {
  final file = File('.fvm/fvm_config.json');
  final dynamic jsonObject = json.decode(file.readAsStringSync());
  final map = jsonObject as Map<String, String>; // ignore: avoid_as
  final version = map['flutterSdkVersion'];

  executeCommand('rm', ['.fvm/flutter_sdk']);
  executeCommand('fvm', ['version']);
  executeCommand('fvm', ['install', version]);
  executeCommand('fvm', ['use', version]);
}

void executeCommand(String cmd, List<String> params) {
  final fullCommand = '$cmd ${params.join(' ')}';
  try {
    printMessage('\nExecuting command:\n$fullCommand');
    final result = Process.runSync(cmd, params);
    final dynamic output = result.stdout;
    if (output.toString().isNotEmpty) {
      printMessage('$output');
    }
  } catch (e) {
    printMessage('\nFailed to execute command: $fullCommand\n$e');
  }
}

void printMessage(Object message) {
  // ignore: avoid_print
  print(message);
}
