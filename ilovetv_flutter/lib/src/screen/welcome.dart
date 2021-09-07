import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/shared/constants.dart';

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

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = COLOR_PRIMARY,
    this.textColor = COLOR_TEXT_LIGTH
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      child: ClipRRect(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))
          ),
          onPressed: press(),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 16.0),)),
      ),
    );
  }
}