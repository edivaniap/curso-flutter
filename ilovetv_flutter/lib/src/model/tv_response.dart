import 'tv.dart';

class TvResponse {
    final List<Tv> tvs;
    final String error;

    TvResponse(
      this.tvs,
      this.error
    );

    List<Tv> getTvs() {
      return this.tvs;
    }

    void add(Tv tv) {
      tvs.add(tv);
    }

    TvResponse.fromJson(Map<String, dynamic> json)
      : tvs = (json["results"] as List).map((i) => new Tv.fromJson(i)).toList(),
        error = "";
    
    TvResponse.withError(String e)
      : tvs = [],
        error = e;

}