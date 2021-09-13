import 'package:ilovetv_flutter/src/model/episode.dart';
import 'package:ilovetv_flutter/src/model/episode_response.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ilovetv_flutter/src/model/tv_response.dart';
import 'package:ilovetv_flutter/src/repository/repository.dart';

class NextEpisodesBloc {
  final TvRepository _repository = TvRepository();
  final BehaviorSubject<EpisodeResponse> _subject = BehaviorSubject<EpisodeResponse>();

  getList(List<int> ids_tv) async {
    EpisodeResponse response = await _repository.getNextEp(ids_tv);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<EpisodeResponse> get subject => _subject;
  
}

final nextEpBloc = NextEpisodesBloc();