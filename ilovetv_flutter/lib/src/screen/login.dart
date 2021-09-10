import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ilovetv_flutter/src/shared/constants.dart';
import 'package:ilovetv_flutter/src/screen/app.dart';
import 'package:ilovetv_flutter/src/data/user.dart';
import 'package:ilovetv_flutter/src/data/user_preferences.dart';
import 'package:ilovetv_flutter/src/bloc/user_logged_bloc.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late List<User> users;
  bool showPass = false;
  bool errorMsg = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  //informa o estado do formulario
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  //metodo reseta os campos do formulario
  void _resetFields() {
    _formKey.currentState!.reset(); //! garante qua nao vai ser nulo?
    usernameController.clear();
    passController.clear();
  }

  @override
  void initState() {
    super.initState();

    users = UserPreferences.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final loggedBloc = context.watch<UserLoggedBloc>();

    return new Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: COLOR_PRIMARY,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: _resetFields,
              icon: Icon(Icons.refresh),
            )
          ],
        ),
        body: SingleChildScrollView(
           padding: EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

           Text(loggedBloc.logged.id),
           Text(loggedBloc.logged.name),
Text('Registros', style: TextStyle(fontSize: 20.0),),


            TextFormField(
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
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: RED, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Usuário',
              ),
              style: TextStyle(fontSize: 16),
              controller: usernameController,
              validator: (value) { if(value!.isEmpty) return "Campo vazio!"; },
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
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: RED, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Senha',
              ),
              obscureText: !showPass,
              style: TextStyle(fontSize: 16),
              controller: passController,
              validator: (value) { if(value!.isEmpty) return "Campo vazio!"; },
            ),


            SizedBox(height: 10.0),

            errorMsg ? 
            Text('Usuário ou senha incorreta', style: TextStyle(color: RED, fontSize: 14),)
            : SizedBox(height: 16.0,),

            SizedBox(height: 10.0),
            
            ElevatedButton(
              child: const Text('ENTRAR'),
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  User user = UserPreferences.authenticateUser(usernameController.text, passController.text); 
                  if(user.id == '') {
                    setState(() {
                      errorMsg = !errorMsg;
                    });
                  } else {
                    loggedBloc.setLogged(user);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ILoveTVApp(),
                        ),
                    );
                  }
                }
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