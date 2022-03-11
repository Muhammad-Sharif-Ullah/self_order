import 'package:flutter/material.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';

class CustomWidget {
  static CustomButton({required String text}) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.primaryButtonColor,
        borderRadius: BorderRadius.circular(Dimensions.BorderRadius100),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.padding53,
            right: Dimensions.padding53,
            top: Dimensions.padding19,
            bottom: Dimensions.padding19),
        child: Text(text,style: TextStyle(fontSize: Dimensions.TextSize20,color: Colors.white, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
