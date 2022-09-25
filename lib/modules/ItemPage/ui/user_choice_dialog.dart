import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/modules/combo_screen_two/ui/combo_screen_one_view.dart';
import 'package:self_order/shared/Route/route.dart';

// import 'package:self_order/modules/combo_screen_one/ui/combo_screen_one_view.dart';

import '../../../shared/constants/Dimensions.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/customWidget_utils.dart';
import '../model/MenuModel.dart';

uerChoiceDialog({required BuildContext context}) {
  ItemScreenController controller = Get.find();
  Product data = controller.menu.value;
  // return Get.dialog(
  //   Builder(builder: (context) {
  //     return dialogBody(context, data);
  //   }),
  // );
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        Product data = controller.menu.value;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: dialogBody(context, controller.menu.value),
        );
      });
}

Widget dialogBody(BuildContext context, Product data) {
  ItemScreenController controller = Get.find();
  return Container(
    width: context.width,
    height: context.height * .9,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
    ),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Make your choice',
                  style: TextStyle(
                      color: ColorConstants.primaryButtonColor,
                      fontSize: 24,
                      fontFamily: "Advent Pro",
                      fontWeight: FontWeight.w700),
                ),
                CustomWidget.customCloseSection(context: context),
              ],
            ),
          ),
          30.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SizedBox(
              height: 200.h,
              width: context.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      "assets/images/item.png",
                      height: 158.h,
                      width: 212.w,
                    ),
                  ),
                  20.verticalSpace,
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 180.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 8.h),
                          SizedBox(
                            height: 80.h,
                            width: context.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    data.name!,
                                    maxLines: 2,
                                    style: GoogleFonts.roboto(
                                      color: ColorConstants.primaryBigTextColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // SizedBox(height: 8.h),
                                Expanded(
                                  child: AutoSizeText(
                                    data.productDescription!,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.roboto(
                                      color: ColorConstants.primaryBigTextColor
                                          .withOpacity(.5),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text.rich(
                            TextSpan(
                              text: "\$" + data.productPrice!,
                              children: [
                                TextSpan(
                                  text: "\t\t x2",
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFFC4C4C4),
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                              style: GoogleFonts.roboto(
                                  color: ColorConstants.bannerHeadingTextColor
                                      .withOpacity(0.5),
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          SizedBox(
                            height: 30.h,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 30.h,
                                  child: OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: ColorConstants
                                            .bannerHeadingTextColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            side: BorderSide(
                                                color: Colors.grey.shade100)),
                                      ),
                                      child: const Icon(Icons.remove)),
                                ),
                                20.horizontalSpace,
                                Text(
                                  "1",
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFF505050),
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                20.horizontalSpace,
                                SizedBox(
                                  height: 30.h,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r)),
                                          backgroundColor: ColorConstants
                                              .bannerHeadingTextColor),
                                      child: const Icon(Icons.add)),
                                ),
                              ],
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

          // 'Toppings'
          if (data.toppings!.isNotEmpty) dialogListTitle("Toppings"),
          if (data.toppings!.isNotEmpty) 10.verticalSpace,
          if (data.toppings!.isNotEmpty)
            dialogInnerToppingsList(data.toppings!, topping),
          //  'Toppings' End -------

          // 'Style'
          if (data.style!.isNotEmpty) dialogListTitle('Style'),
          if (data.style!.isNotEmpty) 10.verticalSpace,
          if (data.style!.isNotEmpty)
            dialogInnerGeneralItemList(data.style!, style),
          //  'Style' End -------
          // 'Sauce'
          if (data.sauce!.isNotEmpty) dialogListTitle('Sauce'),
          if (data.sauce!.isNotEmpty) 10.verticalSpace,
          if (data.sauce!.isNotEmpty)
            dialogInnerGeneralItemList(data.sauce!, sauce),
          //  'Sauce' End -------

          // 'Soda'
          if (data.soda!.isNotEmpty) dialogListTitle('Soda'),
          if (data.soda!.isNotEmpty) 10.verticalSpace,
          if (data.soda!.isNotEmpty)
            dialogInnerGeneralItemList(data.soda!, soda),
          //  'Soda' End -------
          // 'dressing'
          if (data.dressing!.isNotEmpty) dialogListTitle('Dressing'),
          if (data.dressing!.isNotEmpty) 10.verticalSpace,
          if (data.dressing!.isNotEmpty)
            dialogInnerGeneralItemList(data.dressing!, dressing),

          //  'dressing' End -------

          // 'Side'
          if (data.side!.isNotEmpty) dialogListTitle('Side'),
          if (data.side!.isNotEmpty) 10.verticalSpace,
          if (data.side!.isNotEmpty)
            dialogInnerGeneralItemList(data.side!, side),
          //  'Side' End -------
          // 'preparation'
          if (data.preparation!.isNotEmpty) dialogListTitle('Preparation'),
          if (data.preparation!.isNotEmpty) 10.verticalSpace,
          if (data.preparation!.isNotEmpty)
            dialogInnerGeneralItemList(data.preparation!, preparation),
          //  'preparation' End -------

          // 'extra'
          if (data.extra!.isNotEmpty) dialogListTitle('Extra'),
          if (data.extra!.isNotEmpty) 10.verticalSpace,
          if (data.extra!.isNotEmpty)
            dialogInnerGeneralItemList(data.extra!, extra),
          //  'extra' End -------
          // 'bacon'
          if (data.bacon!.isNotEmpty) dialogListTitle('Bacon'),
          if (data.bacon!.isNotEmpty) 10.verticalSpace,
          if (data.bacon!.isNotEmpty)
            dialogInnerGeneralItemList(data.bacon!, bacon),
          //  'bacon' End -------

          // 'meal'
          if (data.meal!.isNotEmpty) dialogListTitle('Meal'),
          if (data.meal!.isNotEmpty) 10.verticalSpace,
          if (data.meal!.isNotEmpty)
            dialogInnerGeneralItemList(data.meal!, meal),
          //  'meal' End -------

          // Chrust
          if (data.chrust!.isNotEmpty) dialogListTitle('Chrust'),
          if (data.chrust!.isNotEmpty) 10.verticalSpace,
          if (data.chrust!.isNotEmpty)
            dialogInnerGeneralItemList(data.chrust!, chrust),
          // Chrust End
          // ----------------
          /*            
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                    */
          // ---------------------
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
            child: SizedBox(
              height: 60.h,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Get.back();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ComboScreenViewOne(id: data.id!)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.priceBorderColor,
                      ),
                      child: Text(
                        "Make it Combo",
                        style: TextStyle(
                          fontFamily: 'Advent Pro',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Get.back();
                        // Get.to(ItemCustomizePage(id: data.id!));
                        final bool isChose = await Navigator.pushNamed(
                            context, AppRoutes.ItemCustomize,
                            arguments: PageRouteArguments(
                                data: [data.id],
                                toPage: AppRoutes.ItemCustomize,
                                fromPage: AppRoutes.ItemScreen)) as bool;
                        if (isChose != null && isChose) {
                          controller.isOrderActive.value = isChose;
                        }
                        // Get.off(() => ItemCustomizePage(id: data.id!));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.bannerHeadingTextColor,
                      ),
                      child: Text(
                        "Customize",
                        style: TextStyle(
                          fontFamily: 'Advent Pro',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.to(ComboScreenViewOne(id: data.id));
                  //   },
                  //   child: CustomWidget.CustomPrimaryButton(
                  //       context: context,
                  //       height: 60.h,
                  //       width: 282.w,
                  //       borderColor: ColorConstants.priceborderColor,
                  //       title: 'Make it combo',
                  //       titlecolor: Colors.white,
                  //       titlefontSize: 24.sp,
                  //       borderradius: 5,
                  //       backgroundcolor: ColorConstants.priceborderColor,
                  //       titleFontWeight: FontWeight.w700),
                  // ),
                  // Spacer(),
                  // InkWell(
                  //   onTap: () {
                  //     Get.to(ItemCustomisePage(id: data.id!));
                  //     // Navigator.pushNamed(context, '/itemcustomisePage',
                  //     //     arguments: PageRouteArguments(
                  //     //         data: [],
                  //     //         fromPage: 'itempage',
                  //     //         toPage: 'itemcustomisePage'));
                  //   },
                  //   child: CustomWidget.CustomPrimaryButton(
                  //       context: context,
                  //       height: 60.h,
                  //       width: 282.w,
                  //       borderColor:
                  //           ColorConstants.bannerHeadingTextColor,
                  //       title: 'Customise',
                  //       titlecolor: Colors.white,
                  //       titlefontSize: 24.sp,
                  //       borderradius: 5,
                  //       backgroundcolor:
                  //           ColorConstants.bannerHeadingTextColor,
                  //       titleFontWeight: FontWeight.w700),
                  // )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
            child: CustomWidget.CustomPrimaryButton(
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
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    ),
  );
}

Padding dialogInnerToppingsList(List<Toppings> data, String menuListString) {
  ItemScreenController controller = Get.find();

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Wrap(
      spacing: 5,
      runSpacing: 5,
      alignment: WrapAlignment.start,
      children: data
          .map((Toppings e) => selectableButton(e, menuListString))
          .toList(),
    ),
  );
}

Padding dialogInnerGeneralItemList(
    List<GeneralItem> data, String menuListString) {
  ItemScreenController controller = Get.find<ItemScreenController>();
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Wrap(
      spacing: 5,
      runSpacing: 5,
      alignment: WrapAlignment.start,
      children: data
          .map((GeneralItem e) => OutlinedButton(
                onPressed: () {
                  if (controller.dialogItemsSelector[menuListString]!
                      .contains(e.name)) {
                    controller.dialogItemsSelector[menuListString]!
                        .remove(e.name);
                  } else {
                    controller.dialogItemsSelector[menuListString]!.add(e.name);
                  }
                  Get.forceAppUpdate();
                },
                style: OutlinedButton.styleFrom(
                  // padding: EdgeInsets.zero,
                  backgroundColor: controller
                          .dialogItemsSelector[menuListString]!
                          .contains(e.name)
                      ? const Color(0xFF5AB99D)
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    side: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
                child: Text(
                  e.name!,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: controller.dialogItemsSelector[menuListString]!
                            .contains(e.name)
                        ? Colors.white
                        : const Color(0xFF505050),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ))
          .toList(),
    ),
  );
}

Padding dialogListTitle(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Text(
      title,
      style: selectableTitleStyle(),
    ),
  );
}

TextStyle selectableTitleStyle() {
  return const TextStyle(
    fontFamily: "Advent Pro",
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Color(0xFF5AB99D),
  );
}

Widget selectableButton(e, String menuListString) {
  ItemScreenController controller = Get.find();

  return OutlinedButton(
    onPressed: () {
      if (controller.dialogItemsSelector[menuListString]!.contains(e.name)) {
        controller.dialogItemsSelector[menuListString]!.remove(e.name);
      } else {
        controller.dialogItemsSelector[menuListString]!.add(e.name);
      }
      Get.forceAppUpdate();
    },
    style: OutlinedButton.styleFrom(
      // padding: EdgeInsets.zero,
      backgroundColor:
          controller.dialogItemsSelector[menuListString]!.contains(e.name)
              ? const Color(0xFF5AB99D)
              : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(color: Colors.grey.shade100),
      ),
    ),
    child: Text(
      e.name!,
      style: GoogleFonts.roboto(
        fontSize: 14,
        color: controller.dialogItemsSelector[menuListString]!.contains(e.name)
            ? Colors.white
            : const Color(0xFF505050),
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
