import 'package:flutter/material.dart';
import 'result.dart';

/// This is the stateful widget that the main application instantiates.
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

/// This is the private State class that goes with the StatefulWidget Home.
class _HomeState extends State<Home> {
  //controllers que possibilita pegar os valores dos campos
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  //informa o estado do formulario
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //armazenar resultado do calculo
  
  //metodo reseta os campos do formulario
  void _resetFields() {
    _formKey.currentState!.reset(); //! garante qua nao vai ser nulo?
    pesoController.clear();
    alturaController.clear();
  }
  
  //calcula o imc e salva o resultado
  void _calcular() {
    String _textResultado = "";
    String _imageResultado = "";

      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);

      if(imc < 18.6) {
        _textResultado = "Abaixo do peso";
        _imageResultado = "images/skinny_cat.jpg";
      }
      else if(imc >= 18.6 && imc < 24.9) {
        _textResultado = "Peso ideal";
        _imageResultado = "images/shape_cat.jpg";
      }
      else if(imc >= 24.9 && imc < 29.9) {
        _textResultado = "Levemente acima do peso";
        _imageResultado = "images/fat_cat.jpg";
      }
      else if(imc >= 29.9 && imc < 34.9) {
        _textResultado = "Obesidade Grau I";
        _imageResultado = "images/fat_cat.jpg";
      }
      else if(imc >= 34.9 && imc < 39.9) {
        _textResultado = "Obesidade Grau II";
        _imageResultado = "images/fat_cat.jpg";
      }
      else if(imc >= 39.9) {
        _textResultado = "Obesidade Grau III";
        _imageResultado = "images/fat_cat.jpg";
      }
      
      _textResultado += " (${imc.toStringAsPrecision(4)})";

      Navigator.push(context, MaterialPageRoute(builder: (context) => Result(_imageResultado, _textResultado)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Calculadora de IMC', style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          IconButton(
            onPressed: _resetFields,
            icon: Icon(Icons.refresh),
            color: Colors.black
          )
        ],
      ),
      
      backgroundColor: Colors.black54,
      //permite abrir o teclado e fazer scroll caso o teclado fique por cima do conteudo
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //estica coluna ate onde der
            children: <Widget>[
              Icon(Icons.person, size: 125, color: Colors.yellow),
              TextFormField(
                keyboardType: TextInputType.number, //teclado numerico
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.yellow, fontSize: 24),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow, width: 2.0),
                    borderRadius: BorderRadius.circular(30.0)
                  ),),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
                controller: pesoController,
                validator: (value) { if(value!.isEmpty) return "Insira o peso!"; },
              ),

              TextFormField(
                keyboardType: TextInputType.number, //teclado numerico
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.yellow, fontSize: 24),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow, width: 2.0),
                    borderRadius: BorderRadius.circular(30.0)
                  ),),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
                controller: alturaController,
                validator: (value) { if(value!.isEmpty) return "Insira a altura!"; },
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      textStyle: TextStyle(fontSize: 24.0, color: Colors.black), //color black aqui nao funciona no texto, tive que setar no style do texto
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    onPressed: () {
                      if(_formKey.currentState!.validate()) _calcular();
                    },
                    child: Text('Calcular', style: TextStyle(color: Colors.black))
                  ),
              ),

              /*Text(
                _textResultado,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              )*/
            ],

          ),
        ),
      )
    );
  }
}