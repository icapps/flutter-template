#!/bin/bash

printf 'yes\n' | flutter pub run ./tool/dart_tool/strip_boilerplate_project.dart || exit -1;

flutter analyze