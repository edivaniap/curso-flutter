import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    )
  );
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('I love TV',  style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Container(
        color: Colors.purple.shade800,
        child: Center(
          child: Text(
            "App em construção...",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.purple.shade800,
        height: 50,
        index: 1,
        animationDuration: Duration( milliseconds: 500 ),
        items: <Widget>[
          Icon(Icons.add, size: 25),
          Icon(Icons.home, size: 25),
          Icon(Icons.compare_arrows, size: 25),
        ],
        onTap: (index) {
          debugPrint(">> Index do curved_navigation_bar: $index");
        },
      ),
    );
  }
}