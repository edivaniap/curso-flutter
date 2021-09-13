class Episode {
  final int id;
  final int s_number;
  final int ep_number;
  final String name;

  Episode(
    this.id,
    this.s_number,
    this.ep_number,
    this.name
  );

  Episode.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      s_number = json['season_number'],
      ep_number = json['episode_number'],
      name = json['name'];
}