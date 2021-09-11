import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:ilovetv_flutter/src/model/tv.dart';
import 'package:ilovetv_flutter/src/screen/tv_datail.dart';

Widget Topic(String title) {
  return Padding(
    padding: EdgeInsets.only(left: 12.0, top: 12.0),
    child: Text(
      title,
      style: TextStyle(
          color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget TvListCards(List<Tv> _tvs, BuildContext _context) {
  if (_tvs.length == 0) {
    return Container(
      width: MediaQuery.of(_context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Sem séries",
                style: TextStyle(color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  } else {
    return Container(
      height: 270.0,
      padding: EdgeInsets.only(left: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _tvs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
            child: GestureDetector(
              onTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TvDetailScreen(tv: _tvs[index]),
                    ),
                  );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w200/${_tvs[index].poster}",
                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
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
                      width: 110.0,
                      height: 165.0,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          image: imageProvider,
                          width: 110.0,
                          height: 165.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                  Divider(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _tvs[index].voteAverage.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        height: 5.0,
                      ),
                      RatingBar(
                        itemSize: 12.0,
                        initialRating: _tvs[index].voteAverage / 2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        ratingWidget: RatingWidget(
                          full:
                              Icon(Icons.star, size: 25, color: Colors.yellow),
                          half: Icon(Icons.star_half,
                              size: 25, color: Colors.yellow),
                          empty:
                              Icon(Icons.star, size: 25, color: Colors.black38),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  ),
                  Divider(
                    height: 5.0,
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      _tvs[index].name,
                      maxLines: 2,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget TVShowCard(String title, String rate, String image) {
  return Padding(
      padding: EdgeInsets.only(left: 5.0, top: 12.0),
      child: Column(
            children: <Widget>[
              Card(
                elevation: 0.0,
                child: ClipRRect(
                  borderRadius: new BorderRadius.circular(10.0),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(image),
                    width: 110.0,
                    height: 165.0,
                  ),
                ),
              ),
            ],
          ));
}
