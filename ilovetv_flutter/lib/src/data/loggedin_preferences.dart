import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ilovetv_flutter/src/model/user.dart';

class LoggedInPreferences {
  static late final SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future delete() async {
      print('deletando LoggedInPreferences\n');
      await _preferences.clear();
  }

  static Future login(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString("loggedUser", json);
    await _preferences.setBool("isLoggedIn", true);
  }

  static Future logout() async {
    await _preferences.setString("loggedUser", "");
    await _preferences.setBool("isLoggedIn", false);
  }

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString("loggedUser", json);
  }

  static User getUser() {
    final json = _preferences.getString("loggedUser");

    return User.fromJson(jsonDecode(json!));
  }

  static bool isLoggedIn() {
    final bool? isLoggedIn = _preferences.getBool("isLoggedIn");
    if(isLoggedIn == null)
      return false;
    return isLoggedIn;
  }
}
