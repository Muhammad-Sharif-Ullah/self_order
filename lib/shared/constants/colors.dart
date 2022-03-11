import 'package:flutter/material.dart';

class ColorConstants
{
  static Color backgroundColor = hexToColor("#181716");
  static Color textFormFieldUnderlineColor = hexToColor("#AAAAAA");
  static Color primaryButtonColor = hexToColor("#40CC6F");



}
Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}