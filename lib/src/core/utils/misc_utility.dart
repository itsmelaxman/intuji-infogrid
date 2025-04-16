import 'dart:async';

import 'package:flutter/material.dart';

abstract class Misc {
  static void onLayoutRendered(void Function() callback) {
    WidgetsBinding.instance.addPostFrameCallback((d) => callback());
  }

  static Future<void> delayed(
    int milliseconds,
    void Function() callback,
  ) async {
    await Future.delayed(
      Duration(milliseconds: milliseconds),
      () => callback(),
    );
  }
}
