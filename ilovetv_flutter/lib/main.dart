import 'package:flutter/material.dart';

import 'package:ilovetv_flutter/src/screen/app.dart';
import 'package:ilovetv_flutter/src/data/loggedin_preferences.dart';
import 'package:ilovetv_flutter/src/screen/welcome.dart';
import 'package:ilovetv_flutter/src/data/user_preferences.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await LoggedInPreferences.init();

  runApp(
    MaterialApp(
      home: (LoggedInPreferences.isLoggedIn() ? ILoveTVApp() : Welcome()),
    ),
  );
}