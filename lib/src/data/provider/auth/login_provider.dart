import 'package:flutter/material.dart';
import 'package:intuji_infogrid/src/src.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepo _loginRepo = LoginRepo();
  final SharedPreferencesService _sharedPrefs = SharedPreferencesService();
  DataFetchStatus _status = DataFetchStatus.initial;
  LoginUserModel? _user;

  DataFetchStatus get status => _status;
  LoginUserModel? get user => _user;

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    _status = DataFetchStatus.loading;
    notifyListeners();

    final response = await _loginRepo.login(email, password);

    if (response.status) {
      _user = response.data as LoginUserModel;

      await _sharedPrefs.setStringPref(
        SharedPreferenceHelper.userInfoKey,
        loginUserModelToJson(_user!),
      );
      await _sharedPrefs.setBoolPref(
        SharedPreferenceHelper.isLoggedInKey,
        true,
      );

      _status = DataFetchStatus.success;
      notifyListeners();

      if (!context.mounted) return;
      Utility.navigate(context, AppRouter.dashboard);
    } else {
      _status = DataFetchStatus.error;
      notifyListeners();

      if (!context.mounted) return;
      showCustomToaster(response.message);
    }
  }

  Future<void> logout(BuildContext context) async {
    _status = DataFetchStatus.loading;
    notifyListeners();

    await _sharedPrefs.deleteSharedPref([
      SharedPreferenceHelper.userInfoKey,
      SharedPreferenceHelper.isLoggedInKey,
      SharedPreferenceHelper.userTokenKey,
      SharedPreferenceHelper.userEmailKey,
    ]);
    _user = null;
    _status = DataFetchStatus.initial;
    notifyListeners();
    showCustomToaster('Logout successful!', isError: false);
    if (!context.mounted) return;
    Utility.navigate(context, AppRouter.splash);
  }
}
