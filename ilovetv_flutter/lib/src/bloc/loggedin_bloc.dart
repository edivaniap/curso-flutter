import 'package:ilovetv_flutter/src/model/friend.dart';
import 'package:rxdart/rxdart.dart';

import 'package:ilovetv_flutter/src/data/loggedin_preferences.dart';
import 'package:ilovetv_flutter/src/model/user.dart';

class LoggedInBloc {
  final BehaviorSubject<User> _subject = BehaviorSubject<User>();
  final BehaviorSubject<List<Friend>> _subjectFriends = BehaviorSubject<List<Friend>>();

  getUser() async {
    User user = LoggedInPreferences.getUser();
    _subject.sink.add(user);
  }

  getFriends() async {
    List<Friend> friends = LoggedInPreferences.getUser().friends;
    _subjectFriends.sink.add(friends);
  }

  dispose() {
    _subject.close();
    _subjectFriends.close();
  }

  BehaviorSubject<User> get user => _subject;
  BehaviorSubject<List<Friend> > get friends => _subjectFriends;
}

final loggedBloc = LoggedInBloc();