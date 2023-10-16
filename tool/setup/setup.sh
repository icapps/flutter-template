#!/bin/bash

fvm flutter pub run tool/setup/dart/rename_project.dart

fvm flutter pub run tool/setup/dart/strip_boilerplate_project.dart

fvm flutter pub run tool/setup/dart/android_keystore_generator.dart

# Cleanup setup
echo "Remove github workflows"
rm -rf .github
rm -rf tool/github

echo "Remove setup scripts"
rm -rf tool/setup