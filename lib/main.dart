import 'package:flutter/material.dart';
import 'package:flutterfire_samples/screens/sign_in_screen.dart';

import 'screens/main_screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFire Samples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
        fontFamily: 'OpenSans',
      ),
      // home: SignInScreen(),
      home: HomeScreen(),
    );
  }
}
