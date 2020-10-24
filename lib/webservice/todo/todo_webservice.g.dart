// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_webservice.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TodoWebService implements TodoWebService {
  _TodoWebService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<Todo>> getTodos() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/todos',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Todo.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
