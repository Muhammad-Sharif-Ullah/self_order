

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';

class CustomWidget {
  static CustomButton({required String text , required Color  color}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
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

  static CustomImageButton({required String text, required Color color,  required Image image}) {
    return Container(
      height: 90,
      width: 250,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Dimensions.BorderRadius10),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30,right: 30),
        child: Row(
          children: [
            image,
            Spacer(),
            Text(text,style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Colors.white),),
          ],
        ),
      ),

    );
    
  }
}
