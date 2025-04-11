import 'package:flutter/material.dart';

class Utility {
  static Future navigate(
    BuildContext context,
    String route, {
    dynamic arguments,
  }) {
    return Navigator.of(context).pushNamed(route, arguments: arguments);
  }

  static navigateMaterialRoute(BuildContext context, screen) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
