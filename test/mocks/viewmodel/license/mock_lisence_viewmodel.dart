import 'package:flutter/cupertino.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@injectable
class MockLicenseViewModel extends Mock with ChangeNotifier implements LicenseViewModel {}
