class Crew {
  final int id;
  final double popularity;
  final String name;
  final String profileImg;
  final String department;
  final String job;
  final String knownForDepartment;


  Crew(
    this.id,
    this.popularity,
    this.name,
    this.profileImg,
    this.department,
    this.job,
    this.knownForDepartment
  );

  Crew.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      popularity = json["popularity"],
      name = json["name"],
      profileImg = json["profile_path"],
      department = json["department"],
      job = json["job"],
      knownForDepartment = json["known_for_department"];
}