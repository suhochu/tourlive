import 'package:flutter/material.dart';

ButtonStyle elevatedButtonStyle(
  Size size, {
  double flex = 1,
  double height = 60,
  double fontSize = 18.0,
  bool toggled = false,
  Color color = const Color(0xffff5a5f),
  double padding = 10.0,
}) {
  return ElevatedButton.styleFrom(
    minimumSize: Size(size.width * 0.8 * flex, height),
    primary: toggled ? Colors.white : color,
    onSurface: const Color(0xffff5a5f),
    elevation: 0,
    side: toggled ? const BorderSide(color: Color(0xffff5a5f)) : null,
    textStyle: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
    padding: EdgeInsets.symmetric(vertical: padding),
  );
}
