
class Tv {
    final int id;
    final double voteAverage;
    final double popularity;
    final String name;
    final String originalName;
    final String? poster;
    final String? backdrop; //imagens de fundo
    final String overview; //sinopse - resumo
    

    Tv(
      this.id,
      this.voteAverage,
      this.popularity,
      this.name,
      this.originalName,
      this.poster,
      this.backdrop,
      this.overview,
    );

    Tv.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      voteAverage = json["vote_average"].toDouble(),
      popularity = json["popularity"],
      name = json["name"],
      originalName = json["original_name"],
      poster = json["poster_path"],
      backdrop = json["backdrop_path"],
      overview = json["overview"];
}