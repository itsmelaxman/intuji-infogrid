import 'package:flutter/material.dart';
import 'package:intuji_infogrid/environment.dart';
import 'package:intuji_infogrid/src/src.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  await AppInitializer().initializeApp();

  runApp(
    MultiProvider(
      providers: AppProvider.providers,
      child: MyApp(isLoggedIn: await AppInitializer.isLoggedIn()),
    ),
  );
}

class MyApp extends StatefulWidget {
  final bool isLoggedIn;
  const MyApp({super.key, this.isLoggedIn = false});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: Environment.appName,
      debugShowCheckedModeBanner: Environment.showDebugBanner,
      initialRoute: widget.isLoggedIn ? AppRouter.dashboard : AppRouter.splash,
      routes: AppRouter.routes,
    );
  }
}
