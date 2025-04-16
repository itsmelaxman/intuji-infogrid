import 'package:intuji_infogrid/src/src.dart';
import 'package:provider/provider.dart';

class AppProvider {
  /// [App] Provider Constructor
  AppProvider._();

  /// [Splash] Provider
  static final SplashProvider splashProvider = SplashProvider();

  /// [Login] Provider
  static final LoginProvider loginProvider = LoginProvider();

  /// [Home] Provider
  static final HomeProvider homeProvider = HomeProvider();

  /// [Product] Provider
  static final ProductProvider productProvider = ProductProvider();

  /// [Team] Provider
  static final TeamProvider teamProvider = TeamProvider();

  //* ------------------------------ End of Global Provider ------------------------------ *//

  /// [Global] Providers List
  static final List<ChangeNotifierProvider> providers = [
    /// [Splash] Provider
    ChangeNotifierProvider<SplashProvider>.value(value: splashProvider),

    /// [Login] Provider
    ChangeNotifierProvider<LoginProvider>.value(value: loginProvider),

    /// [Home] Provider
    ChangeNotifierProvider<HomeProvider>.value(value: homeProvider),

    /// [Product] Provider
    ChangeNotifierProvider<ProductProvider>.value(value: productProvider),

    /// [Team] Provider
    ChangeNotifierProvider<TeamProvider>.value(value: teamProvider),
  ];

  /// [Dispose] all providers
  static void dispose() {
    splashProvider.dispose();
    loginProvider.dispose();
    homeProvider.dispose();
    productProvider.dispose();
    teamProvider.dispose();
  }
}
