extension ListExtensions<T> on List<T> {
  void replaceAll(List<T> newData) {
    clear();
    addAll(newData);
  }

  void sortBy<R>(Comparable<R> by(T item)) {
    sort((a, b) {
      if (by(a) == null) return -1;
      if (by(b) == null) return 1;
      return _compareValues(by(a), by(b));
    });
  }

  void sortBy2Field<R>(Comparable<R> by(T item), Comparable<R> by2(T item)) {
    sort((a, b) {
      if (by(a) == null) return -1;
      if (by(b) == null) return 1;
      final result = _compareValues(by(a), by(b));
      if (result != 0) return result;
      if (by2(a) == null) return -1;
      if (by2(b) == null) return 1;
      return _compareValues(by2(a), by2(b));
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
