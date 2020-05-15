import 'package:flutter/material.dart';
import 'package:literact/main.dart';

class AuthorAvatar extends StatelessWidget {
  final String url;

  AuthorAvatar({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: MyApp.getTextColor(context),
        ),
        padding: EdgeInsets.all(8),
        child: Image.network(url),
      ),
    );
  }
}
