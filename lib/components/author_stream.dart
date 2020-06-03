import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:literact/components/loading_text.dart';
import 'package:literact/main.dart';
import 'package:literact/model/author.dart';

class AuthorStream extends StatelessWidget {
  final Stream authorstream;

  AuthorStream({this.authorstream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: authorstream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: snapshot.data.documents.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return AuthorCard(Author.mapToAuthor(
                  snapshot.data.documents[index].data,
                  snapshot.data.documents[index].documentID));
            },
          );
        } else {
          return LoadTyping();
        }
      },
    );
  }
}

class AuthorCard extends StatelessWidget {
  final Author _author;
  AuthorCard(this._author);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: FadeInImage.assetNetwork(
              fit: BoxFit.fitWidth,
              width: double.maxFinite,
              placeholder: 'icons/logo.png',
              image: _author.picUrl,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            width: double.maxFinite,
            decoration: BoxDecoration(color: MyApp.getCardBackColor(context)),
            child: Text(
              _author.name,
              style: TextStyle(
                  color: MyApp.getCardTextColor(context),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
