import 'package:flutter/material.dart';

class ColorCustom {
  static Color white = HexColor("FFFFFF");
  static Color black50 = Colors.black.withOpacity(0.50);
  static Color white50 = const Color.fromRGBO(255, 255, 255, 0.5);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
