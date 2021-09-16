import 'package:ilovetv_flutter/src/data/user_preferences.dart';
import 'package:rxdart/rxdart.dart';

import 'package:ilovetv_flutter/src/model/tv_response.dart';
import 'package:ilovetv_flutter/src/model/user.dart';
import 'package:ilovetv_flutter/src/repository/repository.dart';

class ProfileBloc {
  final TvRepository _repository = TvRepository();
  final BehaviorSubject<TvResponse> _subjectAdded = BehaviorSubject<TvResponse>();
  final BehaviorSubject<TvResponse> _subjectFav = BehaviorSubject<TvResponse>();
  final BehaviorSubject<User> _subjectUser = BehaviorSubject<User>();

  getListAddeds(List<int> ids) async {
    TvResponse response = await _repository.getListTvs(ids);
    _subjectAdded.sink.add(response);
  }

  getListFavs(List<int> ids) async {
    TvResponse response = await _repository.getListTvs(ids);
    _subjectFav.sink.add(response);
  }

  getUser(String id) async {
    User u = UserPreferences.getUser(id);
    _subjectUser.sink.add(u);
  }

  dispose() {
    _subjectAdded.close();
    _subjectFav.close();
    _subjectUser.close();
  }

  BehaviorSubject<TvResponse> get tvsAdded => _subjectAdded;
  BehaviorSubject<TvResponse> get tvsFav => _subjectFav;
  BehaviorSubject<User> get user => _subjectUser;
  
}

final profileBloc = ProfileBloc();