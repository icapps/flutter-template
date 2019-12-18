// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_webservice.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UserWebservice implements UserWebservice {
  _UserWebservice(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  getUsers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/users',
        queryParameters: queryParameters, options: RequestOptions(method: 'GET', headers: <String, dynamic>{}, extra: _extra, baseUrl: baseUrl), data: _data);
    var value = _result.data.map((dynamic i) => User.fromJson(i as Map<String, dynamic>)).toList();
    return Future.value(value);
  }
}
