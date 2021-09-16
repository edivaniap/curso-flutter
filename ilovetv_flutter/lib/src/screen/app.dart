import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:ilovetv_flutter/src/data/loggedin_preferences.dart';
import 'package:ilovetv_flutter/src/screen/friends.dart';
import 'package:ilovetv_flutter/src/screen/welcome.dart';
import 'package:ilovetv_flutter/src/shared/constants.dart';
import 'package:ilovetv_flutter/src/screen/home.dart';
import 'package:ilovetv_flutter/src/screen/explore.dart';
import 'package:ilovetv_flutter/src/screen/next_episodes.dart';



class ILoveTVApp extends StatefulWidget {
  const ILoveTVApp({ Key? key }) : super(key: key);

  @override
  _ILoveTVAppState createState() => _ILoveTVAppState();
}

class _ILoveTVAppState extends State<ILoveTVApp> {
   int _currentIndex = 2;

   final tabs_names = [
     //pages here
     'Listas',
     'Explorar',
     'Perfil',
     'Próximos Episódios',
     'Amigos',
   ];

   final tabs = [
     //pages here
     Center(child: Text('Listas - Em construção...')),
     Explore(),
     Home(),
     NextEpisodes(),
     Friends(),
   ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _logout() {
     LoggedInPreferences.logout();

     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
       builder: (context) => Welcome(),
      ), (route) => false);
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text(
          tabs_names[_currentIndex],
          style: TextStyle(color: COLOR_TEXT_LIGTH),
        ),
        toolbarHeight: 50.0,
        backgroundColor: COLOR_PRIMARY,
        centerTitle: true,
        actions: <Widget>[
            IconButton(
              onPressed: _logout,
              icon: Icon(Icons.logout_rounded),
              tooltip: 'Sair',
            )
          ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: COLOR_BG_LIGTH,
        buttonBackgroundColor: COLOR_PRIMARY,
        color: COLOR_PRIMARY,
        height: 50,
        index: _currentIndex,
        animationDuration: Duration(milliseconds: 500),
        items: <Widget>[
          Icon(Icons.list_rounded, size: 25, color: COLOR_ICONS_LIGTH),
          Icon(Icons.search_rounded, size: 25, color: COLOR_ICONS_LIGTH),
          //Icon(Icons.manage_search_rounded, size: 25, color: COLOR_ICONS_LIGTH),
          Icon(Icons.home_rounded, size: 25, color: COLOR_ICONS_LIGTH),
          Icon(Icons.live_tv_rounded, size: 25, color: COLOR_ICONS_LIGTH),
          Icon(Icons.people_rounded, size: 25, color: COLOR_ICONS_LIGTH)
        ],
        onTap: (index) {
          debugPrint(">> ---------------------------------------------");
          debugPrint(">> Index do curved_navigation_bar: $index");
          debugPrint(">> _currentIndex before: $_currentIndex");
          setState(() {
            _currentIndex = index;
          });
          debugPrint(">> _currentIndex after: $_currentIndex");
        },
      ),
    );
  }
}