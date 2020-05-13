import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:literact/screens/posts_screen.dart';
import 'package:literact/screens/profile_screen.dart';
import 'package:literact/screens/saved_stories.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'Home';
  int currentIndex = 2;
  var screens = [
    PostScreen(),
    Stories(),
    Profile()
  ];




  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget screen() =>widget.screens[widget.currentIndex];

  void selectScreen(int index){
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData mode = Theme.of(context);
    Brightness whichMode = mode.brightness;

    Color backcolor() =>
        whichMode == Brightness.light ? Colors.black : Colors.white;
    Color itemcolor() => whichMode == Brightness.light
        ? Colors.white.withOpacity(0.50)
        : Colors.black.withOpacity(0.50);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: backcolor(), // navigation bar color
      statusBarColor: backcolor(), // status bar color
    ));

    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: 'title', child: Text('Litteract')),
        centerTitle: true,
      ),
      body: SafeArea(
        child: screen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        backgroundColor: backcolor(),
        unselectedItemColor: itemcolor(),
        selectedItemColor: Theme.of(context).accentColor,
        elevation: 0,
        onTap:(index) {
          selectScreen(index);
        } ,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(AntDesign.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(AntDesign.book), title: Text('Saved')),
          BottomNavigationBarItem(
            icon: Icon(AntDesign.user),
            title: Text('Profile'),
          )
        ],
      ),
    );
  }
}
