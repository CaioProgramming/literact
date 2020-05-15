import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:literact/components/author_stream.dart';
import 'package:literact/components/quotes_container.dart';
import 'package:literact/main.dart';
import 'package:literact/model/book.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

Firestore _firestore = Firestore.instance;

class BookCard extends StatefulWidget {
  final Book book;
  final bool lastCard;

  BookCard({@required this.book, this.lastCard = false});

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void openDownload() {
    print(widget.book.downloadUrl);
  }

  _launchURL() async {
    String url = widget.book.downloadUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Stream authorstream() => _firestore
      .collection(kauthorCollection)
      .document(widget.book.authorID)
      .snapshots();

  List<Widget> citacoes() {
    List<Widget> citations = [];
    print('${widget.book.quotes.length} citacoes');
    for (String cit in widget.book.quotes) {
      citations.add(QuotesContainer(cit));
    }
    return citations;
  }

  @override
  Widget build(BuildContext context) {
    Color stroke = MyApp.getCardBackColor(context);
    Border cardBorder() {
      if (widget.lastCard) {
        return Border(
          top: BorderSide(color: stroke, width: 8, style: BorderStyle.solid),
          left: BorderSide(color: stroke, width: 1.7, style: BorderStyle.solid),
          right:
              BorderSide(color: stroke, width: 1.7, style: BorderStyle.solid),
        );
      } else {
        return Border(
          bottom: BorderSide(color: stroke, width: 8, style: BorderStyle.solid),
          left: BorderSide(color: stroke, width: 1.7, style: BorderStyle.solid),
          right:
              BorderSide(color: stroke, width: 1.7, style: BorderStyle.solid),
        );
      }
    }

    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        decoration: BoxDecoration(
          border: cardBorder(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AuthorStream(
                authorID: widget.book.authorID, authorstream: authorstream()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesome5.bookmark,
                        color: MyApp.getTextColor(context),
                      ),
                    ),
                    IconButton(
                      onPressed: _launchURL,
                      icon: Icon(
                        Feather.download,
                        color: MyApp.getTextColor(context),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 2,
                    right: 2,
                  ),
                  child: Column(
                    children: <Widget>[
                      TypewriterAnimatedTextKit(
                        speed: Duration(seconds: 3),
                        isRepeatingAnimation: false,
                        text: [widget.book.title],
                        textStyle: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 300,
                        height: 10,
                        child: Divider(
                          thickness: 1,
                          color: stroke,
                        ),
                      ),
                      Text(
                        widget.book.description,
                        textAlign: TextAlign.justify,
                      ),
                      Center(
                          child: GridView.count(
                        crossAxisCount: 2,
                        children: citacoes(),
                        shrinkWrap: true,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
