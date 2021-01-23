#!/bin/bash

./tool/install_fvm.sh
printf 'no\n' | flutter pub run ./tool/dart_tool/strip_boilerplate_project.dart || exit -1;

flutter analyze