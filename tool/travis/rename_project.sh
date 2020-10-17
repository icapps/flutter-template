#!/bin/bash

printf 'Test Project\ndescription\ntest_project\nTestProject\ncom.test.project\nn\n' | dart run ./tool/rename_project.dart || exit -1;
