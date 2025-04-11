import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences _prefs;

  static Future<SharedPreferencesService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return SharedPreferencesService();
  }

  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
    await _prefs.reload();
  }

  String? getStringsPref(String key) {
    return _prefs.getString(key);
  }

  Future<void> setStringPref(String key, dynamic value) async {
    String stringValue = value is String ? value : json.encode(value);
    await _prefs.setString(key, stringValue);
  }

  Future<String?> getStringPref(String key) async {
    if (_prefs.containsKey(key)) {
      return _prefs.getString(key);
    }
    return null;
  }

  Future<void> setBoolPref(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  Future<bool> getBoolPref(String key) async {
    return _prefs.getBool(key) ?? false;
  }

  Future<void> deleteSharedPref(dynamic key) async {
    if (key is String) {
      if (_prefs.containsKey(key)) {
        await _prefs.remove(key);
      }
    } else if (key is List<String>) {
      for (var element in key) {
        if (_prefs.containsKey(element)) {
          await _prefs.remove(element);
        }
      }
    }
  }
}
