import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intuji_infogrid/environment.dart';
import 'package:intuji_infogrid/src/src.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiProvider(providers: AppProvider.providers, child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Environment.appName,
      debugShowCheckedModeBanner: Environment.showDebugBanner,
      initialRoute: AppRouter.splash,
      routes: AppRouter.routes,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
