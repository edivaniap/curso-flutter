class Cast {
  final int id;
  final int order;
  final double popularity;
  final String character;
  final String name;
  final String profileImg;
  final String knownForDepartment;

  Cast(
    this.id,
    this.order,
    this.popularity,
    this.character,
    this.name,
    this.profileImg,
    this.knownForDepartment
  );

  Cast.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      order = json["order"],
      popularity = json["popularity"],
      character = json["character"],
      name = json["name"],
      profileImg = json["profile_path"],
      knownForDepartment = json["known_for_department"];
}