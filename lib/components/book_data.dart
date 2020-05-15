import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:literact/model/Author.dart';
import 'package:literact/model/book.dart';

import '../constants.dart';

class BookData {
  Book book;

  Future<Author> fetchAuthor() async {
    Author author;
    var document = Firestore.instance
        .collection(kauthorCollection)
        .document(book.authorID);
    document.get().then((document) {
      return Author.convertMap(document.data, document.documentID);
    }).catchError((error) {
      print('Error to fetch author $error');
    });
    return author;
  }
}
