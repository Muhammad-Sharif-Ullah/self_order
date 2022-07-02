import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:self_order/modules/combo_screen_two/controller/combo_screen_two_logic.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

class ComboSideMenu extends StatefulWidget {
  ComboSideMenu({Key? key}) : super(key: key);

  @override
  State<ComboSideMenu> createState() => _ComboSideMenuState();
}

class _ComboSideMenuState extends State<ComboSideMenu> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(Get.context!).orientation;
    var controller = Get.find<ComboScreenControllertwo>();
    controller.getSide();
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Obx(
        () => ListView(
          children: [
            Text(
              'Choose a Sides',
              style: TextStyle(fontSize: 30.sp),
            ),
            SizedBox(
              height: 30,
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: controller.sideList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 200.h,
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 4 : 5),
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      height: 270,
                      alignment: Alignment(0, 0),
                      color: Colors.white,
                      child: CustomWidget.CustomComboPackItem(
                          context: context, menu: controller.sideList[index]));
                })
          ],
        ),
      ),
    );
  }
}
