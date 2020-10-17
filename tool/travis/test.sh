#!/bin/bash

dart run ./tool/travis/test_coverage_helper.dart || exit -1;

echo ""
echo "===="
echo "Start testing"
echo "===="
flutter test --coverage || exit -1;
echo "===="
echo "Finished testing"
echo "===="
echo ""
echo "===="
echo "Start coveralls upload"
echo "===="
coveralls-lcov coverage/lcov.info
echo "===="
echo "Finished coveralls upload"
echo "===="