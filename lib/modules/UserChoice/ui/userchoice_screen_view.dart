import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter/material.dart';
import 'package:self_order/modules/Home/ui/home_screen_view.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../base_widget.dart';
import '../controller/userchoice_screen_logic.dart';

class UserChoiceScreen extends GetView<UserChoiceController> {
  const UserChoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<UserChoiceController>(UserChoiceController());
    return BaseWidget(
      builder: (context, sizingInformation) => Scaffold(
        body: Container(
          child: Stack(
            children: [
              Image(image: AssetImage("assets/images/userchoice.png")),
              Positioned(
                top: 70,
                left: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Welcome to Perkins fast ordering',
                        style: TextStyle(color: ColorConstants.primaryBigTextColor, fontSize: 40,fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40,),
                    Image(image: AssetImage("assets/images/logo.png"),height: 150,)

                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                left: 25,
                right: 25,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: Row(
                        children: [
                          Text(
                            "Where you’ll be eating today",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: ColorConstants.primaryBigTextColor,
                                fontSize: 40),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image(
                            image: AssetImage("assets/images/smallburger.png"),
                            height: 65,
                            width: 65,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(HomeScreen(),transition: Transition.fade);
                      },
                      child: Row(
                        children: [
                          CustomWidget.CustomImageButton(
                            color: Theme.of(context).buttonColor,
                            image: Image(
                              image: AssetImage("assets/images/frame1.png"),
                              height: 50,
                              width: 60,
                            ),
                            text: 'Eat in',
                          ),
                          SizedBox(
                            width: 250,
                          ),
                          CustomWidget.CustomImageButton(
                            color: Theme.of(context).buttonColor,
                            image: Image(
                              image: AssetImage("assets/images/frame1.png"),
                              height: 50,
                              width: 60,
                            ),
                            text: 'Take Out',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
