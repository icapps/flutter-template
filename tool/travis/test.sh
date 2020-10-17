#!/bin/bash

echo "==="
echo "First create a file with all other files imported so flutter test coverage uses all files"
file=test/coverage_helper_test.dart
echo "// Helper file to make coverage work for all dart files\n" > $file
echo "// ignore_for_file: unused_import" >> $file
find lib -name '*.dart' | cut -c4- | awk -v package=$1 '{printf "import '\''package:%s%s'\'';\n", "model_generator", $1}' >> $file
echo "" >> $file
echo "void main(){}" >> $file
echo "==="

flutter test --coverage || exit -1;

coveralls-lcov coverage/lcov.info