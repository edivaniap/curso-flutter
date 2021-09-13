class Season {
  final int id;
  final int number;
  final int ep_count;
  final String name;

  Season(
    this.id,
    this.number,
    this.ep_count,
    this.name,
  );

  Season.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      number = json["number"],
      ep_count = json["episode_count"],
      name = json["name"];
}