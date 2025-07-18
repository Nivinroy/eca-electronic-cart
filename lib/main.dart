import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarttote/screens/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Builder(
      builder: (BuildContext context) {
        return LoginScreen();
      },
    ),
  ));
}
