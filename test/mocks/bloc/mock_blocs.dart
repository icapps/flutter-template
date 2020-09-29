import 'package:flutter/material.dart';
import 'package:flutter_template/cubit/global/global_cubit.dart';
import 'package:flutter_template/cubit/license/license_cubit.dart';
import 'package:flutter_template/cubit/login/login_cubit.dart';
import 'package:flutter_template/cubit/splash/splash_cubit.dart';
import 'package:flutter_template/cubit/todoAdd/todo_add_cubit.dart';
import 'package:flutter_template/cubit/todoList/todo_list_cubit.dart';
import 'package:mockito/mockito.dart';

class MockGlobalCubit extends Mock implements GlobalCubit {}

class MockLicenseCubit extends Mock implements LicenseCubit {}

class MockLoginCubit extends Mock implements LoginCubit {}

class MockSplashCubit extends Mock implements SplashCubit {}

class MockTodoAddCubit extends Mock implements TodoAddCubit {}

class MockTodoListCubit extends Mock implements TodoListCubit {}
