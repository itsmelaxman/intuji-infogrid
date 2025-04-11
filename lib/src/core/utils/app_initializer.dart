import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../src.dart';

class AppInitializer {
  static final SharedPreferencesService _sharedPrefs =
      SharedPreferencesService();
  Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();
  }

  static Future<bool> isLoggedIn() async {
    final isLoggedIn = await _sharedPrefs.getBoolPref(
      SharedPreferenceHelper.isLoggedInKey,
    );
    final userInfo = await _sharedPrefs.getStringPref(
      SharedPreferenceHelper.userInfoKey,
    );

    return isLoggedIn == true && userInfo != null && userInfo.isNotEmpty;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        return kDebugMode ? true : false;
      };
  }
}
