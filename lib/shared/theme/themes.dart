import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:self_order/shared/constants/colors.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    buttonColor: ColorConstants.primaryButtonColor,

  );
  final darkTheme = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
  );
}
