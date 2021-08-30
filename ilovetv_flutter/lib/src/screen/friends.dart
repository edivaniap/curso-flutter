import 'package:flutter/material.dart';
import '../shared/constants.dart';
import 'shared.dart';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: DEFAULT_PADDING + 10,
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
                    radius: size.height * 0.1 / 4,
                    backgroundColor: Colors.pink,
                    child: const Text('EP',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0)),
                    //backgroundImage: NetworkImage(userAvatarUrl),
                  ),
                  VerticalDivider(),
                  CircleAvatar(
                    radius: size.height * 0.1 / 4,
                    backgroundColor: Colors.pink,
                    child: const Text('RF',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0)),
                    //backgroundImage: NetworkImage(userAvatarUrl),
                  ),
                  VerticalDivider(),
                  CircleAvatar(
                    radius: size.height * 0.1 / 4,
                    backgroundColor: Colors.pink,
                    child: const Text('AL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0)),
                    //backgroundImage: NetworkImage(userAvatarUrl),
                  ),
                ],
              ),
            ),
          ],
        ),
        Topic('Recomendado por amigos'),
        Container(
          width: double.infinity,
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              TVShowCard("Avatar: A Lenda de Aang", "86%",
                  "./assets/images/tv/avatar.jpg"),
            ],
          ),
        ),
      ],
    );
  }
}
