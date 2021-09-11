import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ilovetv_flutter/src/shared/constants.dart';
import 'package:ilovetv_flutter/src/data/user.dart';
import 'package:ilovetv_flutter/src/data/user_preferences.dart';
import 'package:ilovetv_flutter/src/bloc/user_logged_bloc.dart';


class UsersPage extends StatefulWidget {
  const UsersPage({ Key? key }) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    users = UserPreferences.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Lista de Usuários'),
          backgroundColor: BLACK,
          centerTitle: true,
        ),
        body: Column(
            children: <Widget>[
              Expanded(child: buildUsers())
          ])       
        );

  }

  Widget buildUsers() {
    if (users.isEmpty) {
      return Center(
        child: Text(
          'Sem usuários!',
          style: TextStyle(fontSize: 20),
        ),
      );
    } else {
      return ListView.separated(
        padding: EdgeInsets.all(20.0),
        itemCount: users.length,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          final user = users[index];

          return ListTile(
            //tileColor: ,
            //onTap: (){},
            leading: user.profile == ''
                ? null
                : CircleAvatar(backgroundImage: AssetImage(user.profile), backgroundColor: BLACK, radius: 30.0,),
            title: Text(user.name, style: TextStyle(fontSize: 20)),
            subtitle: Text(user.username, style: TextStyle(fontSize: 16)),
          );

        },
      );
    }
  }

}

