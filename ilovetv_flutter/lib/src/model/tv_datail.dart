import 'genre.dart';

class TvDetail {
  final int id;
  final int numberEp;
  final int numberSs;
  final int voteCount;

  final bool adult;
  final bool in_production;
  
  final String firstAirDate;
  final String lastAirDate;
  final String originalLanguage;

  final Espisode lastEpToAir;

  //created by
  final List<Genre> genres;
  final List<Company> companies;
  final List<Season> seasons;
  final List<String> languages;
  final List<String> originCountries;
  
  

  TvDetail(
    this.id,
    this.numberEp,
    this.numberSs,
    this.voteCount,
    this.adult,
    this.in_production,
    this.firstAirDate,
    this.lastAirDate,
    this.originalLanguage,
    this.lastEpToAir,
    this.genres,
    this.companies,  
    this.seasons,
    this.languages,
    this.originCountries
  );
}