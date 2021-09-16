import 'package:flutter/material.dart';

import 'package:ilovetv_flutter/src/data/loggedin_preferences.dart';
import 'package:ilovetv_flutter/src/model/user.dart';
import 'package:ilovetv_flutter/src/screen/added_tv.dart';
import 'package:ilovetv_flutter/src/screen/favs_tv.dart';
import 'package:ilovetv_flutter/src/shared/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late User loggedUser;

  @override
  void initState() {
    super.initState();
    loggedUser = LoggedInPreferences.getUser();
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: DEFAULT_PADDING,
                  right: DEFAULT_PADDING,
                ),
                height: size.height * 0.2,
                decoration: BoxDecoration(
                    color: COLOR_PRIMARY,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Row(
                  children: <Widget>[

                    //Adicionar streambuilder loggedBloc para atualizar qnd os dados atualizarem
                    CircleAvatar(
                      radius: size.height * 0.2 / 4,
                      backgroundColor: BLACK,
                      //child: const Text('EP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
                      backgroundImage: AssetImage(loggedUser.profile),
                    ),
                    VerticalDivider(),
                    Text(
                      loggedUser.name,
                      style: TextStyle(fontSize: 22, color: COLOR_TEXT_LIGTH),
                    ),
                  ],),
              ),
            ],
          ),
          AddedTV(),
          FavsTV(),

        ],
      );
  }
}