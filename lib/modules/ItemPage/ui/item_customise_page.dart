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
    return Obx(
      () => SafeArea(
          child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
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
                          'Total:  \$18.36',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: ColorConstants.bannerHeadingTextColor,
                              fontSize: 24.sp),
                        ),
                      ],
                    ),
                  ),

                  ///Todo : previous start  ///
                  /*Padding(
                   padding:
                   EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                   child: Row(
                     children: [
                       Container(
                         height: Dimensions.height90,
                         width: Dimensions.width100,
                         child: Center(
                           child: Image(
                             image: AssetImage("assets/images/item.png"),
                             height: Dimensions.height90,
                             width: Dimensions.width90,
                           ),
                         ),
                       ),
                       SizedBox(
                         width: 18,
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'Beef Burger',
                             style: TextStyle(
                                 color: ColorConstants.primaryBigTextColor,
                                 fontSize: Dimensions.TextSize18,
                                 fontWeight: FontWeight.bold),
                           ),
                           SizedBox(
                             height: Dimensions.SizedBoxValue2,
                           ),
                           Text(
                             'Beef with cheese',
                             style: TextStyle(
                                 color: ColorConstants.primaryBigTextColor,
                                 fontSize: Dimensions.TextSize18,
                                 fontWeight: FontWeight.w400),
                           ),
                         ],
                       ),
                       Spacer(),
                       Text(
                         'Total:  \$18.36',
                         style: TextStyle(
                             fontSize: Dimensions.TextSize20,
                             fontWeight: FontWeight.w400,
                             color: ColorConstants.primaryBigTextColor),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(
                   height: Dimensions.SizedBoxValue30,
                 ),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                   child: Container(
                     //color: Colors.red,
                     height: Dimensions.height250,
                     child: ListView.builder(
                       itemCount: 4,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context, index) {
                         return Padding(
                           padding: EdgeInsets.only(right: 70),
                           child: Column(
                             children: [
                               Container(
                                 height: Dimensions.height70,
                                 width: Dimensions.width130,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color:
                                   ColorConstants.customizeBackgroundColor,
                                 ),
                                 child: Image(
                                   image: AssetImage("assets/images/meat.png"),
                                   height: Dimensions.height60,
                                   width: Dimensions.width110,
                                 ),
                               ),
                               SizedBox(
                                 height: Dimensions.SizedBoxValue15,
                               ),
                               Text(
                                 'Fried Egg',
                                 style: TextStyle(
                                   fontSize: Dimensions.TextSize20,
                                 ),
                               ),
                               SizedBox(
                                 height: Dimensions.SizedBoxValue15,
                               ),
                               Text(
                                 '\$0.36',
                                 style: TextStyle(
                                     color:
                                     ColorConstants.bannerHeadingTextColor,
                                     fontSize: Dimensions.TextSize20),
                               ),
                               SizedBox(
                                 height: Dimensions.SizedBoxValue15,
                               ),
                               CustomWidget.ItemCountSection(),
                               SizedBox(
                                 height: Dimensions.SizedBoxValue30,
                               ),
                             ],
                           ),
                         );
                       },
                     ),
                   ),
                 ),
                 CustomWidget.CustomAddtoCartButton(
                     height: Dimensions.height60 * 1.0,
                     width: Dimensions.width579,
                     context: context,
                     ontap: () {
                       WidgetsBinding.instance?.addPostFrameCallback((_){
                         //  Get.to(CartScreen());
                       });
    
                     }),*/
                  /// Todo: previous end///

                  SizedBox(
                    height: 30.h,
                  ),

                  //////////////////////////////shohag start///////////////////////////////////////////
                  //////////////////////////////shohag start///////////////////////////////////////////
                  //////////////////////////////shohag start///////////////////////////////////////////
                  //////////////////////////////shohag start///////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage("assets/images/customisebug.png"),
                          height: 109,
                          width: 147,
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
                                'Beef Burger',
                                style: TextStyle(
                                    color: ColorConstants.primaryBigTextColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24.sp),
                              ),
                              SizedBox(
                                height: 35.h,
                              ),
                              GridView.builder(
                                  itemCount:
                                      controller.customiseFoods.value.length,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5,
                                          childAspectRatio: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 95,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(150),
                                              border: Border.all(
                                                  color: ColorConstants
                                                      .borderColor
                                                      .withOpacity(0.02))),
                                          child: Center(
                                            child: Text(
                                              '${controller.customiseFoods[index]['name']}',
                                              style: TextStyle(
                                                color: ColorConstants
                                                    .primaryBigTextColor,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
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
                                                  BorderRadius.circular(25),
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
                                    );
                                  })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  /////////////////// sohagg end //////////////////////////////////////////////////////
                  /////////////////// sohagg end //////////////////////////////////////////////////////
                  /////////////////// sohagg end //////////////////////////////////////////////////////

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
                    child: ResponsiveGridList(
                        desiredItemWidth: 130.w,
                        minSpacing: 50.h,
                        children: controller.extraFood.map((i) {
                          return InkWell(
                            onTap: () {
                              addExtraCustomisePage(context: context);
                            },
                            child: Column(
                              children: [
                                Image(
                                  image:
                                      AssetImage("assets/images/extraFood.png"),
                                  height: 70,
                                  width: 130,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Fried Egg',
                                  style: TextStyle(
                                    color: ColorConstants.primaryBigTextColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '\$0.36',
                                  style: TextStyle(
                                      color:
                                          ColorConstants.bannerHeadingTextColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 15,
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
                                      '2',
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
                                      borderColor:
                                          ColorConstants.bannerHeadingTextColor,
                                      backgroundcolor:
                                          ColorConstants.bannerHeadingTextColor,
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
                  //Spacer(),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 30.sp),
                  //   child: CustomWidget.CustomPrimaryButton(borderradius: 5, backgroundcolor: ColorConstants.primaryButtonColor,height: 60.h,width: Get.width,context: context,title: 'Done',titlefontSize: 24.sp,titlecolor: Colors.white,titleFontWeight: FontWeight.w700),
                  // ),
                  // SizedBox(height: 40.h,),
                ],
              ),
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
