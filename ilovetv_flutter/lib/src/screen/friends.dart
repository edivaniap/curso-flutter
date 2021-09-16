import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/bloc/loggedin_bloc.dart';
import 'package:ilovetv_flutter/src/screen/profile_friend.dart';
import 'package:ilovetv_flutter/src/screen/users.dart';
import '../shared/constants.dart';
import '../shared/components.dart';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loggedBloc..getUser();
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
                  SizedBox(width: 10.0,),
                  CircleAvatar(
                    radius: size.height * 0.1 / 4,
                    backgroundColor: Colors.pink,
                    child: const Text('RF',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0)),
                    //backgroundImage: NetworkImage(userAvatarUrl),
                  ),
                  SizedBox(width: 10.0,),
                  CircleAvatar(
                    radius: size.height * 0.1 / 4,
                    backgroundColor: Colors.pink,
                    child: const Text('AL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0)),
                    //backgroundImage: NetworkImage(userAvatarUrl),
                  ),
                  SizedBox(width: 10.0,),
                  CircleAvatar(
                    radius: size.height * 0.1 / 4,
                    backgroundColor: Colors.pink,
                    child: const Text('AL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0)),
                    //backgroundImage: NetworkImage(userAvatarUrl),
                  ),
                  SizedBox(width: 20.0,),
                  IconButton(
                    onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UsersPage(),
                      ),
                      );
                    },
                    icon: Icon(Icons.person_search_rounded, color: Colors.white, size: 40,),
                    tooltip: 'Ver usuários',
                  )
                ],
              ),
            ),
          ],
        ),
        Topic('Recomendações'),
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
