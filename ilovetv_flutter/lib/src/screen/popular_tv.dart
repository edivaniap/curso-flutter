import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/bloc/tvs_popular_bloc.dart';
import 'package:ilovetv_flutter/src/model/tv_response.dart';
import 'shared.dart';

class PopularTV extends StatefulWidget {
  @override
  _PopularTVState createState() => _PopularTVState();
}

class _PopularTVState extends State<PopularTV> {
  @override
  void initState() {
    super.initState();
    popBloc..getPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Topic("Mais populares"),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<TvResponse>(
          stream: popBloc.subject.stream,
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
