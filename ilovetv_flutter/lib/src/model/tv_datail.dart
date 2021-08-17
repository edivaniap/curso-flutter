import 'genre.dart';
import 'episode.dart';
import 'season.dart';
import 'company.dart';

class TvDetail {
  final int id;
  final int numberEp;
  final int numberSs;
  final int voteCount;

  final bool adult;
  final bool inProduction;
  
  final String firstAirDate;
  final String lastAirDate;
  final String originalLanguage;

  final Episode lastEpToAir;

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
    this.inProduction,
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

  TvDetail.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      numberEp = json["number_of_episodes"],
      numberSs = json["number_of_seasons"],
      voteCount = json["vote_count"],
      adult = json["adult"],
      inProduction = json["in_production"],
      firstAirDate = json["first_air_date"],
      lastAirDate = json["last_air_date"],
      originalLanguage = json["original_language"],
      lastEpToAir = json["last_episode_to_air"], //descobrir como pegar 'as Episode'
      genres = (json["genres"] as List).map((i) => new Genre.fromJson(i)).toList(),
      companies = json[""],  
      seasons = json[""],
      languages = json[""],
      originCountries = json[""];
}