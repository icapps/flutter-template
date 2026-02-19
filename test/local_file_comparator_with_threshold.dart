import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

/// Works just like [LocalFileComparator] but includes a [threshold] that, when
/// exceeded, marks the test as a failure.
///
/// Performance: uses a fast path when the image bytes match the golden exactly,
/// avoiding the full pixel-diff computation. The expensive [compareLists] (and
/// thus [diffPercent]) is only run when the images differ.
class LocalFileComparatorWithThreshold extends LocalFileComparator {
  /// Threshold above which tests will be marked as failing.
  /// Ranges from 0 to 1, both inclusive.
  final double threshold;

  // ignore: use_super_parameters
  LocalFileComparatorWithThreshold(Uri testFile, this.threshold)
      : assert(threshold >= 0 && threshold <= 1),
        super(testFile);

  /// Copy of [LocalFileComparator]'s [compare] method, except for the fact that
  /// it checks if the [ComparisonResult.diffPercent] is not greater than
  /// [threshold] to decide whether this test is successful or a failure.
  ///
  /// Optimized: if the image bytes equal the golden bytes, returns [true]
  /// without calling [GoldenFileComparator.compareLists], so the expensive
  /// diff is only computed when the test would otherwise fail.
  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final goldenBytes = await getGoldenBytes(golden);

    // Fast path: exact match. Skip compareLists so we only run the expensive
    // pixel diff when there is an actual difference.
    if (imageBytes.length == goldenBytes.length &&
        listEquals(imageBytes, goldenBytes)) {
      return true;
    }

    final result = await GoldenFileComparator.compareLists(
      imageBytes,
      goldenBytes,
    );

    if (!result.passed && result.diffPercent <= threshold) {
      debugPrint(
        'A difference of ${result.diffPercent * 100}% was found, but it is '
        'acceptable since it is not greater than the threshold of '
        '${threshold * 100}%',
      );

      return true;
    }

    if (!result.passed) {
      final error = await generateFailureOutput(result, golden, basedir);
      throw FlutterError(error);
    }
    return result.passed;
  }
}