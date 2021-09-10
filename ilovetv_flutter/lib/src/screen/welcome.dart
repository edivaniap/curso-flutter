import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/screen/login.dart';
import 'package:ilovetv_flutter/src/screen/register.dart';
import 'package:ilovetv_flutter/src/shared/constants.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
        body: Center(
            child: Column(
      children: [

        SizedBox(
          height: size.height * 0.1,
        ),


        Image(
          image: AssetImage('assets/images/logo0002.png'),
          width: size.width * 0.6,
        ),

        
        Text(
          'Olá!',
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),


        SizedBox(
          height: size.height * 0.1,
        ),

        
        ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
            );},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10.0),
              minimumSize: Size(size.width * 0.7, 16.0),
              primary: COLOR_PRIMARY,
              textStyle: TextStyle(fontSize: 18.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            ),


        SizedBox(
          height: 10.0,
        ),


        ElevatedButton(
            child: const Text('Cadastrar'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterUser(),
                ),
            );},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10.0),
              minimumSize: Size(size.width * 0.7, 16.0),
              primary: BLACK,
              textStyle: TextStyle(fontSize: 18.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            ),
      ],
    )));
  }
}
