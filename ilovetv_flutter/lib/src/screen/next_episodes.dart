import 'package:flutter/material.dart';

import 'package:ilovetv_flutter/src/bloc/tvs_added_bloc.dart';
import 'package:ilovetv_flutter/src/data/loggedin_preferences.dart';
import 'package:ilovetv_flutter/src/model/user.dart';
import 'package:ilovetv_flutter/src/model/episode_response.dart';
import 'package:ilovetv_flutter/src/model/tv.dart';
import 'package:ilovetv_flutter/src/shared/components.dart';
import 'package:ilovetv_flutter/src/bloc/next_eps_bloc.dart';

class NextEpisodes extends StatefulWidget {
  @override
  _NextEpisodesState createState() => _NextEpisodesState();
}

class _NextEpisodesState extends State<NextEpisodes> {
  List<Tv> __tvs = [];
  late User loggedUser;

  @override
  void initState() {
    super.initState();
    loggedUser = LoggedInPreferences.getUser();
     __tvs = addedBloc.subject.value.tvs;
    nextEpBloc..getList(loggedUser.ids_tv_added);
  }

  @override
  Widget build(BuildContext context) {
    //sempre que buildar atualizar usuario e blocs
    setState(() {
      loggedUser = LoggedInPreferences.getUser();
     __tvs = addedBloc.subject.value.tvs;
      nextEpBloc..getList(loggedUser.ids_tv_added);
    });
    
      return StreamBuilder<EpisodeResponse>(
          stream: nextEpBloc.subject.stream,
          builder: (context, AsyncSnapshot<EpisodeResponse> snapshot) {
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
        );
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

  Widget _buildHomeWidget(EpisodeResponse data) {
    return NextEpsListCards(__tvs, data.episodes, context);    
  }
}