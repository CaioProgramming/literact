import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'author.dart';
import 'book.dart';

class AppData extends ChangeNotifier {
  Firestore _firestore = Firestore.instance;
  FirebaseUser user;

  AppData(this.user);

  void setUser(FirebaseUser user) {
    this.user = user;
    notifyListeners();
  }

  Author getCurrentAuthor(String id) {
    _firestore
        .collection(kauthorCollection)
        .document(id)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        return Author.mapToAuthor(snapshot.data, snapshot.documentID);
      } else {
        print('no author founded');
        return null;
      }
    });
  }

  Future<String> saveBook(Book book) async {
    String msg = "Removido dos salvos";
    if (!book.saves.contains(user.uid)) {
      book.saves.add(user.uid);
    } else {
      book.saves.remove(user.uid);
    }
    return msg;
  }

  CollectionReference booksCollection() =>
      _firestore.collection(kbookCollection);
  CollectionReference authorCollection() =>
      _firestore.collection(kauthorCollection);
}
