import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:literact/components/books_stream.dart';
import 'package:literact/constants.dart';

Firestore _firestore = Firestore.instance;
FirebaseUser loggedUser;

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Stream bookstream = _firestore.collection(kbookCollection).snapshots();
    return BookStream(bookstream);
  }
}
