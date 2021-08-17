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
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'BEM VINDO(A)!',
            style: TextStyle(color: Colors.black, fontSize: 30.0 ),
          ),
          Divider(),
          RoundedButton(text: 'Login', press: (){}),
          RoundedButton(text: 'Cadastrar', press: (){}, color: Colors.grey, textColor: Colors.black,)
        ],
      )
       // RoundedButton(text: 'Login', press: (){}),
        //Divider(thickness: 1.0, color: Colors.deepOrange),
     //   RoundedButton(text: 'Cadastrar', press: (){}, color: COLOR_BG_LIGTH, textColor: Colors.black,)
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
      width: size.width * 0.7,
      child: ClipRRect(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))
          ),
          onPressed: press(),
          child: Text(
            text,
            style: TextStyle(color: textColor),)),
      ),
    );
  }
}