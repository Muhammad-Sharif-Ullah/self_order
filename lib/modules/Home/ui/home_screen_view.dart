import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../shared/constants/colors.dart';
import '../../base_widget.dart';
import '../controller/home_screen_logic.dart';
import 'custom_delicious_food.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<HomeScreenController>(HomeScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image(image: AssetImage("assets/images/home.png")),
                    Positioned(
                      top: 10,
                      right: 15,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100)),
                        child: Text('Edit In'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Row(children: [
                    Text(
                      "Enjoy Delicious food",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.changeThemeMode(Get.isDarkMode
                            ? ThemeMode.light
                            : ThemeMode.dark);
                      },
                      child: Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 0.5),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 5, left: 5, right: 5, bottom: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.amber,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FeatherIcons.shoppingBag),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('2'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 30,
                ),
                customDeliciousFood(context: context),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorConstants.bannerBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Image(
                            image:
                                AssetImage("assets/images/bannerImage.png"),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Make your own COMBO!! 🍔 🍟 🍕',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: ColorConstants
                                        .bannerHeadingTextColor),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                      'Enjoy customise combo Food, Sides, Drink with few steps.')),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Container(
                                  height: 32,
                                  width: 161,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        color: ColorConstants
                                            .bannerHeadingTextColor),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Started',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        FeatherIcons.arrowRight,
                                        color: Colors.deepOrangeAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Enjoy Delicious food",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.6,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(10, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          Image(
                            image:
                                AssetImage("assets/images/smallburger.png"),
                          ),
                          Text(
                            'Chicken Burger',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            'Chicken Burger',
                            style: TextStyle(color: ColorConstants.primaryBigTextColor, fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(height: 25,),
                          Row(
                            children: [
                              Text('\$9.00'),
                              SizedBox(width: 60,),
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
                      );
                    }),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
