import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import '../../../shared/constants/Dimensions.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/customWidget_utils.dart';

class ItemCustomisePage extends StatelessWidget {

  ItemScreenController controller = Get.put(ItemScreenController());

   ItemCustomisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return SafeArea(child: Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         SizedBox(
           height: 60.h,
         ),
         Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
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
         /// previous start  ///
         // Padding(
         //   padding:
         //   EdgeInsets.symmetric(horizontal: Dimensions.padding30),
         //   child: Row(
         //     children: [
         //       Container(
         //         height: Dimensions.height90,
         //         width: Dimensions.width100,
         //         child: Center(
         //           child: Image(
         //             image: AssetImage("assets/images/item.png"),
         //             height: Dimensions.height90,
         //             width: Dimensions.width90,
         //           ),
         //         ),
         //       ),
         //       SizedBox(
         //         width: 18,
         //       ),
         //       Column(
         //         crossAxisAlignment: CrossAxisAlignment.start,
         //         children: [
         //           Text(
         //             'Beef Burger',
         //             style: TextStyle(
         //                 color: ColorConstants.primaryBigTextColor,
         //                 fontSize: Dimensions.TextSize18,
         //                 fontWeight: FontWeight.bold),
         //           ),
         //           SizedBox(
         //             height: Dimensions.SizedBoxValue2,
         //           ),
         //           Text(
         //             'Beef with cheese',
         //             style: TextStyle(
         //                 color: ColorConstants.primaryBigTextColor,
         //                 fontSize: Dimensions.TextSize18,
         //                 fontWeight: FontWeight.w400),
         //           ),
         //         ],
         //       ),
         //       Spacer(),
         //       Text(
         //         'Total:  \$18.36',
         //         style: TextStyle(
         //             fontSize: Dimensions.TextSize20,
         //             fontWeight: FontWeight.w400,
         //             color: ColorConstants.primaryBigTextColor),
         //       ),
         //     ],
         //   ),
         // ),
         // SizedBox(
         //   height: Dimensions.SizedBoxValue30,
         // ),
         // Padding(
         //   padding:
         //   EdgeInsets.symmetric(horizontal: Dimensions.padding30),
         //   child: Container(
         //     //color: Colors.red,
         //     height: Dimensions.height250,
         //     child: ListView.builder(
         //       itemCount: 4,
         //       scrollDirection: Axis.horizontal,
         //       itemBuilder: (context, index) {
         //         return Padding(
         //           padding: EdgeInsets.only(right: 70),
         //           child: Column(
         //             children: [
         //               Container(
         //                 height: Dimensions.height70,
         //                 width: Dimensions.width130,
         //                 decoration: BoxDecoration(
         //                   borderRadius: BorderRadius.circular(10),
         //                   color:
         //                   ColorConstants.customizeBackgroundColor,
         //                 ),
         //                 child: Image(
         //                   image: AssetImage("assets/images/meat.png"),
         //                   height: Dimensions.height60,
         //                   width: Dimensions.width110,
         //                 ),
         //               ),
         //               SizedBox(
         //                 height: Dimensions.SizedBoxValue15,
         //               ),
         //               Text(
         //                 'Fried Egg',
         //                 style: TextStyle(
         //                   fontSize: Dimensions.TextSize20,
         //                 ),
         //               ),
         //               SizedBox(
         //                 height: Dimensions.SizedBoxValue15,
         //               ),
         //               Text(
         //                 '\$0.36',
         //                 style: TextStyle(
         //                     color:
         //                     ColorConstants.bannerHeadingTextColor,
         //                     fontSize: Dimensions.TextSize20),
         //               ),
         //               SizedBox(
         //                 height: Dimensions.SizedBoxValue15,
         //               ),
         //               CustomWidget.ItemCountSection(),
         //               SizedBox(
         //                 height: Dimensions.SizedBoxValue30,
         //               ),
         //             ],
         //           ),
         //         );
         //       },
         //     ),
         //   ),
         // ),
         // CustomWidget.CustomAddtoCartButton(
         //     height: Dimensions.height60 * 1.0,
         //     width: Dimensions.width579,
         //     context: context,
         //     ontap: () {
         //       WidgetsBinding.instance?.addPostFrameCallback((_){
         //         //  Get.to(CartScreen());
         //       });
         //
         //     }),
        /// previous end///
        SizedBox(height: 30.h,),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 30.w),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //
        //       Image(image: AssetImage("assets/images/customisebug.png"),height: 109,width: 147,),
        //       SizedBox(width: 32.w,),
        //       SizedBox(
        //         child: Column(
        //           children: [
        //             Text('Beef Burger',style: TextStyle(color: ColorConstants.primaryBigTextColor,fontWeight: FontWeight.w700,fontSize: 24.sp),),
        //             SizedBox(height: 35.h,),
        //             ResponsiveGridList(
        //                 desiredItemWidth: 147,
        //                 minSpacing: 35,
        //                 children: [1,2,3,4,5].map((i) {
        //                   return Container(
        //                   child: Text('h'),
        //                   );
        //                 }).toList())
        //           ],
        //         ),
        //       )
        //
        //     ],
        //   ),
        // )
        SizedBox(height:50.h,),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text('Add extra:',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24.sp,),)),
         SizedBox(height: 30.h,),
         Expanded(
           child: ResponsiveGridList(
               desiredItemWidth: 147,
               minSpacing: 62,
               children: controller.extraFood.map((i) {
                 return Column(
                   children: [
                     Image(image: AssetImage("assets/images/extraFood.png"),height: 70,width: 130,)

                   ],
                 );
               }).toList()),
         )



       ],
     )
   ));
  }
}

