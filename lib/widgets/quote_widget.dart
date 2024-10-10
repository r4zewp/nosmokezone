// lib/widgets/quote_widget.dart
import 'package:flutter/material.dart';
import 'dart:math';
import '../utils/constants.dart';

class QuoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final random = Random();
    final quote = Constants.motivationalQuotes[
        random.nextInt(Constants.motivationalQuotes.length)];

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        quote,
        style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      ),
    );
  }
}
