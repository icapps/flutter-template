import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit({this.loginRepo}) : super(InitialLoginState());

  Future<void> onLoginClicked(String email, String password) async {
    try {
      emit(LoadingLoginState());
      await loginRepo.login(email: email, password: password);
      emit(LoadedLoginState());
    } catch (e) {
      FlutterTemplateLogger.logError(message: 'Failed to login', error: e);
      emit(ErrorLoginState('Failed to login', e));
    }
  }
}
