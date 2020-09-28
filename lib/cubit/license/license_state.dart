part of 'license_cubit.dart';

abstract class LicenseState extends Equatable {
  const LicenseState();

  @override
  List<Object> get props => [];
}

class InitialLicenseState extends LicenseState {
  final List<License> licenses;

  const InitialLicenseState([this.licenses]);

  @override
  List<Object> get props => [licenses];
}
