import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/screen/welcome.dart';
import 'package:ilovetv_flutter/src/data/user_preferences.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();

  runApp(
    MaterialApp(
      home: Welcome(),
      theme: ThemeData(),
    )
  );
}