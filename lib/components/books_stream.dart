import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:literact/components/bookcard.dart';
import 'package:literact/components/loading_text.dart';
import 'package:literact/model/book.dart';

class BookStream extends StatelessWidget {
  final Stream bookstream;

  BookStream(this.bookstream);

  @override
  Widget build(BuildContext context) {
    List<Widget> bookWidgets = [];
    return StreamBuilder<QuerySnapshot>(
      stream: bookstream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bookWidgets.clear();
          final books = snapshot.data.documents;
          int i = 0;
          for (var book in books) {
            i++;
            bookWidgets.add(BookCard(
                book: Book.mapToBook(book.data, book.documentID),
                lastCard: i == books.length));
          }
          return ListView(
            children: bookWidgets,
          );
        } else {
          return LoadTyping(repeat: true);
        }
      },
    );
  }
}
