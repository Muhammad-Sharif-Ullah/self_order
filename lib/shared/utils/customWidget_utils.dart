import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';

class CustomWidget {
  static CustomButton({required String text, required Color color}) {
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
        child: Text(
          text,
          style: TextStyle(
              fontSize: Dimensions.TextSize20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static CustomImageButton(
      {required String text, required Color color, required Image image}) {
    return Container(
      height: 90,
      width: 250,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Dimensions.BorderRadius10),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Row(
          children: [
            image,
            Spacer(),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  static CustomButtonInImage({required String text, required onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 70,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorConstants.primaryButtonColor,
            ),
            child: Center(
                child: Text(
              'Eat in',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: Dimensions.TextSize18,
                  color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }

  static CustomItemwithPrice({ Function ? onTap }) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 15.0,
      childAspectRatio: 0.6,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(15, (index) {
        return GestureDetector(
          onTap: onTap != null ? onTap() : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("assets/images/item.png"),
              ),
              SizedBox(height: Dimensions.SizedBoxValue20,),
              Text(
                'Chicken Burger',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.TextSize20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Chicken Burger',
                style: TextStyle(
                    color: ColorConstants.primaryBigTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.TextSize18),
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue25,
              ),
              Row(
                children: [
                  Text('\$9.00',style: TextStyle(color: ColorConstants.primaryBigTextColor,fontWeight: FontWeight.bold,fontSize: Dimensions.TextSize18),),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(FeatherIcons.plus),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
