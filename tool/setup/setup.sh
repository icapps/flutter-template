#!/bin/bash

echo "Setup 1/3: Rename project"
tool/setup/rename_project.sh || exit -1

echo "Setup 2/3: Strip boilerplate project"
tool/setup/strip_boilerplate_project.sh || exit -1

echo "Setup 3/3: Android keystore generator"
tool/setup/android_keystore_generator.sh || exit -1

# Cleanup setup
echo "Remove github workflows"
rm -rf .github
rm -rf tool/github

echo "Remove setup scripts"
rm -rf tool/setup