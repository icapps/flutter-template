#!/bin/bash
# This file should be saved under your root in `tool/s3/`

# Configuration
bucket=enter-your-bucket-here
flavor=$1
extraPath=$2
prefix=$3

# File to archive (Can be regex)
archivedFiles=(
  "app-$flavor-release.apk"
  "app-$flavor-release.aab"
  "mapping.txt"
  "build-info.txt"
  "*dsym.zip"
  "*Symbols.zip"
)

# Loading Credentials
scriptDir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo "Loading the aws configuration into the CLI"
credentialsPath="$scriptDir/credentials.csv"
rootPath=$(echo $scriptDir | sed 's/\/tool\/s3//g')
aws configure import --csv "file://$credentialsPath"

# Prepare the s3 baseUrl
s3BaseUrl=s3://$bucket
if [ ! -z "$prefix" ]; then
  s3BaseUrl=$s3BaseUrl/$prefix
fi
if [ ! -z "$flavor" ]; then
  s3BaseUrl=$s3BaseUrl/$flavor
fi
if [ ! -z "$extraPath" ]; then
  s3BaseUrl=$s3BaseUrl/$extraPath
fi

# Create build-info.txt file
echo "GIT HASH" > build-info.txt
git rev-parse HEAD >> build-info.txt
echo "" >> build-info.txt
echo "" >> build-info.txt
echo "GIT BRANCH" >> build-info.txt
git rev-parse --abbrev-ref HEAD >> build-info.txt
echo "" >> build-info.txt
echo "" >> build-info.txt

# Search for the archived files
for i in "${archivedFiles[@]}"; do
  echo ""
  echo "Searching for: $i"
  files=($(find $rootPath -name $i))
  if [ -z "$files" ]; then continue; fi
  for f in "${files[@]}"; do
    fileName=$(basename $f)
    s3Url=$s3BaseUrl/$fileName
    echo "Ready to upload $f"
    aws s3 cp $f $s3Url --profile $bucket
  done
done

# Cleanup script
rm build-info.txt