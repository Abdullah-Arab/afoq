
  import 'package:flutter/material.dart';

Color stringToColor(String colorString) {
    int value = int.parse(colorString, radix: 16);
    Color otherColor = Color(value);
    return otherColor;
  }