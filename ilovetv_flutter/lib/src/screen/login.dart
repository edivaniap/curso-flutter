import 'package:flutter/material.dart';

import 'package:ilovetv_flutter/src/shared/constants.dart';
import 'package:ilovetv_flutter/src/data/user.dart';
import 'package:ilovetv_flutter/src/data/user_preferences.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late User user;
  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: COLOR_PRIMARY,
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(
              //initialValue: user.username,
              maxLength: 15,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: BLACK, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: GRAY, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: COLOR_PRIMARY, width: 3.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Usuário',
              ),
              onChanged: (username) =>
                  setState(() => user = user.copy(username: username)),
            ),


            SizedBox(
              height: 10.0,
            ),          


            TextFormField(
              maxLength: 10,
              decoration: InputDecoration(
                //icon: Icon(Icons.lock_rounded),
                suffixIcon: GestureDetector(
                  child: Icon(showPass
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded, color: COLOR_PRIMARY,),
                  onTap: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: BLACK, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: GRAY, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: COLOR_PRIMARY, width: 3.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Senha',
              ),
              obscureText: !showPass,
              onChanged: (pass) => setState(() => user = user.copy(pass: pass)),
            ),


            SizedBox(
              height: 15.0,
            ),
          
            
            ElevatedButton(
              child: const Text('ENTRAR'),
              onPressed: () {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterUser(),
                  ),
                ); */
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10.0),
                minimumSize: Size(size.width * 0.5, 16.0),
                primary: BLACK,
                textStyle: TextStyle(fontSize: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ))));
  }
}