#!/bin/bash

printf 'Test Project\ndescription\ntest_project\nTestProject\ncom.test.project\nn\ny\n' | dart run ./tool/dart_tool/rename_project.dart || exit -1;
