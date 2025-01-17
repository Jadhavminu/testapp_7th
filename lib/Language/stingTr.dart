import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TranslateText extends StatelessWidget {
  final String text;
  const TranslateText(
      this.text, {
        super.key, required TextStyle style,
      });

  @override
  Widget build(BuildContext context) {
    return Text(text.tr);
  }
}