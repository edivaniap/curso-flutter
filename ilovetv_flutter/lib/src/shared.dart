import 'package:flutter/material.dart';

Widget Topic(String title) {
  return Padding(
      padding: EdgeInsets.only(left:12.0, top: 12.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),),
    );
}

Widget TVShowCard(String title, String rate, String image) {
  return Padding(
    padding: EdgeInsets.only(left: 5.0, top: 12.0),
    child: InkWell(
    // When the user taps the button, show a snackbar.
      onTap: () {
        //do something
      },
      child: Column(children: <Widget>[
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
        /* SizedBox(height: 5.0),
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Text(
          rate,
          style: TextStyle(color: Colors.black, fontSize: 15.0,),
        ) */
      ],)
  ));
}
