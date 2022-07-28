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
                  child: Container(
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
                                            fontSize: Dimensions.TextSize20,
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
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
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
                                      print('sub cat' +
                                          controller.subCategories[index]
                                              ['subcat_id']);
                                      controller.getSubSubCategory(controller
                                          .subCategories[index]['subcat_id']);
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
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 20.h, bottom: 20.h),
                                  color: ColorConstants.subCategorySelection,
                                  height: 2,
                                  width: double.infinity),
                              GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 4,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: 5,
                                children: List.generate(
                                    controller.subSubCategories.length,
                                    (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      print('sub sub cat' +
                                          controller.subSubCategories[index]
                                              ['sub_subcat_id']);
                                      controller.subSubCatProduct(
                                          controller.subSubCategories[index]
                                              ['sub_subcat_id']);
                                    },
                                    child: foodVarision(
                                      active: (controller.subSubCategoryId ==
                                              controller.subSubCategories[index]
                                                  ['sub_subcat_id'])
                                          ? true
                                          : false,
                                      text:
                                          '${controller.subSubCategories[index]['sub_subcategory_name']}',
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
                                                  mainAxisExtent: 230.h,
                                                  crossAxisCount:
                                                      (orientation ==
                                                              Orientation
                                                                  .portrait)
                                                          ? 4
                                                          : 5),
                                          physics: ScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            controller.getFood(index);
                                            return GestureDetector(
                                              onTap: () {
                                                userChoiceDialog(
                                                    context: context);
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
                                                                "assets/images/bannerImage.png")),
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
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          Dimensions.TextSize20,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${controller.foods[index]['product_description']}',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: ColorConstants
                                                            .primaryBigTextColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: Dimensions
                                                            .TextSize18),
                                                  ),
                                                  SizedBox(
                                                    height: Dimensions
                                                        .SizedBoxValue25,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '\$${controller.foods[index]['product_price']}',
                                                        style: TextStyle(
                                                            color: ColorConstants
                                                                .primaryBigTextColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: Dimensions
                                                                .TextSize20),
                                                      ),
                                                      Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.08),
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
    return Row(
      children: [
        Container(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: active ? ColorConstants.subCategorySelection : Colors.white,
          ),
          child: Expanded(
            child: Text(
              text,
              maxLines: 2,
              style: TextStyle(
                  fontSize: 16.sp, color: active ? Colors.white : Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
