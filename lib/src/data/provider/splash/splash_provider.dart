import 'dart:async';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  final Duration splashDelay;

  SplashProvider({this.splashDelay = const Duration(milliseconds: 1500)});

  Future<void> waitForSplashDelay() async {
    await Future.delayed(splashDelay);
  }
}
