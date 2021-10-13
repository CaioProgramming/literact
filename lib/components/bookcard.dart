import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:literact/components/author_header.dart';
import 'package:literact/components/quotes_container.dart';
import 'package:literact/main.dart';
import 'package:literact/model/app_data.dart';
import 'package:literact/model/author.dart';
import 'package:literact/model/book.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/book.dart';

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
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(1.5, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void openDownload() {
    print(widget.book.downloadUrl);
  }

  List<Widget> citacoes() {
    List<Widget> citations = [];
    print('${widget.book.quotes.length} citacoes');
    for (String cit in widget.book.quotes) {
      citations.add(QuotesContainer(cit));
    }
    return citations;
  }

  launchURL() async {
    String url = widget.book.downloadUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var appdata = Provider.of<AppData>(context);

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

    Future<Widget> header(String authorID) async {
      Author author = await appdata.getCurrentAuthor(authorID);
      if (author != null) {
        return AuthorHeader(author);
      } else {
        return Text('Autor não encontrado');
      }
    }

    Icon saveIcon() {
      if (widget.book == null) return Icon(FontAwesome5.bookmark);

      return Icon(
          widget.book.saves.contains(appdata.user.uid)
              ? FontAwesome5Solid.bookmark
              : FontAwesome5.bookmark,
          color: MyApp.getBackColor(context));
    }

    return SlideTransition(
      position: _offsetAnimation,
      child: Card(
        borderOnForeground: true,
        elevation: 3,
        child: Container(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 4,
                      right: 4,
                    ),
                    child: Column(
                      children: <Widget>[
                        AuthorHeader(widget.book.author),
                        TypewriterAnimatedTextKit(
                          speed: Duration(milliseconds: 500),
                          isRepeatingAnimation: false,
                          text: [widget.book.title],
                          textStyle: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w900),
                          alignment: AlignmentDirectional.topStart,
                        ),
                        Text(
                          widget.book.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Center(
                            child: ListView(
                          children: citacoes(),
                          shrinkWrap: true,
                        )),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                widget.book.saves.contains('')
                                    ? FontAwesome5.bookmark
                                    : FontAwesome5Solid.bookmark,
                                color: MyApp.getTextColor(context),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                launchURL();
                              },
                              icon: Icon(
                                Feather.download,
                                color: MyApp.getBackColor(context),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
