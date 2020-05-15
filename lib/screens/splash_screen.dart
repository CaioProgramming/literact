import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:literact/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'Splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

final _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseUser loggedUser;
bool fetcheduser = false;
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.currentUser().then((user) {
      setState(() {
        loggedUser = user;
        fetcheduser = true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'title',
                  child: TypewriterAnimatedTextKit(
                    isRepeatingAnimation: false,
                    totalRepeatCount: 1,
                    speed: Duration(seconds: 1),
                    onFinished: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    text: ['Litteract'],
                    textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
