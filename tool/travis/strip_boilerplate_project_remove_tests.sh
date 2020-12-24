#!/bin/bash

printf 'no\n' | flutter pub run ./tool/dart_tool/strip_boilerplate_project.dart || exit -1;

flutter analyze
flutter test