import 'package:flutter/material.dart';
import 'package:literact/main.dart';

class AuthorAvatar extends StatelessWidget {
  final String url;

  AuthorAvatar({@required this.url});

  @override
  Widget build(BuildContext context) {
    double radius = 20;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: MyApp.getBackColor(context),
        child: CircleAvatar(
          radius: radius - (radius * 0.10),
          backgroundColor: MyApp.getTextColor(context),
          child: CircleAvatar(
            radius: radius - (radius * 0.20),
            backgroundColor: MyApp.getTextColor(context),
            backgroundImage: NetworkImage(url),
          ),
        ),
      ),
    );
  }
}
