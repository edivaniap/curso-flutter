import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

import 'package:ilovetv_flutter/src/shared/constants.dart';
import 'package:ilovetv_flutter/src/screen/login.dart';
import 'package:ilovetv_flutter/src/data/user.dart';
import 'package:ilovetv_flutter/src/data/user_preferences.dart';

class RegisterUser extends StatefulWidget {
  final String? idUser;

  const RegisterUser({
    Key? key,
    this.idUser, //para editar
  });

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  late User user;
  bool showPass = false;

  @override
  void initState() {
    super.initState();

    final id = Uuid().v4();
    print('USER ID: $id');

    user = widget.idUser == null
        ? User(id: id)
        : UserPreferences.getUser(widget.idUser!);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
        appBar: AppBar(
          title: Text('Cadastre-se'),
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
              initialValue: user.name,
              onChanged: (name) => setState(() => user = user.copy(name: name)),
              maxLength: 30,
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
                hintText: 'Nome',
              ),
            ),
            
            
            SizedBox(
              height: 10.0,
            ),
            
            
            TextFormField(
              initialValue: user.username,
              onChanged: (username) =>
                  setState(() => user = user.copy(username: username)),
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
            ),


            SizedBox(
              height: 10.0,
            ),          


            TextFormField(
              onChanged: (pass) => setState(() => user = user.copy(pass: pass)),
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
            ),


            SizedBox(
              height: 15.0,
            ),
          
            
            ElevatedButton(
              child: const Text('ENVIAR'),
              onPressed: () async {
                final isNewUser = widget.idUser == null;
                
                if (isNewUser) {
                  setState(() {
                    user = user.copy(createdAt: DateTime.now().toString());
                    user = user.copy(profile: 'assets/icons/user.png');
                  });
                  
                  await UserPreferences.addUsers(user);
                  await UserPreferences.setUser(user);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
                } else {
                  await UserPreferences.setUser(user);
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
