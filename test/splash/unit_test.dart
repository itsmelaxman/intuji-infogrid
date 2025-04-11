import 'package:flutter_test/flutter_test.dart';
import 'package:intuji_infogrid/src/src.dart';

void main() {
  group('SplashProvider', () {
    test('waitForSplashDelay completes after the specified delay', () async {
      final splashProvider = SplashProvider(
        splashDelay: const Duration(
          milliseconds: AppConstants.splashDelayMilliseconds,
        ),
      );
      final stopwatch = Stopwatch()..start();

      await splashProvider.waitForSplashDelay();
      stopwatch.stop();

      expect(stopwatch.elapsedMilliseconds, greaterThanOrEqualTo(500));
    });
  });
}
