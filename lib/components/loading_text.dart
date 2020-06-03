import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LoadTyping extends StatelessWidget {
  final bool repeat;

  LoadTyping({this.repeat = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TypewriterAnimatedTextKit(
        isRepeatingAnimation: repeat,
        speed: Duration(seconds: 1),
        text: ['Litteract'],
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
