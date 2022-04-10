import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../Add_Sides/ui/add_side_screen_view.dart';
import '../../base_widget.dart';
import '../controller/combo_screen_two_logic.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ComboScreenViewTwo extends GetView<ComboScreenControllertwo> {
  int itemtype;
  ComboScreenViewTwo({Key? key, required this.itemtype}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<ComboScreenControllertwo>(ComboScreenControllertwo());
    //Get.find<ComboScreenControllertwo>();
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("assets/images/combobg.png"),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: CustomWidget.CustomComboPackName(
                    img: Image(
                      image: AssetImage("assets/images/large_type.png"),
                      height: 79,
                      width: 119,
                    ),
                    flag: itemtype,
                    context: context),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: Text(
                    'Choose a Burger',
                    style: TextStyle(
                        color: ColorConstants.primaryBigTextColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  )),
              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.SizedBoxValue30),
                child: Container(
                  height: 30,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: selectedfoodVarision(
                              text: 'pizza', index: index));
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
                    children: controller.count.map((i) {
                      return Container(
                          height: 270,
                          alignment: Alignment(0, 0),
                          color: Colors.white,
                          child: CustomWidget.CustomComboPackItem(
                            context: context,
                            image: Image(
                              image: AssetImage("assets/images/item.png"),
                            ),
                          ));
                    }).toList()),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CustomWidget.CustomPrimaryButton(
                          context: context,
                          width: 320.0,
                          height: 60.0,
                          borderradius: 5.0,
                          backgroundcolor:
                              ColorConstants.textFormFieldUnderlineColor,
                          title: 'Cancel Order'),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(AddSidesScreen(
                          itemtype: itemtype,
                        ));
                      },
                      child: CustomWidget.CustomPrimaryButton(
                          context: context,
                          width: 320.0,
                          height: 60.0,
                          borderradius: 5.0,
                          backgroundcolor: ColorConstants.primaryButtonColor,
                          title: 'Confirm'),
                    )
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

  Widget selectedfoodVarision({required String text, required index}) {

    return Obx(() {
      return InkWell(
        onTap: () {
          controller.selectedFoodVersion.value = index;
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
    });

  }

  Widget foodDescription() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage("assets/images/item.png"),
          ),
          SizedBox(
            height: Dimensions.SizedBoxValue20,
          ),
          Text(
            'Chicken Burger',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.TextSize20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Chicken Burger',
            style: TextStyle(
                color: ColorConstants.primaryBigTextColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.TextSize18),
          ),
          SizedBox(
            height: Dimensions.SizedBoxValue25,
          ),
          Row(
            children: [
              Text(
                '\$9.00',
                style: TextStyle(
                    color: ColorConstants.primaryBigTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.TextSize18),
              ),
              SizedBox(
                width: 60,
              ),
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
      ),
    );
  }
}
