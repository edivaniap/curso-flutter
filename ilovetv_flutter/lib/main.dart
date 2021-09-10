import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ilovetv_flutter/src/bloc/user_logged_bloc.dart';
import 'package:ilovetv_flutter/src/screen/welcome.dart';
import 'package:ilovetv_flutter/src/data/user_preferences.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('>> root build called');
    return ChangeNotifierProvider(
        create: (_) => UserLoggedBloc(),
        child: MaterialApp(
            home: Welcome(),
            theme: ThemeData(),
          )
      );
  }
}