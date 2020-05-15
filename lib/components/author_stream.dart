import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:literact/components/author_header.dart';
import 'package:literact/model/author.dart';

class AuthorStream extends StatelessWidget {
  final Stream authorstream;
  final String authorID;

  AuthorStream({this.authorstream, this.authorID});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: authorstream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final author = snapshot.data;
          return AuthorHeader(
              author:
                  Author.mapToAuthor(author.data, snapshot.data.documentID));
        } else {
          return Container();
        }
      },
    );
  }
}
