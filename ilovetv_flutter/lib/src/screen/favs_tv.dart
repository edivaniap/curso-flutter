import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/bloc/tvs_favs_bloc.dart';
import 'package:provider/provider.dart';

import 'package:ilovetv_flutter/src/bloc/tvs_added_bloc.dart';
import 'package:ilovetv_flutter/src/bloc/tvs_top_bloc.dart';
import 'package:ilovetv_flutter/src/bloc/user_logged_bloc.dart';
import 'package:ilovetv_flutter/src/model/tv_response.dart';
import '../shared/components.dart';

class FavsTV extends StatefulWidget {
  @override
  _FavsTVState createState() => _FavsTVState();
}

class _FavsTVState extends State<FavsTV> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loggedBloc = context.watch<UserLoggedBloc>();
    setState(() {
      favsBloc..getList(loggedBloc.user.ids_tv_fav);
    });   

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Topic("Favoritas"),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<TvResponse>(
          stream: favsBloc.subject.stream,
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
        )
      ],
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
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
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
