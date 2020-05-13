import 'package:flutter/material.dart';
import 'package:literact/constants.dart';
import 'package:literact/screens/home_screen.dart';
import 'package:literact/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          fontFamily: 'Playfair',
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.white,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          bottomAppBarTheme: klightBottomBar,
          appBarTheme: kLightAppBar),
      darkTheme: ThemeData(
          fontFamily: 'Playfair',
          scaffoldBackgroundColor: Colors.black,
          bottomAppBarTheme: kdarkBottomBar,
          accentColor: Colors.black,
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          appBarTheme: kDarkAppBar),
      title: 'Literact',
      home: SplashScreen(),
    );
  }
}
