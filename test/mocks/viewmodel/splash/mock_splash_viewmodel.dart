import 'package:flutter/cupertino.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@Singleton(as: SplashViewModel)
class MockSplashViewModel extends Mock with ChangeNotifier implements SplashViewModel {}
