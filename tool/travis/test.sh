#!/bin/bash

dart run ./tool/travis/test_full_coverage_test_file_creator.dart || exit -1;

flutter test --coverage || exit -1;

coveralls-lcov coverage/lcov.info