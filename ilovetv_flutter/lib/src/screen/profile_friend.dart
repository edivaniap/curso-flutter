import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/bloc/loggedin_bloc.dart';

import 'package:ilovetv_flutter/src/bloc/profile_bloc.dart';
import 'package:ilovetv_flutter/src/model/tv_response.dart';
import 'package:ilovetv_flutter/src/model/user.dart';
import 'package:ilovetv_flutter/src/shared/components.dart';
import 'package:ilovetv_flutter/src/shared/constants.dart';

class Profile extends StatefulWidget {
  final User user;
  Profile({required this.user});

  @override
  _ProfileState createState() => _ProfileState(user);
}

class _ProfileState extends State<Profile> {
  final User user;
  _ProfileState(this.user);

  @override
  initState() {
    super.initState();
    profileBloc..getUser(user.id);
    profileBloc..getListAddeds(user.ids_tv_added);
    profileBloc..getListFavs(user.ids_tv_fav);
    loggedBloc..getUser();
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  new Scaffold(
      appBar: AppBar(
        title: Text(
          user.username,
          style: TextStyle(color: COLOR_TEXT_LIGTH),
        ),
        toolbarHeight: 50.0,
        backgroundColor: COLOR_PRIMARY,
        centerTitle: true,
        actions: <Widget>[
            loggedBloc.user.value.id != user.id ? IconButton(
              onPressed: (){},
              icon: Icon(Icons.person_add_alt_rounded),
              tooltip: 'Conectar',
            ) : Text('Você'),
          ],
      ),
      body: ListView(
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
                      backgroundImage: AssetImage(user.profile),
                    ),
                    VerticalDivider(),
                    Text(
                      user.name,
                      style: TextStyle(fontSize: 22, color: COLOR_TEXT_LIGTH),
                    ),
                  ],),
              ),
            ],
          ),
          Topic("Adicionadas"),
          SizedBox(
            height: 5.0,
          ),
          

          StreamBuilder<TvResponse>(
            stream: profileBloc.tvsAdded.stream,
            builder: (context, AsyncSnapshot<TvResponse> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.error.length > 0) {
                  return _buildErrorWidget(snapshot.data!.error);
                }
                return _buildHomeWidget(snapshot.data!);
              } else if (snapshot.hasError) {
                return _buildErrorWidget(snapshot.error.toString());
              } else {
                return _buildLoadingWidget();
              }
            },
          ),
              
          Topic("Favoritas"),
          SizedBox(
            height: 5.0,
          ),

          StreamBuilder<TvResponse>(
            stream: profileBloc.tvsFav.stream,
            builder: (context, AsyncSnapshot<TvResponse> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.error.length > 0) {
                  return _buildErrorWidget(snapshot.data!.error);
                }
                return _buildHomeWidget(snapshot.data!);
              } else if (snapshot.hasError) {
                return _buildErrorWidget(snapshot.error.toString());
              } else {
                return _buildLoadingWidget();
              }
            },
          ),
        ],
      ));
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
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
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("An error has occured: $error"),
      ],
    ));
  }

  Widget _buildHomeWidget(TvResponse data) {
    return TvListCards(data.tvs, context);    
  }
}