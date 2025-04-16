import 'package:flutter/material.dart';

import '../../presentation/screens/screen.dart';

class AppRouter {
  /// [Splash] screen route
  static const String splash = '/splash';

  /// [Login] screen route
  static const String login = '/login';

  /// [Home] & [Dashboard] screen route
  static const String home = '/';
  static const String dashboard = '/dashboard';

  /// [Product] detail screen route
  static const String product = '/product-detail';

  /// [Team] screen route
  static const String team = '/team';

  /// [More] screen route
  static const String more = '/more';

  // Map for routes
  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
    dashboard: (context) => const DashboardScreen(),
    product: (context) => const ProductDetailScreen(),
    team: (context) => const TeamScreen(),
    more: (context) => const MoreScreen(),
  };
}
