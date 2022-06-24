import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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

uerChoiceDialog({required BuildContext context}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        ItemScreenController controller = Get.find();
        Product data = controller.menu.value;
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
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
                        Image(
                          image: AssetImage(
                            "assets/images/item.png",
                          ),
                          height: 158.h,
                          width: 212.w,
                        ),
                        SizedBox(width: 30.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name!,
                              style: TextStyle(
                                  color: ColorConstants.primaryBigTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.sp),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              data.productDescription!,
                              style: TextStyle(
                                  color: ColorConstants.primaryBigTextColor
                                      .withOpacity(0.5),
                                  fontSize: 30.sp),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              data.productPrice!,
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
                        Text('${data.toppings!.length}'),
                        // ? Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         'Chrust',
                        //         style: TextStyle(
                        //             color:
                        //                 ColorConstants.primaryButtonColor,
                        //             fontSize: 25.sp),
                        //       ),
                        //       // GridView.builder(
                        //       //     itemCount: data.chrust!.isNotEmpty
                        //       //         ? data.chrust!.length
                        //       //         : 0,
                        //       //     shrinkWrap: true,
                        //       //     gridDelegate:
                        //       //         SliverGridDelegateWithFixedCrossAxisCount(
                        //       //             crossAxisCount: 5,
                        //       //             childAspectRatio: 2,
                        //       //             crossAxisSpacing: 10,
                        //       //             mainAxisSpacing: 10),
                        //       //     itemBuilder: (context, index) {
                        //       //       return Row(
                        //       //         children: [
                        //       //           Checkbox(
                        //       //               value: data
                        //       //                   .chrust![index].selected,
                        //       //               onChanged: (v) {}),
                        //       //           Text('${data.chrust![index].name}')
                        //       //         ],
                        //       //       );
                        //       //     }),
                        //     ],
                        //   )
                        // : Container(),
                        Text(
                          'Toppings',
                          style: TextStyle(
                              color: ColorConstants.primaryButtonColor,
                              fontSize: 25.sp),
                        ),
                        Text(
                          'Style',
                          style: TextStyle(
                              color: ColorConstants.primaryButtonColor,
                              fontSize: 25.sp),
                        ),
                        Text(
                          'Sauce',
                          style: TextStyle(
                              color: ColorConstants.primaryButtonColor,
                              fontSize: 25.sp),
                        ),
                        Text(
                          'Soda',
                          style: TextStyle(
                              color: ColorConstants.primaryButtonColor,
                              fontSize: 25.sp),
                        ),
                        Text(
                          'Side',
                          style: TextStyle(
                              color: ColorConstants.primaryButtonColor,
                              fontSize: 25.sp),
                        ),
                        Text(
                          'Preparation',
                          style: TextStyle(
                              color: ColorConstants.primaryButtonColor,
                              fontSize: 25.sp),
                        ),
                        Text(
                          'Extra',
                          style: TextStyle(
                              color: ColorConstants.primaryButtonColor,
                              fontSize: 25.sp),
                        ),
                        Text(
                          'Beacon',
                          style: TextStyle(
                              color: ColorConstants.primaryButtonColor,
                              fontSize: 20.sp),
                        ),
                        Text(
                          'Meal',
                          style: TextStyle(
                              color: ColorConstants.primaryButtonColor,
                              fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () =>
                              Get.to(ComboScreenViewTwo(itemtype: 'l')),
                          child: CustomWidget.CustomPrimaryButton(
                              context: context,
                              height: 60.h,
                              width: 282.w,
                              borderColor: ColorConstants.priceborderColor,
                              title: 'Make it combo',
                              titlecolor: Colors.white,
                              titlefontSize: 24.sp,
                              borderradius: 5,
                              backgroundcolor: ColorConstants.priceborderColor,
                              titleFontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Get.to(ItemCustomisePage(id: data.id!));
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
        );
      });
}
