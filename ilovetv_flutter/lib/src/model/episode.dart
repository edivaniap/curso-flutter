class Episode {
  final int id;
  final int s_number;
  final int ep_number;
  final String name;

  Episode({
    this.id = 0,
    this.s_number = 0,
    this.ep_number = 0,
    this.name = ''
  });

  Episode.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      s_number = json['season_number'],
      ep_number = json['episode_number'],
      name = json['name'];
}