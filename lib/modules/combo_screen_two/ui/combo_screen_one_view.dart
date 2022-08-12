import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:self_order/modules/base_widget.dart';
import 'package:self_order/modules/combo_screen_two/controller/combo_screen_two_logic.dart';

import '../../../shared/constants/colors.dart';
import 'combo_screen_two_view.dart';

class ComboScreenViewOne extends StatefulWidget {
  var id;
  ComboScreenViewOne({Key? key, this.id}) : super(key: key);

  @override
  State<ComboScreenViewOne> createState() => _ComboScreenViewOneState();
}

class _ComboScreenViewOneState extends State<ComboScreenViewOne> {
  ComboScreenControllertwo controller = Get.put(ComboScreenControllertwo());
  @override
  Widget build(BuildContext context) {
    controller.selectedProductId.value = widget.id;
    controller.getAllCombo();
    final orientation = MediaQuery.of(Get.context!).orientation;
    return BaseWidget(
      builder: (context, sizingInformation) => Scaffold(
        body: Obx(
          () => Column(
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
              Container(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.comboList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        mainAxisExtent: 200.h,
                        crossAxisCount:
                            (orientation == Orientation.portrait) ? 2 : 4),
                    itemBuilder: (context, index) {
                      return customDesire(
                          imageUrl: controller.comboList[index]['base_url'] +
                              controller.comboList[index]['label_image'],
                          price: controller.comboList[index]['price'],
                          size: controller.comboList[index]['size']);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  customDesire({imageUrl, price, size}) {
    return GestureDetector(
      onTap: () {
        controller.selectedSize.value = size;
        Get.to(ComboScreenViewTwo());
      },
      child: Column(
        children: [
          Container(
              height: 167,
              width: 208,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: size == controller.selectedSize
                    ? ColorConstants.selectedDesire
                    : ColorConstants.unselectedDesire,
              ),
              child: CachedNetworkImage(imageUrl: imageUrl)),
          SizedBox(
            height: 15,
          ),
          Text(
            '+' + price,
            style: TextStyle(
                color: ColorConstants.primaryBigTextColor, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
