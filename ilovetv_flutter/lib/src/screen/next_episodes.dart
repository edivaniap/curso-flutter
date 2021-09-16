import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/bloc/tvs_added_bloc.dart';
import 'package:ilovetv_flutter/src/model/episode_response.dart';
import 'package:ilovetv_flutter/src/model/tv.dart';
import 'package:ilovetv_flutter/src/shared/components.dart';
import 'package:provider/provider.dart';
import 'package:ilovetv_flutter/src/bloc/next_eps_bloc.dart';
import 'package:ilovetv_flutter/src/bloc/user_logged_bloc.dart';
import '../shared/constants.dart';

class NextEpisodes extends StatefulWidget {
  @override
  _NextEpisodesState createState() => _NextEpisodesState();
}

class _NextEpisodesState extends State<NextEpisodes> {
  List<Tv> __tvs = [];

  @override
  Widget build(BuildContext context) {
    final loggedBloc = context.watch<UserLoggedBloc>();
    setState(() {
      __tvs = addedBloc.subject.value.tvs; //get the value on the bloc
      nextEpBloc..getList(loggedBloc.user.ids_tv_added);
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