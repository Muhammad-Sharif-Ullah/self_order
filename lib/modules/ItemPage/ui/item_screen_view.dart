import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/Home/ui/home_screen_view.dart';
import 'package:self_order/modules/ItemPage/ui/user_choice_dialog.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/on_network_image.dart';

import '../controller/item_screen_logic.dart';

// GetView<ItemScreenController>
class ItemPageScreen extends StatefulWidget {
  final String title;
  final String id;

  // final ItemScreenController controller = Get.find<ItemScreenController>();

  const ItemPageScreen({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  State<ItemPageScreen> createState() => _ItemPageScreenState();
}

class _ItemPageScreenState extends State<ItemPageScreen> {
  final ItemScreenController controller = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    // Get.put<ItemScreenController>(ItemScreenController());
    controller.getFoods(widget.id);
    controller.getSubCategory(widget.id);
    final orientation = MediaQuery.of(Get.context!).orientation;
    return WillPopScope(
      onWillPop: () async {
        controller.dispose();
        Get.off(() => const HomeScreen());
        return true;
      },
      child: SafeArea(
        bottom: false,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Obx(
              () => DraggableBottomSheet(
                minExtent: 135.h,
                useSafeArea: false,
                curve: Curves.elasticIn,
                onDragging: (pos) {},
                previewWidget: previewWidget(),
                expandedWidget: expandedWidget(),
                maxExtent: MediaQuery.of(context).size.height * 0.7,
                backgroundWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bannerSection(),
                    10.verticalSpace,
                    burgerTitle(widget.title),
                    20.verticalSpace,
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            /// ToDo: Do here///
                            leftMenu(),
                            15.horizontalSpace,
                            Expanded(
                              flex: 7,
                              child: Column(children: [
                                subMenuList(),
                                10.verticalSpace,
                                const Divider(
                                    thickness: 2, color: Color(0xFFFF8A21)),

                                subSubMenuList(),

                                10.verticalSpace,
                                Flexible(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        20.verticalSpace,
                                        LayoutBuilder(
                                            builder: (context, constraints) {
                                          return GridView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  controller.foods.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 5,
                                                crossAxisCount:
                                                    constraints.maxWidth < 600
                                                        ? 3
                                                        : 2,
                                                mainAxisExtent: 157,
                                              ),
                                              physics: const ScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                final String image =
                                                    controller.foods[index]
                                                            ['base_url'] +
                                                        controller.foods[index]
                                                            ['product_image'];
                                                return foodItemCard(
                                                    index, context, image);
                                              });
                                        }),
                                      ],
                                    ),
                                  ),
                                )

                                // CustomCustomItemwithPrice(Tap:userChoice(context: context) ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget expandedWidget() {
    return Obx(() => controller.isOrderActive.value == false
        ? Container()
        : Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: const Color(0xFF505050).withOpacity(.5),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.padding30, vertical: 10.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Order',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Advent Pro"),
                      ),
                      Image.asset("assets/images/down_arrow.png"),
                      const Text(
                        'Total:  \$72.00',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Advent Pro"),
                      )
                    ],
                  ),
                ),
                10.verticalSpace,
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisExtent: 150),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xFFC4C4C4),
                                    radius: 12.r,
                                    child: const FittedBox(
                                        child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    )),
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/side.png",
                                  height: 60.h,
                                  width: 80.w,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Beef Burger Combo ",
                                              style: GoogleFonts.roboto(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "1X    \$9.00",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF505050)
                                                    .withOpacity(0.5)),
                                          ),
                                        ],
                                      ),
                                      10.verticalSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: 28.h,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  shape: const StadiumBorder(),
                                                  backgroundColor:
                                                      const Color(0xFFFFB15B)),
                                              child: Text(
                                                "Combo",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 28.h,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        const StadiumBorder(),
                                                    backgroundColor:
                                                        const Color(
                                                            0xFFFF8A21)),
                                                child: Text(
                                                  "Customize",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                      10.verticalSpace,
                                      Text(
                                        "+ Frience Fries  + Pepsi 20 oz",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF505050)
                                                .withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: SizedBox(
                    height: 60.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            onPressed: () {
                              // controller.isOrderActive.value = false;
                              controller.cancelOrderActionCleanCache();
                              setState(() {});
                              // Get.off(() => const HomeScreen());
                            },
                            child: const Text(
                              "Cancel Order",
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Advent Pro"),
                            ),
                          ),
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/checkoutPage',
                                  arguments: PageRouteArguments(
                                      data: [],
                                      toPage: "checkoutPage",
                                      fromPage: "itemcustomisePage"));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5AB99D),
                            ),
                            child: const Text(
                              "Done",
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Advent Pro"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          ));
  }

  Widget previewWidget() {
    return Obx(() => controller.isOrderActive.value == false
        ? Container()
        : Container(
            // height: 140.h,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: const Color(0xFF505050).withOpacity(.5),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.padding30, vertical: 10.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Order',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Advent Pro"),
                      ),
                      Image.asset("assets/images/up_arrow.png"),
                      const Text(
                        'Total:  \$72.00',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Advent Pro"),
                      )
                    ],
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: SizedBox(
                    height: 60.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            onPressed: () {
                              // controller.isOrderActive.value = false;
                              controller.cancelOrderActionCleanCache();
                              // controller.dispose();
                              setState(() {});
                              // Get.off(() => const HomeScreen());
                            },
                            child: const Text(
                              "Cancel Order",
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Advent Pro"),
                            ),
                          ),
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/checkoutPage',
                                  arguments: PageRouteArguments(
                                      data: [],
                                      toPage: "checkoutPage",
                                      fromPage: "itemcustomisePage"));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5AB99D),
                            ),
                            child: const Text(
                              "Done",
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Advent Pro"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          ));
  }

  Widget foodItemCard(int index, BuildContext context, String image) {
    return Obx(() => GestureDetector(
          onTap: () async {
            controller.selectedFoodIndex.value = index;
            // log(jsonEncode(controller.foods[index]));
            controller.getFood(index);
            // print(controller.menu.value
            //     .productDescription);

            if (index != controller.selectedFoodIndex.value) {
              controller.clearItemsSelector();
              log(index.toString());
              log(controller.selectedFoodIndex.value.toString());
            }
            await uerChoiceDialog(context: context);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 1,
                color: controller.selectedFoodIndex.value == index
                    ? const Color(0xFF5AB99D)
                    : Colors.white,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OnNetWorkImage(
                      url: image,
                      fit: BoxFit.contain,
                      // width: 208.w,
                      // height: 90.h,
                    ),
                  ),
                ),
                // SizedBox(
                //     height: Dimensions
                //         .SizedBoxValue20),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.r,
                    ),
                    child: AutoSizeText(
                      '${controller.foods[index]['name']}',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF505050)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        '\$${controller.foods[index]['product_price']}',
                        style: TextStyle(
                          color: ColorConstants.primaryBigTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 11.sp,
                          fontFamily: 'Gotham Pro',
                        ),
                        overflow: TextOverflow.clip,
                      ),
                      // const SizedBox(
                      //   width: 60,
                      // ),

                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle,
                          ),
                          child: const FittedBox(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(FeatherIcons.plus),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  SizedBox subSubMenuList() {
    return SizedBox(
      height: 45.h,
      width: double.infinity,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: controller.subSubMenu.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return 10.horizontalSpace;
        },
        itemBuilder: (BuildContext context, int index) {
          final String subSubMenuText = controller.subSubMenu[index];
          return Obx(() => TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFFF8A21),
                ),
                child: Text(
                  subSubMenuText,
                  style: GoogleFonts.roboto(
                    color: controller.selectedSubSubMeuIndex.value == index
                        ? const Color(0xFFFF8A21)
                        : const Color(0xFF505050),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  controller.selectedSubSubMeuIndex.value = index;
                },
              ));
        },
      ),
    );
  }

  Wrap subMenuList() {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 10,
      spacing: 10,
      alignment: WrapAlignment.start,
      children: [
        for (int index = 0; index < controller.subMenu.length; index++)
          SizedBox(
            height: 35.h,
            child: Obx(() => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: controller.selectedSubMeuIndex.value == index
                      ? const Color(0xFFFF8A21)
                      : Colors.white,
                  elevation: 0,
                  shape: StadiumBorder(
                    side: BorderSide(
                        width: .8,
                        color: controller.selectedSubMeuIndex.value == index
                            ? Colors.transparent
                            : Colors.grey.shade400),
                  ),
                ),
                onPressed: () {
                  controller.selectedSubMeuIndex.value = index;
                },
                child: Text(
                  controller.subMenu[index],
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedSubMeuIndex.value == index
                        ? Colors.white
                        : Colors.black,
                  ),
                ))),
          )
      ],
    );
  }

  Expanded leftMenu() {
    return Expanded(
      flex: 2,
      child: ListView.separated(
        separatorBuilder: (context, index) => 40.verticalSpace,
        itemCount: controller.subCategories.length,
        itemBuilder: (context, index) {
          final String image = controller.subCategories[index]['base_url'] +
              "/" +
              controller.subCategories[index]['image'];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OnNetWorkImage(
                height: 59,
                width: 59,
                url: image,
                shape: BoxShape.circle,
              ),
              Obx(() => RawMaterialButton(
                    elevation: 0,
                    onPressed: () {
                      controller.selectedItemIndex.value = index;
                    },
                    fillColor: controller.selectedItemIndex.value == index
                        ? const Color(0xFF5AB99D)
                        : Colors.white,
                    shape: const StadiumBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: AutoSizeText(
                        '${controller.subCategories[index]['subcategory_name']}',
                        style: GoogleFonts.roboto(
                          // fontSize: 14.sp,
                          fontWeight:
                              controller.selectedItemIndex.value == index
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                          color: controller.selectedItemIndex.value == index
                              ? Colors.white
                              : const Color(0xFF505050),
                        ),
                      ),
                    ),
                  )),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       elevation: 0,
              //       shape: const StadiumBorder(),
              //     ),
              //     onPressed: () {},
              //     child: Text(
              //       '${controller.subCategories[index]['subcategory_name']}',
              //       style: GoogleFonts.roboto(
              //         fontSize: 14.sp,
              //         fontWeight: FontWeight.w400,
              //         color: const Color(0xFF505050),
              //       ),
              //     )),
            ],
          );
        },
      ),
    );
  }

  Column testing(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CachedNetworkImage(
          width: 208.w,
          height: 90.h,
          imageUrl: controller.foods[index]['base_url'] +
              controller.foods[index]['product_image'],
        ),
        SizedBox(
          height: Dimensions.SizedBoxValue20,
        ),
        Text(
          '${controller.foods[index]['name']}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.TextSize20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '${controller.foods[index]['product_description']}',
          style: TextStyle(
              color: ColorConstants.primaryBigTextColor,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.TextSize15),
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
                  color: ColorConstants.primaryBigTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.TextSize18),
            ),
            const SizedBox(
              width: 60,
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(FeatherIcons.plus),
            )
          ],
        )
      ],
    );
  }

  Padding burgerTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.w700,
            color: ColorConstants.primaryBigTextColor,
            fontFamily: "Advent Pro"),
      ),
    );
  }

  Stack bannerSection() {
    return Stack(
      children: [
        Image.asset("assets/images/itempag.png",
            height: 184.h, width: double.maxFinite, fit: BoxFit.cover),
        Positioned(
          top: Dimensions.SizedBoxValue20,
          right: Dimensions.SizedBoxValue15,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.primaryButtonColor,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
              onPressed: () {},
              child: const Text("Eat In")),
        ),
        Positioned(
          top: Dimensions.SizedBoxValue20,
          left: Dimensions.SizedBoxValue15,
          child: IconButton(
              onPressed: () {
                controller.clearAllCache();
                // controller.onClose();
                Get.off(() => const HomeScreen());
              },
              icon: const Icon(
                Icons.chevron_left_outlined,
                size: 40,
              )),
        )
      ],
    );
  }

  Widget foodVarision({required String text}) {
    return Container(
      height: 30,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
            color: ColorConstants.borderColor.withOpacity(0.2), width: 3),
      ),
      child: Center(child: Text(text)),
    );
  }
}
