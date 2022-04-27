import 'package:flutter/material.dart';

InputDecoration textFieldDecoration(String title, {String hint = '', bool isDense = false, double padding = 20}) {
  return InputDecoration(
    border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    filled: false,
    labelText: title == '' ? null : title,
    contentPadding: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
    labelStyle: const TextStyle(color: Colors.grey),
    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xffff5a5f), width: 2.0)),
    hintText: hint == '' ? null : hint,
    hintStyle: const TextStyle(color: Colors.grey),
    isDense: isDense,

  );
}
