import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

const kbookCollection = 'obras';
const kauthorCollection = 'autores';
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

const kbottombarIcons = [
  BottomNavigationBarItem(icon: Icon(Feather.home), title: Text('Home')),
  BottomNavigationBarItem(icon: Icon(Feather.feather), title: Text('Authors')),
  BottomNavigationBarItem(icon: Icon(Feather.book), title: Text('Saved')),
];

const kdarkAppTextTheme = TextTheme(
  headline6: kAppbarDarkTitleTheme,
);
const klightAppTextTheme = TextTheme(headline6: kAppbarLightTextTheme);

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

const kdarkBottomBar = BottomAppBarTheme(color: Colors.white, elevation: 0);
const klightBottomBar = BottomAppBarTheme(color: Colors.black, elevation: 0);
