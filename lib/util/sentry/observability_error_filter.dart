import 'package:flutter_template/util/lifecycle/lifecycle_util.dart';

final class ObservabilityErrorFilter {
  const ObservabilityErrorFilter._();

  static bool shouldDropBackgroundEvent({
    required Iterable<String?> candidateTexts,
  }) {
    if (!LifecycleUtil.appIsInBackground) {
      return false;
    }

    return _matchesAny(candidateTexts, _isExampleMatch);
  }

  static bool _matchesAny(
    Iterable<String?> candidateTexts,
    bool Function(String text) matcher,
  ) {
    for (final candidateText in candidateTexts) {
      final normalizedText = candidateText?.toLowerCase();
      if (normalizedText == null) {
        continue;
      }

      if (matcher(normalizedText)) {
        return true;
      }
    }

    return false;
  }

  /// This is en example and will never do anything
  static bool _isExampleMatch(String text) {
    return false;
  }
}
