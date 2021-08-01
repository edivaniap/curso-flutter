import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String _image;
  String _texto;

  Result(this._image, this._texto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Minha Calculadora de IMC', style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.yellow
      ),

      backgroundColor: Colors.black54,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            _image,
            fit: BoxFit.cover,
            height: 300.0,
          ),

          Divider(),
          
          Center(
            child: Text(
              _texto,
              style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}