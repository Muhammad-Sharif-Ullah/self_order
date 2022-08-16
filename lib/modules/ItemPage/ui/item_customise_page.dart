import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/customWidget_utils.dart';
import 'add_extra_customise.dart';

class ItemCustomisePage extends StatelessWidget {
  ItemScreenController controller = Get.put(ItemScreenController());
  String id;
  ItemCustomisePage({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.getCustomiseFood(id);
    controller.getCustomiseExtraOption(id);
    return Obx(
      () => SafeArea(
          child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: (controller.customiseExtra.value.status != null &&
                      controller.customiseProduct.value.status != null)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Row(
                            children: [
                              Text(
                                'Whats on it:',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: ColorConstants.primaryButtonColor,
                                    fontSize: 24.sp),
                              ),
                              Spacer(),
                              Text(
                                'Total:  ${controller.product.value.productTotal}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color:
                                        ColorConstants.bannerHeadingTextColor,
                                    fontSize: 24.sp),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: controller.product.value.baseUrl! +
                                    controller.product.value.productImage!,
                                height: 158.h,
                                width: 150.w,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 34,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 32.w,
                                    ),
                                    Text(
                                      '${controller.product.value.name}',
                                      style: TextStyle(
                                          color: ColorConstants
                                              .primaryBigTextColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24.sp),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    GridView.builder(
                                        itemCount: controller
                                            .defaultCustomiseProduct
                                            .value
                                            .length,
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                childAspectRatio: 2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () => controller
                                                .getCustomiseExtra(controller
                                                    .defaultCustomiseProduct
                                                    .value[index]
                                                    .id),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 95,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              150),
                                                      border: Border.all(
                                                          color: ColorConstants
                                                              .borderColor
                                                              .withOpacity(
                                                                  0.02))),
                                                  child: Center(
                                                    child: Text(
                                                      '${controller.defaultCustomiseProduct.value[index].name}',
                                                      style: TextStyle(
                                                        color: ColorConstants
                                                            .primaryBigTextColor,
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 5,
                                                  top: -3,
                                                  child: Container(
                                                    height: 20.h,
                                                    width: 20.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      color: ColorConstants
                                                          .bannerHeadingTextColor,
                                                    ),
                                                    child: Icon(
                                                      FeatherIcons.x,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        })
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 50.h,
                        ),

                        /// Todo : Add Extra //
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Text(
                            'Add extra:',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                                color: ColorConstants.primaryButtonColor),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Expanded(
                          child: (controller.customiseProduct.value.customise ==
                                  null)
                              ? Container()
                              :
                              // Text(
                              //     '${controller.customiseExtra.value.customiseExtraOptions!.length}'),
                              ResponsiveGridList(
                                  desiredItemWidth: Get.width / 6,
                                  minSpacing: 50.h,
                                  children: controller
                                      .customiseProduct.value.customise!
                                      .map((i) {
                                    return InkWell(
                                      onTap: () {
                                        addExtraCustomisePage(context: context);
                                      },
                                      child: Column(
                                        children: [
                                          CachedNetworkImage(
                                            errorWidget:
                                                (context, url, error) => Image(
                                                    image: AssetImage(
                                                        "assets/images/homescreen.png")),
                                            imageUrl: i.baseUrl! + i.image!,
                                            height: 70.h,
                                            width: double.infinity,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            '${i.name}',
                                            style: TextStyle(
                                              color: ColorConstants
                                                  .primaryBigTextColor,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomWidget.CustomPrimaryButton(
                                                context: context,
                                                width: 26.51.w,
                                                height: 16.87.h,
                                                borderColor: ColorConstants
                                                    .primaryBigTextColor
                                                    .withOpacity(0.5),
                                                backgroundcolor: Colors.white,
                                                borderradius: 6,
                                                buttonType: 'icon',
                                                icon: Icon(
                                                  FeatherIcons.minus,
                                                  size: 12,
                                                ),
                                              ),
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: ColorConstants
                                                        .primaryBigTextColor),
                                              ),
                                              CustomWidget.CustomPrimaryButton(
                                                context: context,
                                                width: 26.51.w,
                                                height: 16.87.h,
                                                borderColor: ColorConstants
                                                    .bannerHeadingTextColor,
                                                backgroundcolor: ColorConstants
                                                    .bannerHeadingTextColor,
                                                borderradius: 6,
                                                buttonType: 'icon',
                                                icon: Icon(
                                                  FeatherIcons.plus,
                                                  size: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList()),
                        ),
                      ],
                    )
                  : Container(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/checkoutPage',
                        arguments: PageRouteArguments(
                            data: [],
                            toPage: "checkoutPage",
                            fromPage: "itemcustomisePage"));
                  },
                  child: CustomWidget.CustomPrimaryButton(
                      borderradius: 5,
                      backgroundcolor: ColorConstants.primaryButtonColor,
                      height: 60.h,
                      width: Get.width,
                      context: context,
                      title: 'Done',
                      titlefontSize: 24.sp,
                      titlecolor: Colors.white,
                      titleFontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      )),
    );
  }
}
