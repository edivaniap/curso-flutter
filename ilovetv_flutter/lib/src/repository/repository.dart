import 'package:dio/dio.dart';
import 'package:ilovetv_flutter/src/model/episode.dart';
import 'package:ilovetv_flutter/src/model/episode_response.dart';
import 'package:ilovetv_flutter/src/model/tv.dart';
import 'package:ilovetv_flutter/src/model/tv_datail_response.dart';
import 'package:ilovetv_flutter/src/model/tv_response.dart';

class TvRepository {
  final Dio _dio = Dio();
  
  final String apiKey = "46dabd4954c59184c25e86d2ce6a3800";
  
  static String mainUrl = "https://api.themoviedb.org/3";
  static String language = "pt-BR";
  //static String language = "en-US";
  static int page = 1;

  var tvUrl = "$mainUrl/tv";
  var getTvsUrl = "$mainUrl/discover/tv";
  var getPopularUrl = "$mainUrl/tv/popular";
  var getTopRatedUrl = "$mainUrl/tv/top_rated";
  var getOnAirUrl =  "$mainUrl/tv/on_the_air";

  Future<TvResponse> getPopularTvs() async {
    var params = {
      "api_key": apiKey,
      "language": language,
      "page": page
    };

    try {
      Response response = await _dio.get(getPopularUrl, queryParameters: params);
      return TvResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("An exception occured: $error \nstackTrace: $stacktrace");
      return TvResponse.withError("$error");
    }
  }

  Future<TvResponse> getTopRatedTvs() async {
    var params = {
      "api_key": apiKey,
      "language": language,
      "page": page
    };

    try {
      Response response = await _dio.get(getTopRatedUrl, queryParameters: params);
      return TvResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("An exception occured: $error \nstackTrace: $stacktrace");
      return TvResponse.withError("$error");
    }
  }

  Future<TvResponse> getOnAirTvs() async {
    var params = {
      "api_key": apiKey,
      "language": language,
      "page": page
    };

    try {
      Response response = await _dio.get(getOnAirUrl, queryParameters: params);
      return TvResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("An exception occured: $error \nstackTrace: $stacktrace");
      return TvResponse.withError("$error");
    }
  }

  Future<TvDatailResponse> getTvDetail(int id) async {
    var params = {
      "api_key": apiKey,
      "language": language
    };
    try {
      Response response = await _dio.get(tvUrl + "/$id", queryParameters: params);
      return TvDatailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("An exception occured: $error \nstackTrace: $stacktrace");
      return TvDatailResponse.withError("$error");
    }
  }

  Future<TvResponse> getListTvs(List<int> ids) async {
    var params = {
      "api_key": apiKey,
      "language": language
    };
    List<Tv> _tvs = [];
    try {
      Response response;
      for (var id in ids) {
        response = await _dio.get("$tvUrl/$id", queryParameters: params);
        _tvs.add(Tv.fromJson(response.data));
      }
    } catch (error, stacktrace) {
      print("An exception occured: $error \nstackTrace: $stacktrace");
      //return SingleTvResponse.withError("$error");
    }

    return TvResponse(_tvs, "");
  }

  /* @param ids: lista de ids de series */
  Future<EpisodeResponse> getNextEps(List<int> ids) async {
    var params = {
      "api_key": apiKey,
      "language": language
    };
    List<Episode> _eps = [];
    try {
      Response response;
      for (var id in ids) {
        response = await _dio.get("$tvUrl/$id/season/1/episode/1", queryParameters: params);
        _eps.add(Episode.fromJson(response.data));
      }
    } catch (error, stacktrace) {
      print("An exception occured: $error \nstackTrace: $stacktrace");
      //return SingleTvResponse.withError("$error");
    }

    return EpisodeResponse(_eps, "");
  }
}