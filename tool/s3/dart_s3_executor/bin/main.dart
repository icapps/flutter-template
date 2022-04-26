import 'dart:io';

import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

Future<void> main(List<String> args) async {
  final buildNr = int.tryParse(args[0]);
  if (buildNr == null) {
    log('First argument should be a number');
    exit(-1);
  }
  final flavor = args[1];
  final s3ScripPath = args[2];
  String? prefix;
  if (args.length >= 4) {
    prefix = args[3];
  }
  final repoRoot = Platform.script.path.replaceAll(join('tool', 's3', 'dart_s3_executor', 'bin', 'main.dart'), '');
  final yamlPath = join(repoRoot, 'pubspec.yaml');
  final yamlFile = File(yamlPath);
  final yaml = loadYaml(yamlFile.readAsStringSync()) as YamlMap;
  final version = yaml['version'] as String;

  log('Ready to upload archives for $flavor with version: $version and buildNr: $buildNr');
  ProcessResult? result;
  if (prefix == null) {
    result = await Process.run(s3ScripPath, [flavor, '$version-($buildNr)'], runInShell: true);
  } else {
    result = await Process.run(s3ScripPath, [flavor, '$version-($buildNr)', prefix], runInShell: true);
  }
  log(result.stdout);
  log(result.stderr);
}

void log(dynamic data) => print(data); // ignore: avoid_print
