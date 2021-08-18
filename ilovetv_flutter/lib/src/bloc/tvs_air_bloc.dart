import 'package:rxdart/rxdart.dart';
import 'package:ilovetv_flutter/src/model/tv_response.dart';
import 'package:ilovetv_flutter/src/repository/repository.dart';

class AirListBloc {
  final TvRepository _repository = TvRepository();
  final BehaviorSubject<TvResponse> _subject = BehaviorSubject<TvResponse>();

  getOnAir() async {
    TvResponse response = await _repository.getOnAirTvs();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<TvResponse> get subject => _subject;
  
}

final onAirBloc = AirListBloc();