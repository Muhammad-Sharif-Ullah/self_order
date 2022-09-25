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

class ComboScreenViewOne extends GetView<ComboScreenControllertwo> {
  String id;
  ComboScreenViewOne({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<ComboScreenControllertwo>(ComboScreenControllertwo());
    controller.selectedProductId.value = id;
    print('selected combo is ${controller.selectedProductId.value}');
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                height: 200.h,
                decoration:
                    BoxDecoration(color: ColorConstants.bannerPrimaryColor),
                child: const Image(
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
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customDesire(
                        imageName: const Image(
                          image: AssetImage("assets/images/small_type.png"),
                        ),
                        type: 'small',
                        flag: 's'),
                    customDesire(
                        imageName: const Image(
                          image: AssetImage("assets/images/medium_type.png"),
                        ),
                        type: 'medium',
                        flag: 'm'),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customDesire(
                        imageName: const Image(
                          image: AssetImage("assets/images/large_type.png"),
                        ),
                        type: 'large',
                        flag: 'l'),
                    customDesire(
                        imageName: const Image(
                          image: AssetImage("assets/images/large_type.png"),
                        ),
                        type: 'Extra Large',
                        flag: 'el')
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: CustomWidget.CustomPrimaryButton(
                          title: 'Back',
                          borderradius: 11.0,
                          backgroundcolor: Colors.transparent,
                          titlecolor: const Color(0xFF505050),
                          borderColor: const Color(0xFF505050),
                          height: 60.0,
                          width: 320.0),
                    ),
                    CustomWidget.CustomPrimaryButton(
                        title: 'Cancel Combo',
                        borderradius: 11.0,
                        backgroundcolor: Colors.transparent,
                        titlecolor: ColorConstants.redButtonColor,
                        borderColor: ColorConstants.redButtonColor,
                        height: 60.0,
                        width: 320.0),
                  ],
                ),
              ),
              const SizedBox(
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
          const SizedBox(
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
