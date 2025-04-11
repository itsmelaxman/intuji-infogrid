import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:intuji_infogrid/src/src.dart';

void main() {
  testWidgets('Splash Screen navigates to login after delay', (
    WidgetTester tester,
  ) async {
    final mockNavigatorObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create:
                (_) => SplashProvider(
                  splashDelay: const Duration(
                    milliseconds: AppConstants.splashDelayMilliseconds,
                  ),
                ),
          ),
        ],
        child: MaterialApp(
          home: const SplashScreen(),
          navigatorObservers: [mockNavigatorObserver],
          routes: {
            AppRouter.login:
                (context) => const Scaffold(body: Text('Login Screen')),
          },
        ),
      ),
    );

    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.text('Powered By'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    expect(find.text('Login Screen'), findsOneWidget);
  });
}

class MockNavigatorObserver extends NavigatorObserver {}
