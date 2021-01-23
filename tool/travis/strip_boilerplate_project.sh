#!/bin/bash

./tool/install_fvm.sh
printf 'yes\n' | flutter pub run ./tool/dart_tool/strip_boilerplate_project.dart || exit -1;

fvm flutter analyze
fvm flutter test --update-goldens test/screen/home/home_screen_test.dart
fvm flutter test --update-goldens test/navigator/main_navigator_home_test.dart
fvm flutter test