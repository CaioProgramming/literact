import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:literact/components/profile_avatar.dart';
import 'package:literact/constants.dart';
import 'package:literact/screens/posts_screen.dart';
import 'package:literact/screens/saved_stories.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'Home';
  int currentIndex = 0;
  var screens = [
    PostScreen(),
    Stories(),
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


    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: 'title', child: Text('Litteract')),
        centerTitle: true,
        elevation: 0,
        leading: ProfileAvatar(
          url: 'https://instagram.fcgh16-1.fna.fbcdn.net/v/t51.2885-19/s320x320/81252612_2482563102025209_5766338480753868800_n.jpg?_nc_ht=instagram.fcgh16-1.fna.fbcdn.net&_nc_ohc=HMzs6GNoIHEAX9bONWB&oh=7cc0370e01969f348508d6919065ed81&oe=5EE790DD',),
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
        items: kbottombarIcons,
      ),
    );
  }
}

