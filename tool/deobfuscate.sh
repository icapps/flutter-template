#!/bin/bash

CURRENT=`pwd`
DIR_NAME=`basename "$CURRENT"`
if [ $DIR_NAME == 'tool' ]
then
  cd ..
fi

#fvm flutter symbolize -i <stack trace file> -d /out/android/app.android-arm64.symbols

fvm flutter symbolize -i $1 -d $2