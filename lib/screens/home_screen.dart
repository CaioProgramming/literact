import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:literact/constants.dart';
import 'package:literact/model/app_data.dart';
import 'package:literact/screens/authors_screen.dart';
import 'package:literact/screens/posts_screen.dart';
import 'package:literact/screens/saved_stories.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'Home';
  FirebaseUser user;

  HomeScreen(this.user);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  var screens = [
    PostScreen(),
    AuthorsScreen(),
    Stories(),
  ];
  Widget screen() => screens[currentIndex];

  void selectScreen(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(1.5, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData mode = Theme.of(context);
    Brightness whichMode = mode.brightness;

    return ChangeNotifierProvider(
      create: (context) => AppData(widget.user),
      child: Consumer<AppData>(builder: (context, provider, child) {
        var appData = Provider.of<AppData>(context);
        return Scaffold(
          appBar: AppBar(
            title: AnimatedOpacity(
              opacity: 1,
              duration: Duration(milliseconds: 500),
              child: Text('Litteract'),
            ),
          ),
          body: SafeArea(
            child: screen(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: MyApp.getCardBackColor(context),
            unselectedItemColor: MyApp.getBackColor(context).withOpacity(0.40),
            selectedItemColor: Theme.of(context).accentColor,
            elevation: 0,
            onTap: (index) {
              selectScreen(index);
            },
            items: kbottombarIcons,
          ),
        );
      }),
    );
  }
}
