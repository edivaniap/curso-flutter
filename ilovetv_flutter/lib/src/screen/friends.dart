import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/bloc/loggedin_bloc.dart';
import 'package:ilovetv_flutter/src/model/friend.dart';
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
    loggedBloc..getFriends();
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
                top: 10
              ),
              height: size.height * 0.2,
              decoration: BoxDecoration(
                  color: COLOR_PRIMARY,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),

              child: StreamBuilder<List<Friend>>(
                stream: loggedBloc.friends.stream,
                builder: (context, AsyncSnapshot<List<Friend>> snapshot) {
                  if (snapshot.hasData) {
                    return _buildFriendWidget(snapshot.data!);
                  } else if (snapshot.hasError) {
                    return _buildErrorWidget(snapshot.error.toString());
                  } else {
                    return _buildLoadingWidget();
                  }
                },
              ),
            ),

            Positioned(
              bottom: 20,
              right: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UsersPage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.person_search_rounded,
                  color: Colors.greenAccent,
                  size: 40,
                ),
                tooltip: 'Ver usuários',
              ),
            )

          ],
          clipBehavior: Clip.antiAlias,
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

  Widget _buildFriendWidget(List<Friend> fs) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: fs.length,
        itemBuilder: (context, index) {

          return Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundColor: BLACK,
                    backgroundImage: AssetImage(fs[index].friend!.profile),
                  ),

                  Text(fs[index].friend!.username)
              ]),
          );

        });
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.0,
          width: 20.0,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.purple.shade400),
            strokeWidth: 4.0,
          ),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Text("An error has occured: $error"),
    );
  }
}
