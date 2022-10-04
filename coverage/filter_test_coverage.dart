import 'dart:io';

void main() {
  printMessage('Start filtering the lcov.info file');
  final file = File('coverage/lcov.info');
  if (!file.existsSync()) {
    printMessage('"lcov.info" does not exist');
    return;
  }
  const endOfRecord = 'end_of_record';
  final sections = <LcovSection>[];
  final lines = file.readAsLinesSync();
  LcovSection? currentSection;
  for (final line in lines) {
    if (line.endsWith('.dart')) {
      final filePath = line.replaceAll('SF:', '');
      currentSection = LcovSection()
        ..header = line
        ..filePath = filePath;
    } else if (line == endOfRecord) {
      final currentSectionTmp = currentSection;
      if (currentSectionTmp != null) {
        currentSectionTmp.footer = line;
        sections.add(currentSectionTmp);
      }
    } else {
      currentSection?.body.add(line);
    }
  }
  final filteredSections = getFilteredSections(sections);
  final sb = StringBuffer();
  for (final section in filteredSections) {
    sb.write(section.toString());
  }
  file.writeAsStringSync(sb.toString());
  printMessage('Filtered the lcov.info file');
}

class LcovSection {
  String? filePath;
  String? header;
  final body = <String>[];
  String? footer;

  String? getBodyString() {
    final filePathTmp = filePath;
    if (filePathTmp == null) return null;
    final file = File(filePathTmp);
    final content = file.readAsLinesSync();
    final sb = StringBuffer();
    getFilteredBody(body, content).forEach((item) => sb
      ..write(item)
      ..write('\n'));
    return sb.toString();
  }

  @override
  String toString() {
    return '$header\n${getBodyString()}$footer\n';
  }
}

List<LcovSection> getFilteredSections(List<LcovSection> sections) {
  return sections.where((section) {
    final header = section.header;
    if (header == null) return false;
    if (header.endsWith('.g.dart')) {
      return false;
    } else if (header.endsWith('dummy_service.dart')) {
      return false;
    } else if (header.startsWith('SF:lib/vendor/')) {
      return false;
    } else if (header.startsWith('SF:lib/util/locale')) {
      return false;
    }
    return true;
  }).toList();
}

List<String> getFilteredBody(List<String> body, List<String> lines) {
  return body.where((line) {
    if (line.startsWith('DA:')) {
      final sections = line.split(',');
      final lineNr = int.parse(sections[0].replaceAll('DA:', ''));
      final callCount = int.parse(sections[1]);
      if (callCount == 0) {
        final fileLine = lines[lineNr - 1].trim();
        if (excludedLines.contains(fileLine)) {
          return false;
        }
        for (final line in excludedStartsWithLines) {
          if (fileLine.trim().startsWith(line)) {
            return false;
          }
        }
      }
    }
    return true;
  }).toList();
}

const excludedLines = [
  'AppConstants._();',
  'EnvUtils._();',
  'FlutterTemplateLogger._();',
  'FlutterTemplateThemeData._();',
  'Keys._();',
  'LicenseUtil._();',
  'ThemeAssets._();',
  'ThemeColors._();',
  'ThemeDimens._();',
  'ThemeDurations._();',
  'ThemeFonts._();',
  'ThemeTextStyles._();',
];

const excludedStartsWithLines = [
  'IntColumn get ',
  'TextColumn get ',
  'BoolColumn get ',
  'DateTimeColumn get ',
];

void printMessage(String message) {
  // ignore: avoid_print
  print(message);
}
