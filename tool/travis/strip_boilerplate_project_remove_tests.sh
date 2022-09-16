#!/bin/bash

./tool/install_fvm.sh
printf 'no\n' | fvm flutter pub run ./tool/dart_tool/strip_boilerplate_project.dart || exit -1;

fvm flutter analyze