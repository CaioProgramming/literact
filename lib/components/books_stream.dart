import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:literact/components/bookcard.dart';
import 'package:literact/components/loading_text.dart';
import 'package:literact/model/app_data.dart';
import 'package:literact/model/book.dart';
import 'package:provider/provider.dart';

class BookStream extends StatefulWidget {
  final Stream bookstream;

  BookStream(this.bookstream);

  @override
  _BookStreamState createState() => _BookStreamState();
}

class _BookStreamState extends State<BookStream> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.bookstream,
      builder: (context, snapshot) {
        var appdata = Provider.of<AppData>(context);
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return BookCard(
                  book: getBook(snapshot.data.documents[index].data,
                      snapshot.data.documents[index].documentID));
            },
          );
        } else {
          return LoadTyping(repeat: true);
        }
      },
    );
  }

  Book getBook(Map<String, dynamic> map, String key) {
    return Book.mapToBook(map, key);
  }
}
