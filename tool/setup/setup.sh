#!/bin/bash

echo "Setup 1/4: Rename project"
tool/setup/rename_project.sh || exit -1

echo "Setup 2/4: Strip boilerplate project"
tool/setup/strip_boilerplate_project.sh || exit -1

echo "Setup 3/4: Android keystore generator"
tool/setup/android_keystore_generator.sh || exit -1

echo "Setup 4/4: Removing setup scripts"
tool/setup/remove_setup_scripts.sh || exit -1