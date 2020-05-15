import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String url;
  final bool inversecolor;
  final bool smallimage;
  final bool needmargin;

  ProfileAvatar(
      {@required this.url,
      this.inversecolor = false,
      this.smallimage = true,
      this.needmargin = true});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(4),
        child: Image.network(url),
      ),
    );
  }
}
