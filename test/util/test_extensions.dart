import 'package:mockito/mockito.dart';

extension MockExtensions on VerificationResult {
  void calledOnce() => called(1);

  void calledTwice() => called(2);

  void called3Times() => called(3);

  void called4Times() => called(4);
}
