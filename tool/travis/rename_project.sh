#!/bin/bash

printf 'Test Project\n\n\n' | dart run ./tool/rename_project.dart || exit -1;
