import 'package:ilovetv_flutter/src/model/tv.dart';
import 'package:ilovetv_flutter/src/model/user.dart';

class Friend {
  User? friend;
  List<Tv>? indications;

  Friend(
    this.friend,
    this.indications,
  );

  setFriend(User u) {
    this.friend = u;
  }

  addIndication(Tv tv) {
    if(indications == null)
      indications = <Tv>[];
    indications!.add(tv);
  }

  removeIndication(Tv tv) {
    if(indications != null)
      indications!.remove(tv);
  }

  Friend.fromJson(Map<String, dynamic> json)
  : friend = User.fromJson(json['friend']),
    indications = (json['indications'] as List).map((i) => new Tv.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        'friend': friend,
        'indications': indications,
      };
}