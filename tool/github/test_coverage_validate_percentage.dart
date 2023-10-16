import 'dart:io';

const minRequiredCoverage = 0;

void main(List<String> args) {
  printMessage('Start checking the lcov.info file');
  final file = File('coverage/lcov.info');
  if (!file.existsSync()) {
    printMessage('${file.path}" does not exist');
    return;
  }
  var totalLines = 0;
  var totalLinesCovered = 0;
  final lines = file.readAsLinesSync();
  for (final line in lines) {
    if (line.startsWith('DA')) {
      totalLines++;
    } else if (line.startsWith('LH')) {
      totalLinesCovered += int.parse(line.replaceAll('LH:', ''));
    }
  }
  final codeCoveragePercentage = (totalLinesCovered / totalLines) * 100;
  if (codeCoveragePercentage == 100) {
    printMessage('\n100% CODE COVERAGE!!!!\n');
  } else if (codeCoveragePercentage >= minRequiredCoverage) {
    printMessage('COVERAGE IS ${codeCoveragePercentage.toStringAsFixed(2)}%\n');
    printMessage('TIS IS ABOVE THE MIN REQUIRED TARGET of $minRequiredCoverage%\n');
  } else {
    printMessage('\nCODE COVERAGE IS TO LOW!!\n');
    printMessage('COVERAGE IS ${codeCoveragePercentage.toStringAsFixed(2)}%\n');
    printMessage('AMOUNT OF LINES:$totalLines');
    printMessage('AMOUNT OF COVERED:$totalLinesCovered\n');
    exit(-1);
  }
}

void printMessage(String message) {
  // ignore: avoid_print
  print(message);
}
