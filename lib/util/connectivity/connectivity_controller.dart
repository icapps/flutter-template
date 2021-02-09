import 'package:connectivity/connectivity.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/util/connectivity/connectivity_controlling.dart';
import 'package:injectable/injectable.dart';

@dev
@alpha
@beta
@prod
@Singleton(as: ConnectivityControlling)
class ConnectivityController extends ConnectivityControlling {
  final Connectivity connectivity;

  ConnectivityController(this.connectivity);

  @override
  Future<bool> hasConnection() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
