class Tv {
    //talvez dividir esta classe em TV e TVDatails
    final int id;
    final double voteAverage;
    final double popularity;
    final String name;
    final String originalName;
    final String poster;
    final String backdrop;
    final String overview;
    

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
      name = json["name"];

}