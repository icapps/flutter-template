extension ListExtensions<T> on List<T> {
  void replaceAll(List<T> newData) {
    clear();
    addAll(newData);
  }

  void sortBy<R>(Comparable<R>? by(T item)) {
    sort((a, b) {
      final byA = by(a);
      final byB = by(b);
      if (byA == null) return -1;
      if (byB == null) return 1;
      return _compareValues(byA, byB);
    });
  }

  void sortBy2Field<R>(Comparable<R>? by(T item), Comparable<R>? by2(T item)) {
    sort((a, b) {
      final byA = by(a);
      final byB = by(b);
      if (byA == null) return -1;
      if (byB == null) return 1;
      final result = _compareValues(byA, byB);
      if (result != 0) return result;
      final by2A = by2(a);
      final by2B = by2(b);
      if (by2A == null) return -1;
      if (by2B == null) return 1;
      return _compareValues(by2A, by2B);
    });
  }

  List<T> sortedBy<R>(Comparable<R> by(T item)) {
    sort((a, b) => _compareValues(by(a), by(b)));
    return this;
  }
}

int _compareValues<T extends Comparable<dynamic>>(T a, T b) {
  if (identical(a, b)) return 0;
  return a.compareTo(b);
}
