#!/bin/bash

echo "Remove Travis scripts"
rm .travis.yml
rm -rf tool/travis

echo "Remove Rename Project scripts"
rm tool/rename_project.sh
rm tool/dart_tool/rename_project.dart

echo "Remove Self"
rm tool/remove_github_references.sh