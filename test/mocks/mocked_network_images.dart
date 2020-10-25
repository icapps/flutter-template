import 'dart:io';

import 'package:flutter_template/vendor/transparant_image.dart';
import 'package:mockito/mockito.dart';

R provideMockedNetworkImages<R>(R body(), {List<int> imageBytes = TransparantImageUtil.transparentImage}) {
  return HttpOverrides.runZoned(
    body,
    createHttpClient: (_) => _createMockImageHttpClient(_, imageBytes),
  );
}

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpClientRequest extends Mock implements HttpClientRequest {}

class MockHttpClientResponse extends Mock implements HttpClientResponse {}

class MockHttpHeaders extends Mock implements HttpHeaders {}

// Returns a mock HTTP client that responds with an image to all requests.
MockHttpClient _createMockImageHttpClient(SecurityContext _, List<int> imageBytes) {
  final client = MockHttpClient();
  final request = MockHttpClientRequest();
  final response = MockHttpClientResponse();
  final headers = MockHttpHeaders();

  when(client.getUrl(any)).thenAnswer((_) => Future<HttpClientRequest>.value(request));
  when(request.headers).thenReturn(headers);
  when(request.close()).thenAnswer((_) => Future<HttpClientResponse>.value(response));
  when(response.contentLength).thenReturn(TransparantImageUtil.transparentImage.length);
  when(response.statusCode).thenReturn(HttpStatus.ok);
  // when(response.listen(any)).thenAnswer((invocation) {
  //   final void Function(List<int>) onData = invocation.positionalArguments[0];
  //   final void Function() onDone = invocation.namedArguments[#onDone];
  //   final void Function(Object, [StackTrace]) onError = invocation.namedArguments[#onError];
  //   final bool cancelOnError = invocation.namedArguments[#cancelOnError];
  //
  //   return Stream<List<int>>.fromIterable(<List<int>>[imageBytes]).listen(onData, onDone: onDone, onError: onError, cancelOnError: cancelOnError);
  // });

  return client;
}
