import 'package:flutter_template/util/connectivity/connectivity_controlling.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@Singleton(as: ConnectivityControlling)
class MockConnectivityController extends Mock implements ConnectivityControlling {}
