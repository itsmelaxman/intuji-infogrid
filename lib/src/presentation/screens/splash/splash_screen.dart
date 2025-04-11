import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intuji_infogrid/src/src.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  void _navigateAfterDelay() async {
    await Provider.of<SplashProvider>(
      context,
      listen: false,
    ).waitForSplashDelay();
    if (!mounted) return;
    Utility.navigate(context, AppRouter.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Center(child: Image.asset(Assets.logo))),
          Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.screenPaddingH),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Powered By', style: AppStyles.text10PxRegular),
                const SizedBox(width: 4),
                Image.asset(Assets.poweredByLogo, height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
