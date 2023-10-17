#!/bin/bash

echo "Remove github workflows"
rm -rf .github

echo "Remove rename project scripts"
rm tool/rename_project.sh
rm tool/dart_tool/rename_project.dart

echo "Remove strip boilerplate scripts"
rm tool/strip_boilerplate_project.sh
rm tool/dart_tool/strip_boilerplate_project.dart

echo "Remove self"
rm tool/remove_template_setup_scripts.sh