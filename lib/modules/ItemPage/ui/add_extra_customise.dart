import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

addExtraCustomizePage({required BuildContext context}) {
  return showDialog(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.all(5.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Choose an item - Beef Patty',
            style: TextStyle(
                color: ColorConstants.primaryButtonColor,
                fontSize: 18,
                fontFamily: "Advent Pro",
                fontWeight: FontWeight.w700),
          ),
          CustomWidget.customCloseSection(context: context),
        ],
      ),
      content: SizedBox(
        child: Container(
          // Specify some width
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250.h,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 130,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/extraFood.png",
                            height: 70,
                            width: 130,
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                backgroundColor: const Color(0xFF0FA958),
                                radius: 20.r,
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: FittedBox(
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      'Fried Egg Fried Egg',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: ColorConstants.primaryBigTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      '\$0.36',
                      style: GoogleFonts.roboto(
                        color: ColorConstants.bannerHeadingTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    14.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 20,
                            width: 25,
                            child: FittedBox(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 1,
                                  backgroundColor: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  // size: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          2.horizontalSpace,
                          Text(
                            '10',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: ColorConstants.primaryBigTextColor),
                          ),
                          2.horizontalSpace,
                          SizedBox(
                            height: 20,
                            width: 25,
                            child: FittedBox(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 1,
                                  backgroundColor:
                                      ColorConstants.bannerHeadingTextColor,
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  // size: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: context.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5AB99D)),
              child: const Text("Add"),
            ),
          ),
        ),
      ],
    ),
  );
}
