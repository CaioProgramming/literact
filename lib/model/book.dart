import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:literact/model/author.dart';

import '../constants.dart';

class Book {
  String title, downloadUrl, authorID, description, id;
  List<String> quotes = [];
  List<String> saves = [];
  Author author;
  Book(
      {this.id = "",
      this.title = "",
      this.downloadUrl = "",
      this.authorID = "",
      this.description = "",
      this.quotes,
      this.saves,
      this.author});

  static Book mapToBook(Map<String, dynamic> map, String key) {
    print('converting map\n$map\nto Book');
    final String authorID = map['autor'].toString();
    final String title = map['titulo'].toString();
    final String description = map['descricao'].toString();
    final String downloadUrl = map['downloadurl'].toString();
    Author mapauthor;
    List<dynamic> maplist = map['quotes'];
    List<dynamic> savelist = map['saves'];
    final quotes = List<String>.from(maplist);
    final saves = List<String>.from(savelist);
    Firestore _firestore = Firestore.instance;
    _firestore
        .collection(kauthorCollection)
        .document(authorID)
        .get()
        .then((snapshot) {
      mapauthor = Author.mapToAuthor(snapshot.data, snapshot.documentID);
    }).whenComplete(() {
      print('map convert complete');
      return Book(
          id: key,
          quotes: quotes,
          downloadUrl: downloadUrl,
          description: description,
          title: title,
          authorID: authorID,
          saves: saves,
          author: mapauthor);
    });
  }

  Map<String, dynamic> getMap() {
    return {
      'titulo': this.title,
      'autor': this.authorID,
      'descricao': this.description,
      'downloadurl': this.downloadUrl,
      'quotes': this.quotes,
      'saves': this.saves
    };
  }
}
