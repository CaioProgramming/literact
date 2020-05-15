import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:literact/main.dart';

class QuotesContainer extends StatelessWidget {
  final String citacao;

  QuotesContainer(this.citacao);

  @override
  Widget build(BuildContext context) {
    return Text(
      citacao,
      textAlign: TextAlign.center,
      style: TextStyle(
          backgroundColor: MyApp.getCardBackColor(context),
          color: MyApp.getCardTextColor(context),
          fontSize: 16,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500),
    );
  }
}
