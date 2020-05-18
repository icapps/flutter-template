import 'package:connectivity/connectivity.dart';
import 'package:flutter_template/util/connectivity/connectivity_controlling.dart';

class ConnectivityController extends ConnectivityControlling {
  final Connectivity connectivity;

  ConnectivityController(this.connectivity);

  @override
  Future<bool> hasConnection() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
