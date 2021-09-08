import 'package:flutter/material.dart';
import '../shared/constants.dart';
import '../shared/components.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    CircleAvatar(
                      radius: size.height * 0.2 / 4,
                      backgroundColor: Colors.pink,
                      child: const Text('EP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
                      //backgroundImage: NetworkImage(userAvatarUrl),
                    ),
                    VerticalDivider(),
                    Text(
                      'Edivânia Pontes',
                      style: TextStyle(fontSize: 22, color: COLOR_TEXT_LIGTH),
                    ),
                  ],),
              ),
            ],
          ),
          Topic('Séries favoritas'),
          Container(
            width: double.infinity,
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TVShowCard("Breaking Bad", "87%", "./assets/images/tv/bbad.jpg"),
                TVShowCard("Avatar: A Lenda de Aang", "86%", "./assets/images/tv/avatar.jpg"),
              ],
            ),
          ),
          Topic('Últimas assistidas'),
          Container(
            width: double.infinity,
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TVShowCard("Loki", "82%", "./assets/images/tv/loki.jpg"),
                TVShowCard("O Gambito da Rainha", "87%", "./assets/images/tv/gambito.jpg"),
                TVShowCard("Breaking Bad", "87%", "./assets/images/tv/bbad.jpg"),
                TVShowCard("Avatar: A Lenda de Aang", "86%", "./assets/images/tv/avatar.jpg"),
                TVShowCard("Legados", "86%", "./assets/images/tv/legacies.jpg"),
                TVShowCard("", "%", "./assets/images/tv/show.png")
              ],
            ),
          ),
          Topic('Listas personalizadas'),
          Container(
            width: double.infinity,
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TVShowCard("", "", "./assets/images/tv/new.png"),
              ],
            ),
          ),
        ],
      );
  }
}