import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/util/license.dart';

part 'license_state.dart';

class LicenseCubit extends Cubit<LicenseState> {
  LicenseCubit() : super(const InitialLicenseState());

  loadLicenses() {
    emit(InitialLicenseState(LicenseUtil.getLicenses()));
  }
}
