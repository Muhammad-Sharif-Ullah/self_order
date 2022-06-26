import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/modules/combo_screen_one/ui/combo_screen_one_view.dart';
import 'package:self_order/modules/combo_screen_two/ui/combo_screen_two_view.dart';
import '../../../shared/constants/Dimensions.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/customWidget_utils.dart';
import '../model/MenuModel.dart';
import 'item_customise_page.dart';
import 'item_customise_page.dart';

uerChoiceDialog({required BuildContext context, required index}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        ItemScreenController controller = Get.find();
        controller.getFood(index);
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Obx(
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
                            'Make your choice',
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
                      padding: EdgeInsets.symmetric(horizontal: 80.w),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: controller.foods[index]['base_url'] +
                                controller.foods[index]['combo_image'],
                            height: 158.h,
                            width: 212.w,
                          ),
                          SizedBox(width: 30.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.foods[index]['name'],
                                style: TextStyle(
                                    color: ColorConstants.primaryBigTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.sp),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                controller.foods[index]['product_description'],
                                style: TextStyle(
                                    color: ColorConstants.primaryBigTextColor
                                        .withOpacity(0.5),
                                    fontSize: 30.sp),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                controller.foods[index]['product_price'],
                                style: TextStyle(
                                    color: ColorConstants.bannerHeadingTextColor
                                        .withOpacity(0.5),
                                    fontSize: 30.sp),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80.w),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          (controller.foods[index]['chrust'].length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Chrust',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    GridView.builder(
                                        itemCount: controller
                                            .foods[index]['chrust'].length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 5,
                                                mainAxisExtent: 40,
                                                mainAxisSpacing: 5),
                                        itemBuilder: (context, i) {
                                          controller.foods[index]['chrust'][i]
                                              ['selected'] = false;
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: controller.foods[index]
                                                      ['chrust'][i]['selected'],
                                                  onChanged: (v) {
                                                    controller.foods[index]
                                                                ['chrust'][i]
                                                            ['selected'] =
                                                        !controller.foods[index]
                                                                ['chrust'][i]
                                                            ['selected'];
                                                  }),
                                              Text(
                                                  '${controller.foods[index]['chrust'][i]['name']}')
                                            ],
                                          );
                                        }),
                                  ],
                                )
                              : Container(),
                          (controller.foods[index]['toppings'].length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Toppings',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    GridView.builder(
                                        itemCount: controller
                                            .foods[index]['toppings'].length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 5,
                                                mainAxisExtent: 40,
                                                mainAxisSpacing: 5),
                                        itemBuilder: (context, i) {
                                          controller.foods[index]['toppings'][i]
                                              ['selected'] = false;
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: controller.foods[index]
                                                          ['toppings'][i]
                                                      ['selected'],
                                                  onChanged: (v) {
                                                    controller.foods[index]
                                                                ['toppings'][i]
                                                            ['selected'] =
                                                        !controller.foods[index]
                                                                ['toppings'][i]
                                                            ['selected'];
                                                  }),
                                              Text(
                                                  '${controller.foods[index]['toppings'][i]['name']}')
                                            ],
                                          );
                                        }),
                                  ],
                                )
                              : Container(),
                          (controller.foods[index]['style'].length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Style',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    GridView.builder(
                                        itemCount: controller
                                            .foods[index]['style'].length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 5,
                                                mainAxisExtent: 40,
                                                mainAxisSpacing: 5),
                                        itemBuilder: (context, i) {
                                          controller.foods[index]['style'][i]
                                              ['selected'] = false;
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: controller.foods[index]
                                                      ['style'][i]['selected'],
                                                  onChanged: (v) {
                                                    controller.foods[index]
                                                                ['style'][i]
                                                            ['selected'] =
                                                        !controller.foods[index]
                                                                ['style'][i]
                                                            ['selected'];
                                                  }),
                                              Text(
                                                  '${controller.foods[index]['style'][i]['name']}')
                                            ],
                                          );
                                        }),
                                  ],
                                )
                              : Container(),
                          (controller.foods[index]['sauce'].length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sauce',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    GridView.builder(
                                        itemCount: controller
                                            .foods[index]['sauce'].length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 5,
                                                mainAxisExtent: 40,
                                                mainAxisSpacing: 5),
                                        itemBuilder: (context, i) {
                                          controller.foods[index]['sauce'][i]
                                              ['selected'] = false;
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: controller.foods[index]
                                                      ['sauce'][i]['selected'],
                                                  onChanged: (v) {
                                                    controller.foods[index]
                                                                ['sauce'][i]
                                                            ['selected'] =
                                                        !controller.foods[index]
                                                                ['sauce'][i]
                                                            ['selected'];
                                                  }),
                                              Expanded(
                                                child: Text(
                                                  '${controller.foods[index]['sauce'][i]['name']}',
                                                  maxLines: 3,
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ],
                                )
                              : Container(),
                          (controller.foods[index]['soda'].length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Soda',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    GridView.builder(
                                        itemCount: controller
                                            .foods[index]['soda'].length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 5,
                                                mainAxisExtent: 40,
                                                mainAxisSpacing: 5),
                                        itemBuilder: (context, i) {
                                          controller.foods[index]['soda'][i]
                                              ['selected'] = false;
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: controller.foods[index]
                                                      ['soda'][i]['selected'],
                                                  onChanged: (v) {
                                                    controller.foods[index]
                                                                ['soda'][i]
                                                            ['selected'] =
                                                        !controller.foods[index]
                                                                ['soda'][i]
                                                            ['selected'];
                                                  }),
                                              Expanded(
                                                child: Text(
                                                  '${controller.foods[index]['soda'][i]['name']}',
                                                  maxLines: 3,
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ],
                                )
                              : Container(),
                          (controller.foods[index]['side'].length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Side',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    GridView.builder(
                                        itemCount: controller
                                            .foods[index]['side'].length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 5,
                                                mainAxisExtent: 40,
                                                mainAxisSpacing: 5),
                                        itemBuilder: (context, i) {
                                          controller.foods[index]['side'][i]
                                              ['selected'] = false;
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: controller.foods[index]
                                                      ['side'][i]['selected'],
                                                  onChanged: (v) {
                                                    controller.foods[index]
                                                                ['side'][i]
                                                            ['selected'] =
                                                        !controller.foods[index]
                                                                ['side'][i]
                                                            ['selected'];
                                                  }),
                                              Expanded(
                                                child: Text(
                                                  '${controller.foods[index]['side'][i]['name']}',
                                                  maxLines: 3,
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ],
                                )
                              : Container(),
                          (controller.foods[index]['extra'].length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Extra',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    GridView.builder(
                                        itemCount: controller
                                            .foods[index]['extra'].length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 5,
                                                mainAxisExtent: 40,
                                                mainAxisSpacing: 5),
                                        itemBuilder: (context, i) {
                                          controller.foods[index]['extra'][i]
                                              ['selected'] = false;
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: controller.foods[index]
                                                      ['extra'][i]['selected'],
                                                  onChanged: (v) {
                                                    controller.foods[index]
                                                                ['extra'][i]
                                                            ['selected'] =
                                                        !controller.foods[index]
                                                                ['extra'][i]
                                                            ['selected'];
                                                  }),
                                              Expanded(
                                                child: Text(
                                                  '${controller.foods[index]['extra'][i]['name']}',
                                                  maxLines: 3,
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ],
                                )
                              : Container(),
                          (controller.foods[index]['preparation'].length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Preparation',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    GridView.builder(
                                        itemCount: controller
                                            .foods[index]['preparation'].length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 5,
                                                mainAxisExtent: 40,
                                                mainAxisSpacing: 5),
                                        itemBuilder: (context, i) {
                                          controller.foods[index]['preparation']
                                              [i]['selected'] = false;
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: controller.foods[index]
                                                          ['preparation'][i]
                                                      ['selected'],
                                                  onChanged: (v) {
                                                    controller.foods[index]
                                                                ['preparation']
                                                            [i]['selected'] =
                                                        !controller.foods[index]
                                                                ['preparation']
                                                            [i]['selected'];
                                                  }),
                                              Expanded(
                                                child: Text(
                                                  '${controller.foods[index]['preparation'][i]['name']}',
                                                  maxLines: 3,
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ],
                                )
                              : Container(),
                          (controller.foods[index]['bacon'].length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bacon',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    GridView.builder(
                                        itemCount: controller
                                            .foods[index]['bacon'].length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 5,
                                                mainAxisExtent: 40,
                                                mainAxisSpacing: 5),
                                        itemBuilder: (context, i) {
                                          controller.foods[index]['bacon'][i]
                                              ['selected'] = false;
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: controller.foods[index]
                                                      ['bacon'][i]['selected'],
                                                  onChanged: (v) {
                                                    controller.foods[index]
                                                                ['bacon'][i]
                                                            ['selected'] =
                                                        !controller.foods[index]
                                                                ['bacon'][i]
                                                            ['selected'];
                                                  }),
                                              Expanded(
                                                child: Text(
                                                  '${controller.foods[index]['bacon'][i]['name']}',
                                                  maxLines: 3,
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ],
                                )
                              : Container(),
                          (controller.foods[index]['meal'].length > 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Meal',
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryButtonColor,
                                          fontSize: 25.sp),
                                    ),
                                    GridView.builder(
                                        itemCount: controller
                                            .foods[index]['meal'].length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 5,
                                                mainAxisExtent: 40,
                                                mainAxisSpacing: 5),
                                        itemBuilder: (context, i) {
                                          controller.foods[index]['meal'][i]
                                              ['selected'] = false;
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: controller.foods[index]
                                                      ['meal'][i]['selected'],
                                                  onChanged: (v) {
                                                    controller.foods[index]
                                                                ['meal'][i]
                                                            ['selected'] =
                                                        !controller.foods[index]
                                                                ['meal'][i]
                                                            ['selected'];
                                                  }),
                                              Expanded(
                                                child: Text(
                                                  '${controller.foods[index]['meal'][i]['name']}',
                                                  maxLines: 3,
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.padding30),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(ComboScreenViewOne(
                                  id: controller.foods[index]['id']));
                            },
                            child: CustomWidget.CustomPrimaryButton(
                                context: context,
                                height: 60.h,
                                width: 282.w,
                                borderColor: ColorConstants.priceborderColor,
                                title: 'Make it combo',
                                titlecolor: Colors.white,
                                titlefontSize: 24.sp,
                                borderradius: 5,
                                backgroundcolor:
                                    ColorConstants.priceborderColor,
                                titleFontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Get.to(ItemCustomisePage(
                                  id: controller.foods[index]['id']));
                              // Navigator.pushNamed(context, '/itemcustomisePage',
                              //     arguments: PageRouteArguments(
                              //         data: [],
                              //         fromPage: 'itempage',
                              //         toPage: 'itemcustomisePage'));
                            },
                            child: CustomWidget.CustomPrimaryButton(
                                context: context,
                                height: 60.h,
                                width: 282.w,
                                borderColor:
                                    ColorConstants.bannerHeadingTextColor,
                                title: 'Customise',
                                titlecolor: Colors.white,
                                titlefontSize: 24.sp,
                                borderradius: 5,
                                backgroundcolor:
                                    ColorConstants.bannerHeadingTextColor,
                                titleFontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomWidget.CustomPrimaryButton(
                        context: context,
                        height: 60.h,
                        width: 596.w,
                        borderColor: ColorConstants.primaryButtonColor,
                        title: 'Add to cart',
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
