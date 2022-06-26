import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/modules/combo_screen_two/controller/combo_screen_two_logic.dart';
import 'package:self_order/modules/combo_screen_two/ui/combo_screen_two_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../base_widget.dart';
import '../controller/combo_screen_one_logic.dart';

class ComboScreenViewOne extends GetView<ComboScreenControllertwo> {
  String? id;
  ComboScreenViewOne({Key? key, String? id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<ComboScreenControllertwo>(ComboScreenControllertwo());
    // controller.selectedCombo.value = id;
    // print('selected combo is ${controller.selectedCombo.value}');
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              Container(
                height: 200.h,
                decoration:
                    BoxDecoration(color: ColorConstants.bannerPrimaryColor),
                child: Image(
                  image: AssetImage("assets/images/combobg.png"),
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Choose your desire',
                style: TextStyle(
                    color: ColorConstants.primaryBigTextColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customDesire(
                        imageName: Image(
                          image: AssetImage("assets/images/small_type.png"),
                        ),
                        type: 'small',
                        flag: 's'),
                    customDesire(
                        imageName: Image(
                          image: AssetImage("assets/images/medium_type.png"),
                        ),
                        type: 'medium',
                        flag: 'm'),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customDesire(
                        imageName: Image(
                          image: AssetImage("assets/images/large_type.png"),
                        ),
                        type: 'large',
                        flag: 'l'),
                    customDesire(
                        imageName: Image(
                          image: AssetImage("assets/images/large_type.png"),
                        ),
                        type: 'Extra Large',
                        flag: 'el')
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: CustomWidget.CustomPrimaryButton(
                          title: 'Back',
                          borderradius: 11.0,
                          backgroundcolor: ColorConstants.bannerBackgroundColor,
                          height: 60.0,
                          width: 320.0),
                    ),
                    Spacer(),
                    CustomWidget.CustomPrimaryButton(
                        title: 'Cancel Combo',
                        borderradius: 11.0,
                        backgroundcolor: ColorConstants.redButtonColor,
                        height: 60.0,
                        width: 320.0),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  customDesire({imageName, type, flag}) {
    return GestureDetector(
      onTap: () {
        controller.selectedSize.value = flag;
        Get.to(ComboScreenViewTwo());
      },
      child: Column(
        children: [
          Container(
              height: 167,
              width: 208,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: flag == controller.selectedSize
                    ? ColorConstants.selectedDesire
                    : ColorConstants.unselectedDesire,
              ),
              child: imageName),
          SizedBox(
            height: 15,
          ),
          Text(
            type,
            style: TextStyle(
                color: ColorConstants.primaryBigTextColor, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
