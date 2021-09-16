import 'package:rxdart/rxdart.dart';

import 'package:ilovetv_flutter/src/data/loggedin_preferences.dart';
import 'package:ilovetv_flutter/src/model/user.dart';

class LoggedInBloc {
  final BehaviorSubject<User> _subject = BehaviorSubject<User>();

  getUser() async {
    User user = LoggedInPreferences.getUser();
    _subject.sink.add(user);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<User> get user => _subject;
}

final loggedBloc = LoggedInBloc();