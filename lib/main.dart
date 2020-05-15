import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:literact/constants.dart';
import 'package:literact/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getBackColor(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: getBackColor(context), // navigation bar color
      statusBarColor: getBackColor(context), // status bar color
    ));
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

  static Color getBackColor(BuildContext context) {
    return Theme
        .of(context)
        .scaffoldBackgroundColor;
  }

  static Color getTextColor(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .headline5
        .color;
  }

  static Color getCardBackColor(BuildContext context) {
    final ThemeData mode = Theme.of(context);
    Brightness whichMode = mode.brightness;
    return whichMode == Brightness.light ? Colors.black : Colors.white;
  }

  static Color getCardTextColor(BuildContext context) {
    final ThemeData mode = Theme.of(context);
    Brightness whichMode = mode.brightness;
    return whichMode == Brightness.light ? Colors.white : Colors.black;
  }
}
