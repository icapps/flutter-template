#!/bin/bash

regex='"flutterSdkVersion": "(.*)",'
version=""

flutter pub global activate fvm
fvmFlutterConfig=`cat .fvm/fvm_config.json`

if [[ $fvmFlutterConfig =~ $regex ]]; then
  version="${BASH_REMATCH[1]}"
  echo "Flutter version: $version"
fi

if [ "$version" == "" ]; then
  echo "fvm flutter version could be fetched"
  exit -1;
fi

echo "Removing the old flutter sdk reference"
rm .fvm/flutter_sdk

echo "fvm --version"
fvm --version

echo "fvm install $version"
fvm install $version

if [ "$version" == "stable" ] || [ "$version" == "beta" ] || [ "$version" == "dev" ] || [ "$version" == "master" ]; then
    echo "fvm flutter upgrade $version"
fi

echo "fvm use $version"
fvm use $version

echo "fvm flutter pub get"
fvm flutter pub get