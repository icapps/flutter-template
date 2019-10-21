import 'package:dio/dio.dart';
import 'package:flutter_template/repository/api.dart';

///
/// FlutterApi is defined as a singleton in the injector.dart
/// FlutterApi should be accessed by KiwiContainer.resolve<FlutterApi>()
///
class FlutterApi extends Api {
  static const apiAssetPath = 'assets/api';

  final Dio _dio;

  FlutterApi(this._dio);

  @override
  Future<String> get(String url) async {
    final response = await _dio.get<String>(url);
    return response.data;
  }
}
