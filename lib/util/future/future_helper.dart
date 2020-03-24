import 'dart:async';

import 'package:tuple/tuple.dart';

Future<Tuple2<A, B>> await2<A, B>(Future<A> a, Future<B> b) {
  return Future.wait([a, b]).then((values) {
    return Tuple2.fromList(values);
  });
}

extension EnsureTime<T> on Future<T> {
  Future<T> ensureDuration(Duration duration) {
    final start = DateTime.now();
    final otherFuture = Completer<T>();
    then((value) async {
      final difference = DateTime.now().difference(start);
      final timeToSleep = duration.inMicroseconds - difference.inMicroseconds;
      if (timeToSleep > 0) {
        await Future.delayed(Duration(microseconds: timeToSleep));
      }
      otherFuture.complete(value);
    }, onError: otherFuture.completeError);
    return otherFuture.future;
  }
}
