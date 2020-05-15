import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'file:///C:/Users/caiof/StudioProjects/FlutterProjects/literact/lib/components/profile_avatar.dart';

class Profile extends StatefulWidget {
  static String id = 'Profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Color stroke = Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;
    return Container(
      child: Column(
        children: <Widget>[
          ProfileAvatar(
            url: 'https://instagram.fcgh16-1.fna.fbcdn.net/v/t51.2885-19/s320x320/81252612_2482563102025209_5766338480753868800_n.jpg?_nc_ht=instagram.fcgh16-1.fna.fbcdn.net&_nc_ohc=HMzs6GNoIHEAX9bONWB&oh=7cc0370e01969f348508d6919065ed81&oe=5EE790DD',),
          Text(
            'Caio Alves Ferreira',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.deepPurple.withOpacity(0.50)
                          ],
                        ),
                        border: Border.all(
                            color: stroke, width: 1, style: BorderStyle.solid)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Icon(Feather.book),
                          Text(
                            'Adicionar autor'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.purple.withOpacity(0.50)
                          ],
                        ),
                        border: Border.all(
                            color: stroke, width: 1, style: BorderStyle.solid)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Feather.book,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Adicionar obra'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
