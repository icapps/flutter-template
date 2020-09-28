import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storing.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final LoginRepo loginRepo;
  final LocalStoring localStoring;

  SplashCubit({this.loginRepo, this.localStoring}) : super(SplashInitial());

  Future<void> checkLoggedIn() async {
    await localStoring.checkForNewInstallation();
    final result = await loginRepo.isLoggedIn();
    emit(LoadedSplashState(isLoggedIn: result));
  }
}
