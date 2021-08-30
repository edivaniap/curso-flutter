import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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



            
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
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
              ],
            ),



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
}
