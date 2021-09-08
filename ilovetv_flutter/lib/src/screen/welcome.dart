import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/shared/rounded_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Container(//gambiarra para deixar conteudo centralizado e dar um padding
            width: size.width,
            height: size.height * 0.15,
          ),

          Image(
            image: AssetImage('assets/images/logo0002.png'),
            width: size.width * 0.6,
          ),
          Text(
            'Olá!',
            style: TextStyle(color: Colors.black, fontSize: 30.0 ),
          ),

          Container(//gambiarra para deixar conteudo centralizado e dar um padding
            width: size.width,
            height: size.height * 0.05,
          ),
         
          RoundedButton(
            text: 'Login',
            press: (){}
          ),
          RoundedButton(
            text: 'Cadastrar',
            press: (){},
            color: Colors.black,
          )
        ],
      )
    );
  }
}