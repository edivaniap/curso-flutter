import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home.dart';



class ILoveTVApp extends StatefulWidget {
  const ILoveTVApp({ Key? key }) : super(key: key);

  @override
  _ILoveTVAppState createState() => _ILoveTVAppState();
}

class _ILoveTVAppState extends State<ILoveTVApp> {
   int _currentIndex = 2;
   final tabs = [
     //pages here
     Center(child: Text('Listas - Em construção...')),
     Center(child: Text('Explorar - Em construção...')),
     Home(),
     Center(child: Text('Próximos eps - Em construção...')),
     Center(child: Text('Amigos - Em construção...')),
   ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(color: COLOR_TEXT_LIGTH),
        ),
        toolbarHeight: 50.0,
        backgroundColor: COLOR_PRIMARY,
        centerTitle: true,
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