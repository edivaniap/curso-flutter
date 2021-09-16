import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:ilovetv_flutter/src/bloc/loggedin_bloc.dart';
import 'package:ilovetv_flutter/src/bloc/tvs_added_bloc.dart';
import 'package:ilovetv_flutter/src/bloc/tvs_favs_bloc.dart';
import 'package:ilovetv_flutter/src/data/loggedin_preferences.dart';
import 'package:ilovetv_flutter/src/model/user.dart';
import 'package:ilovetv_flutter/src/data/user_preferences.dart';
import 'package:ilovetv_flutter/src/model/tv.dart';
import 'package:ilovetv_flutter/src/shared/constants.dart';

class TvDetailScreen extends StatefulWidget {
  final Tv tv;
  TvDetailScreen({required this.tv});
  @override
  _TvDetailScreenState createState() => _TvDetailScreenState(tv);
}

class _TvDetailScreenState extends State<TvDetailScreen> {
  final Tv tv;
  _TvDetailScreenState(this.tv);

  @override
  void initState() {
    super.initState();
    loggedBloc..getUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
        appBar: AppBar(
          title: Text(
            tv.name,
            style: TextStyle(color: COLOR_TEXT_LIGTH),
          ),
          toolbarHeight: 50.0,
          backgroundColor: COLOR_PRIMARY,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            //imagem cabecalho
            CachedNetworkImage(
              imageUrl: "https://image.tmdb.org/t/p/original/${tv.backdrop}",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: Colors.purple.shade400,
                    strokeWidth: 3,
                  ),
                ),
              ),
              errorWidget: (context, url, error) =>
                  Icon(Icons.image_not_supported_rounded),
              width: size.width,
              height: 180,
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                width: 110.0,
                height: 165.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),


            //pontuacao favorito e adicionar
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 20.0,),
                Text(
                  tv.voteAverage.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.0,
                ),
                RatingBar(
                  itemSize: 20.0,
                  initialRating: tv.voteAverage / 2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  ratingWidget: RatingWidget(
                    full: Icon(Icons.star, size: 25, color: Colors.yellow),
                    half: Icon(Icons.star_half, size: 25, color: Colors.yellow),
                    empty: Icon(Icons.star, size: 25, color: Colors.black38),
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),

                Spacer(),

                //stream do loggedBloc para construir botao fav
                StreamBuilder<User>(
                  stream: loggedBloc.user.stream,
                  builder: (context, AsyncSnapshot<User> snapshot) {
                    if (snapshot.hasData) {
                      return _buildFavWidget(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return _buildErrorWidget(snapshot.error.toString());
                    } else {
                      return _buildLoadingWidget();
                    }
                  },
                ),

                SizedBox(width: 10.0,),

                //stream do loggedBloc para construir botao add
                StreamBuilder<User>(
                  stream: loggedBloc.user.stream,
                  builder: (context, AsyncSnapshot<User> snapshot) {
                    if (snapshot.hasData) {
                      return _buildAddWidget(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return _buildErrorWidget(snapshot.error.toString());
                    } else {
                      return _buildLoadingWidget();
                    }
                  },
                ),


                SizedBox(width: 20.0,),
              ],
            ),


            //resumo
            Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  tv.overview,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                )),



          ],
        ));
  }

  Widget _buildFavWidget(User data) {
    void _fav() {
      //adicionar na lista de favs do shared prefs
      final idsTv = data.ids_tv_fav.contains(tv.id)
                    ? (List.of(data.ids_tv_fav)..remove(tv.id))
                    : (List.of(data.ids_tv_fav)..add(tv.id));

      //update user logado prefs
      LoggedInPreferences.setUser(data.copy(ids_tv_fav: idsTv));
      //update user na lista do prefs
      UserPreferences.setUser(data.copy(ids_tv_fav: idsTv));
      //update blocs
      loggedBloc..getUser();
      favsBloc..getList(idsTv);
    }

    return IconButton(
      onPressed: _fav,
      icon: Icon(
        loggedBloc.user.value.ids_tv_fav.contains(tv.id)
        ? Icons.favorite_rounded
        :Icons.favorite_border_rounded,
        color: RED, size: 30,),
      tooltip: (data.ids_tv_fav.contains(tv.id)
                ? 'Remover dos favoritos': 'Favoritar'),
    ); 
  }

  Widget _buildAddWidget(User data) {
    void _add() {
      //adicionar na lista de adds do shared prefs
      final idsTv = data.ids_tv_added.contains(tv.id)
                    ? (List.of(data.ids_tv_added)..remove(tv.id))
                    : (List.of(data.ids_tv_added)..add(tv.id));

      //update user logado prefs
      LoggedInPreferences.setUser(data.copy(ids_tv_added: idsTv));
      //update user na lista do prefs
      UserPreferences.setUser(data.copy(ids_tv_added: idsTv));         
      //update addeds bloc
      loggedBloc..getUser();
      addedBloc..getList(idsTv);
    }

    return IconButton(
      onPressed: _add,
      icon: Icon(
        data.ids_tv_added.contains(tv.id)
        ? Icons.task_alt_rounded
        :Icons.add_circle_outline_rounded,
        color: GREEN, size: 30,),
      tooltip: (data.ids_tv_added.contains(tv.id)
                ? 'Remover': 'Adicionar'),
    );
  }

  Widget _buildLoadingWidget() {
    return SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        );
  }

  Widget _buildErrorWidget(String error) {
    return Icon(Icons.error_rounded, color: BLACK, size: 25, semanticLabel: 'An error has occured: $error',);
  }

}
