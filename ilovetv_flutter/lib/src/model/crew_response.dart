import 'crew.dart';

class CrewResponse {
  final List<Crew> crews;
  final String error;

  CrewResponse(this.crews, this.error);

  CrewResponse.fromJson(Map<String, dynamic> json)
    : crews = (json["crew"] as List).map((i) => new Crew.fromJson(i)).toList(),
      error = "";

  CrewResponse.withError(String e)
    : crews = [],
      error = e;
}