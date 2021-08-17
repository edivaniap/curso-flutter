import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/bloc/get_tvs_bloc.dart';
import 'constants.dart';
import 'shared.dart';

class Explore extends StatefulWidget {
  const Explore({ Key? key }) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  final searchController = TextEditingController();

  late String searchWords;

  void _searchChanged(String text) {
    //do something
    debugPrint(">> ---------------------------");
    debugPrint(">> Campo de busca foi alterado: $text"); 
  }

  @override
  void initState() {
    super.initState();
    tvsBloc..getTopRated();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: <Widget>[
          Container(
                padding: EdgeInsets.only(
                  left: DEFAULT_PADDING,
                  right: DEFAULT_PADDING,
                  top: 12.0
                ),
                height: 100.0,
                decoration: BoxDecoration(
                    color: COLOR_PRIMARY,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    //labelText: 'Buscar',
                    //labelStyle: TextStyle(color: Colors.greenAccent.shade400),
                    hintText: 'Buscar',
                    hintStyle: TextStyle(fontSize: 16.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    fillColor: COLOR_BG_LIGTH,
                    filled: true,
                    suffixIcon: Icon(Icons.search_rounded, size: 25, color: COLOR_PRIMARY),
                    ),
                    style: TextStyle (color: Colors.black, fontSize: 16.0),
                    cursorColor: COLOR_PRIMARY,
                    onChanged: _searchChanged
                  )
          ),
          Topic('Trends'),
          Container(
            width: double.infinity,
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TVShowCard("Legados", "86%", "./assets/images/tv/legacies.jpg"),
                TVShowCard("Breaking Bad", "87%", "./assets/images/tv/bbad.jpg"),
                TVShowCard("O Gambito da Rainha", "87%", "./assets/images/tv/gambito.jpg"),
                TVShowCard("Loki", "82%", "./assets/images/tv/loki.jpg"),
              ],
            ),
          ),
          Topic('Recomendado pelo app'),
          Container(
            width: double.infinity,
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TVShowCard("Loki", "82%", "./assets/images/tv/loki.jpg"),
                TVShowCard("O Gambito da Rainha", "87%", "./assets/images/tv/gambito.jpg"),
                TVShowCard("Breaking Bad", "87%", "./assets/images/tv/bbad.jpg"),
                TVShowCard("Legados", "86%", "./assets/images/tv/legacies.jpg")
              ],
            ),
          ),
          Topic('Recomendado por amigos'),
          Container(
            width: double.infinity,
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TVShowCard("Avatar: A Lenda de Aang", "86%", "./assets/images/tv/avatar.jpg"),
              ],
            ),
          ),
        ],
      );
  }
}