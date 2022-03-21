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

  static CustomItemwithPrice({ Tap}) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 15.0,
      childAspectRatio: 0.6,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(15, (index) {
        return GestureDetector(
          onTap: Tap!= null ? Tap : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("assets/images/item.png"),
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue20,
              ),
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
                  Text(
                    '\$9.00',
                    style: TextStyle(
                        color: ColorConstants.primaryBigTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.TextSize18),
                  ),
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

  static CustomCloseSection({required BuildContext context}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 50,
        width: 50,
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 40,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: ColorConstants.primaryBigTextColor.withOpacity(0.2),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                  color: ColorConstants.primaryBigTextColor.withOpacity(.15),
                  blurRadius: 0.2,
                  offset: Offset(1, 1))
            ]),
      ),
    );
  }

  static ItemCountSection() {
    return Row(
      children: [
        Container(
            height: 24,
            width: 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.white,
                border: Border.all(color: ColorConstants.primaryBigTextColor)),
            child: Icon(
              FeatherIcons.minus,
              size: Dimensions.TextSize15,
              color: ColorConstants.primaryBigTextColor,
            )),
        SizedBox(
          width: Dimensions.SizedBoxValue25,
        ),
        Text(
          '2',
          style: TextStyle(
              fontSize: Dimensions.TextSize30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: Dimensions.SizedBoxValue25,
        ),
        Container(
            height: 24,
            width: 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: ColorConstants.bannerHeadingTextColor,
                border:
                    Border.all(color: ColorConstants.bannerHeadingTextColor)),
            child: Icon(
              FeatherIcons.plus,
              size: Dimensions.TextSize15,
              color: Colors.white,
            )),
      ],
    );
  }

  static CustomcustomiseButton({height, width, context, onTap})
  {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>( RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
            backgroundColor: MaterialStateProperty.all(ColorConstants.bannerHeadingTextColor)
        ),
        child: Text('Customise',style: TextStyle(fontSize: Dimensions.TextSize30),),
      ),
    );
  }
  static CustomAddtoCartButton({height, width , context, ontap}) {
    return SizedBox(
      height: height,
      width: width ,
      child: ElevatedButton(
       onPressed: ontap!= null ? ontap : null,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),),
            backgroundColor: MaterialStateProperty.all(Theme.of(context).buttonColor)
        ),
        child: Text('Add to cart',style: TextStyle(fontSize: Dimensions.TextSize30),),
      ),
    );
  }
}
