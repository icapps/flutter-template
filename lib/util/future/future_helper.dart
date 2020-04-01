import 'dart:async';

import 'package:tuple/tuple.dart';

Future<Tuple2<A, B>> await2<A, B>(Future<A> a, Future<B> b) {
  return Future.wait([a, b]).then((values) {
    return Tuple2.fromList(values);
  });
}

Future<Tuple3<A, B, C>> await3<A, B, C>(Future<A> a, Future<B> b, Future<C> c) {
  return Future.wait([a, b, c]).then((values) {
    return Tuple3.fromList(values);
  });
}

Future<Tuple4<A, B, C, D>> await4<A, B, C, D>(Future<A> a, Future<B> b, Future<C> c, Future<D> d) {
  return Future.wait([a, b, c, d]).then((values) {
    return Tuple4.fromList(values);
  });
}
