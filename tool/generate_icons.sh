#!/bin/bash

CURRENT=`pwd`
DIR_NAME=`basename "$CURRENT"`
if [ $DIR_NAME == 'tool' ]
then
  cd ..
fi

fvm flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-dev.yaml
fvm flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-alpha.yaml
fvm flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-beta.yaml
fvm flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-prod.yaml