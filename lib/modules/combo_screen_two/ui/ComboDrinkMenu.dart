import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:self_order/modules/combo_screen_two/controller/combo_screen_two_logic.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
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
        margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
        child: ListView(
          children: [
            Text(
              'Choose a Drinks',
              style: TextStyle(fontSize: Dimensions.TextSize25),
            ),
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
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.selectedDrinkId.value =
                          controller.drinkList[index]['id'];
                      controller.selectedDrink.value =
                          controller.drinkList[index];
                    },
                    child: Container(
                        height: 270,
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
