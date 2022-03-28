import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../shared/constants/Dimensions.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/customWidget_utils.dart';

itemCustomiseDialog({context}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  Dimensions.BorderRadius10)), //this right here
          child: Container(
            width: Dimensions.width654,
            height: Dimensions.height550,
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.SizedBoxValue30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.SizedBoxValue30),
                  child: Row(
                    children: [
                      Text(
                        'Customise your Burger',
                        style: TextStyle(
                            color: ColorConstants.primaryButtonColor,
                            fontSize: Dimensions.TextSize30),
                      ),
                      Spacer(),
                      CustomWidget.CustomCloseSection(context: context),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: Row(
                    children: [
                      Container(
                        height: Dimensions.height90,
                        width: Dimensions.width100,
                        child: Center(
                          child: Image(
                            image: AssetImage("assets/images/item.png"),
                            height: Dimensions.height90,
                            width: Dimensions.width90,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Beef Burger',
                            style: TextStyle(
                                color: ColorConstants.primaryBigTextColor,
                                fontSize: Dimensions.TextSize18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: Dimensions.SizedBoxValue2,
                          ),
                          Text(
                            'Beef with cheese',
                            style: TextStyle(
                                color: ColorConstants.primaryBigTextColor,
                                fontSize: Dimensions.TextSize18,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        'Total:  \$18.36',
                        style: TextStyle(
                            fontSize: Dimensions.TextSize20,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.primaryBigTextColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.SizedBoxValue30,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: Container(
                    //color: Colors.red,
                    height: Dimensions.height250,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 70),
                          child: Column(
                            children: [
                              Container(
                                height: Dimensions.height70,
                                width: Dimensions.width130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      ColorConstants.customizeBackgroundColor,
                                ),
                                child: Image(
                                  image: AssetImage("assets/images/meat.png"),
                                  height: Dimensions.height60,
                                  width: Dimensions.width110,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.SizedBoxValue15,
                              ),
                              Text(
                                'Fried Egg',
                                style: TextStyle(
                                  fontSize: Dimensions.TextSize20,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.SizedBoxValue15,
                              ),
                              Text(
                                '\$0.36',
                                style: TextStyle(
                                    color:
                                        ColorConstants.bannerHeadingTextColor,
                                    fontSize: Dimensions.TextSize20),
                              ),
                              SizedBox(
                                height: Dimensions.SizedBoxValue15,
                              ),
                              CustomWidget.ItemCountSection(),
                              SizedBox(
                                height: Dimensions.SizedBoxValue30,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                CustomWidget.CustomAddtoCartButton(
                    height: Dimensions.height60 * 1.0,
                    width: Dimensions.width579,
                    context: context,
                    ontap: () {
                      WidgetsBinding.instance?.addPostFrameCallback((_){
                      //  Get.to(CartScreen());
                      });

                    }),
              ],
            ),
          ),
        );
      });
}
