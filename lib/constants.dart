import 'dart:ui';

import 'package:flutter/material.dart';

const kAppbarLightTextTheme = TextStyle(
    color: Colors.white,
    fontFamily: 'PlayFair',
    fontSize: 20,
    fontWeight: FontWeight.w500);
const kAppbarDarkTitleTheme = TextStyle(
    color: Colors.black,
    fontFamily: 'PlayFair',
    fontSize: 20,
    fontWeight: FontWeight.w500);



const kdarkAppTextTheme = TextTheme(
  headline6: kAppbarDarkTitleTheme,

);
const klightAppTextTheme = TextTheme(
  headline6: kAppbarLightTextTheme
);




const kDarkAppBar = AppBarTheme(
  brightness: Brightness.light,
  color: Colors.white,
  textTheme: kdarkAppTextTheme,
);
const kLightAppBar = AppBarTheme(
  brightness: Brightness.light,
  color: Colors.black,
  textTheme: klightAppTextTheme,
);

const kdarkBottomBar = BottomAppBarTheme(color: Colors.white,elevation: 0);
const klightBottomBar = BottomAppBarTheme(color: Colors.black,elevation: 0);


