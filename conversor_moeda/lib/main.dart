import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=b3352bad";

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      hintColor: Colors.greenAccent.shade400,
      primaryColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintStyle: TextStyle(color: Colors.white),
    )),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final realCtllr = TextEditingController();
  final dolarCtllr = TextEditingController();
  final euroCtllr = TextEditingController();

  late double dolar;
  late double euro;

  void _realChanged(String text) {
    if(text.isEmpty) {
      _clearAll(); return;
    }
    double real = double.parse(text);
    dolarCtllr.text = (real / dolar).toStringAsFixed(2);
    euroCtllr.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if(text.isEmpty) {
      _clearAll(); return;
    }
    double dolarFromInput = double.parse(text);
    realCtllr.text = (dolarFromInput * dolar).toStringAsFixed(2);
    euroCtllr.text = (dolarFromInput * dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if(text.isEmpty) {
      _clearAll(); return;
    }
    double euroFromInput = double.parse(text);
    realCtllr.text = (euroFromInput * euro).toStringAsFixed(2);
    dolarCtllr.text = (euroFromInput * euro / dolar).toStringAsFixed(2);
  }

  void _clearAll() {
    realCtllr.text = '';
    dolarCtllr.text = '';
    euroCtllr.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Conversor de Moedas',  style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.lightGreenAccent.shade400,
        centerTitle: true,
      ),
      //FutureBuilder mostra texto (ex 'carregando dados...') enquanto os dados nao foram carregados
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text('Carregando dados...',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                  textAlign: TextAlign.center)
                );
            default:
              if(snapshot.hasError) {
                return Center(
                child: Text('Erro ao carregar dados :(',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                  textAlign: TextAlign.center)
                );
              } else {
                dolar = snapshot.data!['results']['currencies']['USD']['buy'];
                euro = snapshot.data!['results']['currencies']['EUR']['buy'];

                return SingleChildScrollView(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.monetization_on, size: 125.0, color: Colors.amber),
                      Divider(),
                      buildTextField('Reais', 'R\$ ', realCtllr, _realChanged),
                      Divider(),
                      buildTextField('Dólares', 'US\$ ', dolarCtllr, _dolarChanged),
                      Divider(),
                      buildTextField('Euros', '€ ', euroCtllr, _euroChanged)
                    ],
                  ),
                );
              }
          }
        }
      ),
    );
  }

  Widget buildTextField(String label, String prefix, TextEditingController txtCtllr, Function(String) f) {
    return TextField(
      controller: txtCtllr,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.greenAccent.shade400),
        border: OutlineInputBorder(),
        prefixText: prefix
        ),
        style: TextStyle (color: Colors.greenAccent.shade400, fontSize: 24.0),
        //keyboardType: TextInputType.number,
        keyboardType: TextInputType.numberWithOptions(decimal: true), //permite digitar decimal no iOS
        onChanged: f
      );
  }
}