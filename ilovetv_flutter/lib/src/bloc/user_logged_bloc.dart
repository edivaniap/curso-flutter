
import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/data/user.dart';

/* ChangeNotifier is part of the Flutter foundation library,
 * so we won’t have to depend on third-party libraries like rxdart */

class UserLoggedBloc with ChangeNotifier {
  User _user = new User();

  User get user => _user;

  void setLogged(User user) {
    _user = user;
    notifyListeners();
  }

  void eraseLogged() {
    _user = new User();
    notifyListeners();
  }
}