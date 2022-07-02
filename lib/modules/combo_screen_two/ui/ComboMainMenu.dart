import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/modules/combo_screen_two/controller/combo_screen_two_logic.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import 'package:self_order/shared/widget/quantity_item.dart';

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
                    return GestureDetector(
                      onTap: () {
                        controller.selectedComboId.value = i['id'];
                        selectComboOption();
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

  selectComboOption() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          ItemScreenController controller = Get.find();
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Obx(
              () => Container(
                width: 656.w,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.SizedBoxValue30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Row(
                          children: [
                            Text(
                              'Choose a style',
                              style: TextStyle(
                                  color: ColorConstants.primaryButtonColor,
                                  fontSize: 30.sp),
                            ),
                            Spacer(),
                            CustomWidget.CustomCloseSection(context: context),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: (controller.menu['chrust'].length > 0)
                            ? GridView.builder(
                                itemCount: controller.menu['chrust'].length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 5,
                                        mainAxisExtent: 200.h,
                                        mainAxisSpacing: 5),
                                itemBuilder: (context, i) {
                                  return QuantityItem();
                                })
                            : Container(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomWidget.CustomPrimaryButton(
                          context: context,
                          height: 60.h,
                          width: 596.w,
                          borderColor: ColorConstants.primaryButtonColor,
                          title: 'Add',
                          titlecolor: Colors.white,
                          titlefontSize: 24.sp,
                          borderradius: 5,
                          backgroundcolor: ColorConstants.primaryButtonColor,
                          titleFontWeight: FontWeight.w700),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
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
