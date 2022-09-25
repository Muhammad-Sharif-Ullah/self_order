import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/banner_combo_controller.dart';

class BannerComboPage extends GetView<BannerComboController> {
  const BannerComboPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          MediaQuery.of(context).padding.top.verticalSpace,
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back"),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Combo',
                      style: TextStyle(
                          fontFamily: 'Advent Pro',
                          fontSize: 30.sp,
                          color: const Color(0xFF5AB99D),
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Make Your Combo',
                      style: TextStyle(
                          fontFamily: 'Advent Pro',
                          fontSize: 15.sp,
                          color: const Color(0xFF5AB99D),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          10.verticalSpace,
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return 10.verticalSpace;
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.teal.shade100,
                height: 190.h,
              );
            },
          )),
        ],
      ),
    );
  }
}
