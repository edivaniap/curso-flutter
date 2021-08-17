import 'package:dio/dio.dart';
import 'package:ilovetv_flutter/src/model/tv_response.dart';

class TvRepository {
  final Dio _dio = Dio();
  
  final String apiKey = "46dabd4954c59184c25e86d2ce6a3800";
  
  static String mainUrl = "https://api.themoviedb.org/3";
  static String language = "pt-BR";
  static int page = 1;

  var tvUrl = "$mainUrl/tv";
  var getTvsUrl = "$mainUrl/discover/tv";
  var getPopularUrl = "$mainUrl/tv/popular";
  var getTopRatedUrl = "$mainUrl/tv/top_rated";

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
}