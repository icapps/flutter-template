#!/bin/bash

echo "Removing github workflows"
rm -rf .github
rm -rf tool/github

echo "Removing setup scripts"
rm -rf tool/setup