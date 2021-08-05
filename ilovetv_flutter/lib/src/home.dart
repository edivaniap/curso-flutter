import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
                      style: TextStyle(fontSize: 20, color: COLOR_TEXT_LIGTH),
                    ),
                  ],),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:12.0, top: 12.0),
            child: Text(
              'Séries favoritas',
              style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),),
            ),
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
          Padding(
            padding: EdgeInsets.only(left:12.0, top: 12.0),
            child: Text(
              'Últimas assistidas',
              style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),),
            ),
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
                TVShowCard("Legados", "86%", "./assets/images/tv/legacies.jpg")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:12.0, top: 12.0),
            child: Text(
              'Listas personalizadas',
              style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),),
            ),
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

//modularizar isto
Widget TVShowBlock(String title) {
  return Container();
}

Widget TVShowCard(String title, String rate, String image) {
  return Padding(
    padding: EdgeInsets.only(left: 5.0, top: 12.0),
    child: InkWell(
    // When the user taps the button, show a snackbar.
      onTap: () {
        //do something
      },
      child: Column(children: <Widget>[
        Card(
          elevation: 0.0,
          child: ClipRRect(
              borderRadius: new BorderRadius.circular(10.0),
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(image),
                width: 110.0,
                height: 165.0,
              ),
            ),
        ),
        /* SizedBox(height: 5.0),
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Text(
          rate,
          style: TextStyle(color: Colors.black, fontSize: 15.0,),
        ) */
      ],)
  ));
}
