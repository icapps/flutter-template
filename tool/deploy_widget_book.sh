#!/bin/bash

CURRENT=`pwd`
DIR_NAME=`basename "$CURRENT"`
if [ $DIR_NAME == 'tool' ]
then
  cd ..
fi

fvm flutter build web --release -t lib/widgetbook/widgetbook.dart --output widgetbook --base-href="/flutter-template/widgetbook/"