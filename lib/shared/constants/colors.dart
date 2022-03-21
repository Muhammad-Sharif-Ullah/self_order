import 'package:flutter/material.dart';

class ColorConstants
{


  static Color primaryButtonColor = hexToColor("#5AB99D");
  static Color bannerPrimaryColor = hexToColor("#EDEDED");
  static Color bannerHeadingTextColor = hexToColor("#FF8A21");
  static Color bannerBackgroundColor = hexToColor("#EDEDED");
  static Color secondaryTextColor = hexToColor("#24242480");
  static Color textFormFieldUnderlineColor = hexToColor("#EDEDED");
  static Color videoScreenButtonColor = hexToColor("#AA7459");
  static Color primaryBigTextColor = hexToColor("#505050");
  static Color borderColor = hexToColor("#00000000");
  static Color customizeBackgroundColor = hexToColor("#F7F7F7");



}
Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}