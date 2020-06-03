import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:literact/model/app_data.dart';
import 'package:literact/screens/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'Splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

final _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseUser loggedUser;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.currentUser().then((user) {
      print('user ${user.displayName}');
      setState(() {
        loggedUser = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Future signInWithGoogle() async {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      Provider.of<AppData>(context, listen: true).setUser(currentUser);
    }

    void startLogin() {
      signInWithGoogle();
    }

    final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.blue, Colors.purple],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0));
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
                    onFinished: loggedUser != null
                        ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeScreen(loggedUser)));
                          }
                        : startLogin,
                    text: ['Litteract'],
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                GradientText("Ilustris",
                    gradient: LinearGradient(colors: [
                      Colors.deepPurple,
                      Colors.blueAccent,
                      Colors.white
                    ]),
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
