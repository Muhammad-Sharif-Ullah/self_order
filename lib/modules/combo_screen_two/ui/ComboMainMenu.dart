import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:self_order/modules/combo_screen_two/controller/combo_screen_two_logic.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

class ComboMainMenu extends StatefulWidget {
  const ComboMainMenu({Key? key}) : super(key: key);

  @override
  State<ComboMainMenu> createState() => _ComboMainMenuState();
}

class _ComboMainMenuState extends State<ComboMainMenu> {
  var controller = Get.put(ComboScreenControllertwo());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.SizedBoxValue30),
              child: Container(
                height: 30,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(right: 15),
                        child:
                            selectedfoodVarision(text: 'pizza', index: index));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: ResponsiveGridList(
                  desiredItemWidth: 147,
                  minSpacing: 35,
                  children: controller.comboList.map((i) {
                    i['selected'] = false;
                    return InkWell(
                      onTap: () {
                        print('i si $i');
                        Get.defaultDialog(content: selectComboOption());
                      },
                      child: Container(
                          height: 270,
                          alignment: Alignment(0, 0),
                          color: Colors.white,
                          child: CustomWidget.CustomComboPackItem(
                            context: context,
                            menu: i,
                          )),
                    );
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectComboOption() {
    return Container(
        height: 400.h,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Choose an Item - Burger'),
            SizedBox(
              height: 30,
            ),
            ResponsiveGridList(
                desiredItemWidth: 147,
                minSpacing: 35,
                children: controller.comboList.map((i) {
                  i['selected'] = false;
                  return InkWell(
                    onTap: () {},
                    child: Container(
                        height: 270,
                        alignment: Alignment(0, 0),
                        color: Colors.white,
                        child: CustomWidget.CustomComboPackItem(
                          context: context,
                          menu: i,
                        )),
                  );
                }).toList()),
            Container(
              decoration: BoxDecoration(color: Color(0xFF5AB99D)),
              width: double.infinity,
              padding: EdgeInsets.all(15),
              child: Text(
                'Add',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
          ],
        ));
  }

  Widget selectedfoodVarision({required String text, required index}) {
    return InkWell(
      onTap: () {
        controller.selectedFoodVersion = index;
      },
      child: Container(
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: controller.selectedFoodVersion == index
              ? ColorConstants.bannerHeadingTextColor
              : Colors.white,
          border: Border.all(
              color: controller.selectedFoodVersion == index
                  ? ColorConstants.bannerHeadingTextColor
                  : ColorConstants.borderColor.withOpacity(0.2),
              width: 3),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
