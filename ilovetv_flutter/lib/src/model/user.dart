import 'package:ilovetv_flutter/src/model/friend.dart';

class User {
  final String id;
  final String name;
  final String username;
  final String pass;
  final String profile;
  final List<int> ids_tv_added;
  final List<int> ids_tv_fav;
  final List<Friend> friends; //key: id user, val: ids series indicadas
  final String createdAt;

  const User({
    this.id = '',
    this.name = '',
    this.username = '',
    this.pass = '',
    this.profile = '',
    this.ids_tv_added = const [],
    this.ids_tv_fav = const [],
    this.friends = const [],
    this.createdAt = '',
  });

  User copy({
    String? id,
    String? name,
    String? username,
    String? pass,
    String? profile,
    List<int>? ids_tv_added,
    List<int>? ids_tv_fav,
    List<Friend>? friends,
    String? createdAt,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        pass: pass ?? this.pass,
        profile: profile ?? this.profile,
        ids_tv_added: ids_tv_added ?? this.ids_tv_added,
        ids_tv_fav: ids_tv_fav ?? this.ids_tv_fav,
        friends: friends ?? this.friends,
        createdAt: createdAt ?? this.createdAt,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        pass: json['pass'],
        profile: json['profile'],
        ids_tv_added: List<int>.from(json['ids_tv_added']),
        ids_tv_fav: List<int>.from(json['ids_tv_fav']),
        friends: (json['friends'] as List).map((i) => new Friend.fromJson(i)).toList(),
        createdAt: json['createdAt'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'pass': pass,
        'profile': profile,
        'ids_tv_added': ids_tv_added,
        'ids_tv_fav': ids_tv_fav,
        'friends': friends,
        'createdAt': createdAt,
      };

  @override
  String toString() => 'User{id: $id, name: $name, username: $username, date: $createdAt}';
}