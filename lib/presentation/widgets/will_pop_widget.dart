import 'package:flutter/material.dart';

class WillPopWidget extends StatelessWidget {
  final Widget child;
  final String nextRoute;

  const WillPopWidget({super.key, required this.child, this.nextRoute = ''});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, d) async {
        if (didPop) return;

        if (nextRoute.isEmpty) {
        } else {}
      },
      child: child,
    );
  }
}
