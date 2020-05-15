import 'package:flutter/material.dart';
import 'package:literact/components/author_avatar.dart';
import 'package:literact/model/author.dart';

class AuthorHeader extends StatelessWidget {
  final Author author;

  AuthorHeader({this.author});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AuthorAvatar(url: author.picUrl),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            author.name,
            style: TextStyle(fontSize: 25),
          ),
        )
      ],
    );
  }
}
