import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:self_order/modules/combo_screen_two/controller/combo_screen_two_logic.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

class ComboDrinkMenu extends StatefulWidget {
  const ComboDrinkMenu({Key? key}) : super(key: key);

  @override
  State<ComboDrinkMenu> createState() => _ComboDrinkMenuState();
}

class _ComboDrinkMenuState extends State<ComboDrinkMenu> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(Get.context!).orientation;
    var controller = Get.find<ComboScreenControllertwo>();
    controller.getDrinks();
    return Obx(
      () => Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Text('Choose a Drinks'),
            SizedBox(
              height: 30.h,
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: controller.drinkList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 200.h,
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 4 : 5),
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    child: Container(
                        height: 270,
                        alignment: Alignment(0, 0),
                        color: Colors.white,
                        child: CustomWidget.CustomComboPackItem(
                            context: context,
                            menu: controller.drinkList[index])),
                  );
                })
          ],
        ),
      ),
    );
  }
}
