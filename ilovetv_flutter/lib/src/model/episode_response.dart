import 'episode.dart';

class EpisodeResponse {
  final List<Episode> episodes;
  final String error;

  EpisodeResponse(
    this.episodes,
    this.error
  );

  EpisodeResponse.fromJson(Map<String, dynamic> json)
    : episodes = (json as List).map((i) => new Episode.fromJson(i)).toList(),
      error = "";

  EpisodeResponse.withError(String e)
    : episodes = [],
      error = e;
}