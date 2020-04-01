class MockedAnswer<T> {
  final T Function(Invocation invocation, int amountOfTimesCalled) callback;

  var amountOfTimesCalled = 0;

  MockedAnswer(this.callback);

  T answer(Invocation invocation) {
    amountOfTimesCalled++;
    return callback(invocation, amountOfTimesCalled);
  }
}
