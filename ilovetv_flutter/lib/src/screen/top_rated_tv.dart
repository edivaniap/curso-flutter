import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/bloc/tvs_top_bloc.dart';
import 'package:ilovetv_flutter/src/model/tv_response.dart';
import '../shared/components.dart';

class TopRatedTV extends StatefulWidget {
  @override
  _TopRatedTVState createState() => _TopRatedTVState();
}

class _TopRatedTVState extends State<TopRatedTV> {
  @override
  void initState() {
    super.initState();
    topBloc..getTopRated();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Topic("Mais bem avaliados"),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<TvResponse>(
          stream: topBloc.subject.stream,
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
