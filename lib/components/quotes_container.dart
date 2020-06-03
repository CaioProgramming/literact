import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:literact/main.dart';

class QuotesContainer extends StatelessWidget {
  final String citacao;

  QuotesContainer(this.citacao);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Text(
        '"$citacao"',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: MyApp.getTextColor(context),
            fontSize: 14,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
