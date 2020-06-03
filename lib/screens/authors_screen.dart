import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:literact/components/author_stream.dart';
import 'package:literact/constants.dart';

Firestore _firestore = Firestore.instance;

class AuthorsScreen extends StatefulWidget {
  static String id = 'AuthorsScreen';

  @override
  _AuthorsScreenState createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
  @override
  Widget build(BuildContext context) {
    Stream authorstream = _firestore.collection(kauthorCollection).snapshots();
    return AuthorStream(authorstream: authorstream);
  }
}
