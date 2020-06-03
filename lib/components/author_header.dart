import 'package:flutter/material.dart';
import 'package:literact/components/author_avatar.dart';
import 'package:literact/model/author.dart';

class AuthorHeader extends StatelessWidget {
  final Author author;
  AuthorHeader(this.author);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        author.name,
      ),
      leading: AuthorAvatar(url: author.picUrl),
    );
  }
}
