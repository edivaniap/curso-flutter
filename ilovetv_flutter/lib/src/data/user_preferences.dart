import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'user.dart';

class UserPreferences {
  static late final SharedPreferences _preferences;

  static const _keyUsers = 'users';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future delete() async {
      print('deletando \n');
      await _preferences.clear();
  }

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());
    final idUser = user.id;

    await _preferences.setString(idUser, json);
  }

  static User getUser(String idUser) {
    final json = _preferences.getString(idUser);

    return User.fromJson(jsonDecode(json!));
  }

  static Future addUsers(User user) async {
    final idUsers = _preferences.getStringList(_keyUsers) ?? <String>[];
    final newIdUsers = List.of(idUsers)..add(user.id);

    await _preferences.setStringList(_keyUsers, newIdUsers);
  }

  static List<User> getUsers() {
    final idUsers = _preferences.getStringList(_keyUsers);

    if (idUsers == null) {
      print('Listas de usuarios nula\n');
      return <User>[];
    } else {
      print('Pegando usuários\n');
      for(String id in idUsers)
        print(id + '\n');
      return idUsers.map<User>(getUser).toList();
    }
  }

  static User authenticateUser(String _u, String _p) {
    final idUsers = _preferences.getStringList(_keyUsers);
    List<User> users = <User>[];
    
    if(idUsers != null)
      users = idUsers.map<User>(getUser).toList();
    
    for (var u in users)
      if(u.username == _u && u.pass == _p)
        return u;
    
    return User();
  }

}
