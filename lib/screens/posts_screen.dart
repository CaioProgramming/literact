import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String url =
      'https://images-na.ssl-images-amazon.com/images/I/81teJj758pL.jpg';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
    BookCard(
      bookdescription:
          'Brás Cubas está morto. Mas isso não o impede de relatar em seu livro os acontecimentos de sua existência e de sua grande ideia fixa: lançar o Emplasto Brás Cubas. Deus te livre, leitor, de uma ideia fixa. O medicamento anti-hipocondríaco torna-se o estopim de uma série de lembranças, reminiscências e digressões da vida do defunto autor',
      bookname: 'Memórias póstumas de Brás Cubas',
      authorname: 'Machado de Assis',
      authorpic:
          'https://s2.glbimg.com/Ecj1Ne9SZuc5gQzJC44S96yPUhk=/e.glbimg.com/og/ed/f/original/2019/05/17/machado_de_assis_real.jpg',
    ),
    BookCard(
      authorpic:
          'https://ditirambospoesia.files.wordpress.com/2012/06/25c325a1lvaresdeazevedo.jpg?w=223',
      authorname: 'Álvares de Azevedo',
      bookname: 'Noite na taverna',
      bookdescription:
          'Noite na Taverna Noite na Taverna reúne contos fantásticos, retratando as influências de uma época marcada por Byron e Musset. Entre uma baforada e um gole de vinho, as personagens narram fatos macabros e sombrios de seu passado.',
    ),
    BookCard(
      authorpic:
          'https://upload.wikimedia.org/wikipedia/commons/4/4e/Aluisio_Azevedo.jpg',
      authorname: 'Aluísio de Azevedo',
      bookname: 'O cortiço',
      bookdescription:
          '"O Cortiço" é um romance com características do movimento naturalista. É uma das obras mais importantes desse movimento, pois denuncia que, diante de um ambiente degradado, as pessoas às vezes comportam-se como animais. Isso é mostrado por meio do ambiente no qual o romance se passa: um cortiço, onde pessoas vivem aglomeradas, e também por meio das ações de seus personagens. O divertido enredo denuncia também os problemas sociais existentes no século XIX (muitos deles ainda existentes no século XXI), como pobreza, adultério, corrupção, formação de moradias em lugares inapropriados, e apresenta a maneira como as pessoas desses conglomerados viviam, explorados por alguém.',
    ),
      ],
    );
  }
}

class BookCard extends StatelessWidget {
  final String authorpic, authorname, bookname, bookdescription;

  BookCard(
      {@required this.authorpic,
      @required this.authorname,
      @required this.bookname,
      @required this.bookdescription});

  @override
  Widget build(BuildContext context) {
    Color stroke = Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(authorpic),
                radius: 20,
                backgroundColor: Colors.grey.withOpacity(0.25),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  authorname,
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
              border: Border.all(
                  color: stroke, width: 1, style: BorderStyle.solid)),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(onPressed: () {}, icon: Icon(FontAwesome5.bookmark,color: Colors.black,),),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 2,right: 2,),
                child: Column(
                  children: <Widget>[
                    Text(
                      bookname,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
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
                      bookdescription,
                      textAlign: TextAlign.justify,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'No dia que a universidade me deu um diploma e uma ciência que estava longe de carregar no cérebro. Confesso que me senti ao mesmo tempo enganado e orgulhoso.',
                              style: TextStyle(
                                  backgroundColor: Colors.black,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'No dia que a universidade me deu um diploma e uma ciência que estava longe de carregar no cérebro. Confesso que me senti ao mesmo tempo enganado e orgulhoso.',
                              style: TextStyle(
                                  backgroundColor: Colors.black,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'No dia que a universidade me deu um diploma e uma ciência que estava longe de carregar no cérebro. Confesso que me senti ao mesmo tempo enganado e orgulhoso.',
                              style: TextStyle(
                                  backgroundColor: Colors.black,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                   ],

                ),
              ),
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(AntDesign.download,color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
