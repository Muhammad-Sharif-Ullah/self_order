import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/shared/constants/colors.dart';

import '../../base_widget.dart';
import '../controller/cart_screen_logic.dart';

class CartScreen extends GetView<CartScreenController>{
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<CartScreenController>(CartScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Container(
            child:Column(
              children: [
                Container(
                  height: 50,
                  color: ColorConstants.primaryBigTextColor.withOpacity(0.5),
                )
              ],
            ),
          ),

        ),
      ),
    );
  }


}