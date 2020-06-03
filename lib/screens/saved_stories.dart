import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:literact/components/books_stream.dart';
import 'package:literact/model/app_data.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

FirebaseUser loggedUser;
Firestore _firestore = Firestore.instance;

class Stories extends StatefulWidget {
  static String id = 'Stories';

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    Stream bookstream = _firestore
        .collection(kbookCollection)
        .where('saves',
            arrayContains: '${Provider.of<AppData>(context).user.uid}')
        .orderBy('titulo', descending: true)
        .snapshots();
    return BookStream(bookstream);
  }
}
