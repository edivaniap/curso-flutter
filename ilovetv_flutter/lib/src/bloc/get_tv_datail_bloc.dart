import 'package:ilovetv_flutter/src/repository/repository.dart';
import 'package:ilovetv_flutter/src/model/tv_datail_response.dart';
import 'package:rxdart/rxdart.dart';

class TvDetailBloc {
  final TvRepository _repository = TvRepository();
  final BehaviorSubject<TvDatailResponse> _subject = BehaviorSubject<TvDatailResponse>();

  getMovieDetail(int id) async {
    TvDatailResponse response = await _repository.getTvDetail(id);
    _subject.sink.add(response);
  }

  //void drainStream() {
  //  _subject.value = null;
  //}

  //@mustCallSuper
  void dispose() async{
    //await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<TvDatailResponse> get subject => _subject;
  
}
final tvDetailBloc = TvDetailBloc();