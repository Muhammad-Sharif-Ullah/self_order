import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/modules/ItemPage/ui/user_choice_dialog.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../base_widget.dart';
import '../controller/item_screen_logic.dart';

class ItemPageScreen extends GetView<ItemScreenController> {
  String id;
  String name;
  ItemPageScreen({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<ItemScreenController>(ItemScreenController());
    controller.getMainCategory();
    controller.getSubCategory(id);
    controller.getCategoryWiseProduct(id);
    final orientation = MediaQuery.of(Get.context!).orientation;
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image(
                      image: AssetImage("assets/images/itempag.png"),
                      height: 298,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: Dimensions.SizedBoxValue20,
                      right: Dimensions.SizedBoxValue15,
                      child: CustomWidget.CustomButtonInImage(
                          text: 'Eat in', onTap: () {}),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimensions.SizedBoxValue30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    '${name}',
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorConstants.primaryBigTextColor),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    child: Row(
                      children: [
                        /// ToDo: Do here///
                        Expanded(
                          flex: 2,
                          child: ListView.builder(
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 40.h),
                                child: Column(
                                  children: [
                                    Container(
                                      child: CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            Image(
                                                image: AssetImage(
                                                    "assets/images/item.png")),
                                        imageUrl: controller.categories[index]
                                                ['base_url'] +
                                            controller.categories[index]
                                                ['sub_image'],
                                        height: 70,
                                        width: 76,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 15.w,
                                          right: 15.w,
                                          top: 5.h,
                                          bottom: 5.h),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: (controller.categoryId.value ==
                                                  controller.categories[index]
                                                      ['id'])
                                              ? ColorConstants.primaryColor
                                              : Colors.transparent),
                                      child: Text(
                                        '${controller.categories[index]['category_name']}',
                                        style: TextStyle(
                                            fontSize: 16.h,
                                            color: (controller
                                                        .categoryId.value ==
                                                    controller.categories[index]
                                                        ['id'])
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Column(children: [
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 4,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 5,
                              children: List.generate(
                                  controller.subCategories.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    controller
                                        .getCategorySubCategoryWiseProduct(
                                            controller.subCategories[index]
                                                ['subcat_id']);
                                  },
                                  child: foodVarision(
                                    active: (controller.subCategoryId ==
                                            controller.subCategories[index]
                                                ['subcat_id'])
                                        ? true
                                        : false,
                                    text:
                                        '${controller.subCategories[index]['subcategory_name']}',
                                  ),
                                );
                              }),
                            ),
                            Flexible(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: Dimensions.SizedBoxValue30,
                                    ),
                                    GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.foods.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 20,
                                                // crossAxisSpacing: 20,
                                                crossAxisCount: (orientation ==
                                                        Orientation.portrait)
                                                    ? 3
                                                    : 4),
                                        physics: ScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              uerChoiceDialog(
                                                  context: context,
                                                  index: index);
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CachedNetworkImage(
                                                  width: 208.w,
                                                  height: 90.h,
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Image(
                                                          image: AssetImage(
                                                              "assets/images/item.png")),
                                                  imageUrl: controller
                                                              .foods[index]
                                                          ['base_url'] +
                                                      controller.foods[index]
                                                          ['product_image'],
                                                ),
                                                SizedBox(
                                                  height: Dimensions
                                                      .SizedBoxValue20,
                                                ),
                                                Text(
                                                  '${controller.foods[index]['name']}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Dimensions.TextSize20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '${controller.foods[index]['product_description']}',
                                                  style: TextStyle(
                                                      color: ColorConstants
                                                          .primaryBigTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Dimensions
                                                          .TextSize15),
                                                ),
                                                // SizedBox(
                                                //   height: Dimensions
                                                //       .SizedBoxValue25,
                                                // ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '\$${controller.foods[index]['product_price']}',
                                                      style: TextStyle(
                                                          color: ColorConstants
                                                              .primaryBigTextColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: Dimensions
                                                              .TextSize18),
                                                    ),
                                                    SizedBox(
                                                      width: 60,
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Icon(
                                                          FeatherIcons.plus),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            )

                            // CustomWidget.CustomItemwithPrice(Tap:userChoice(context: context) ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget foodVarision({required String text, required bool active}) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: active ? ColorConstants.subCategorySelection : Colors.white,
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16.h, color: active ? Colors.white : Colors.black),
      ),
    );
  }
}
