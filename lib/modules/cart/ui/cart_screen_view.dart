import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

import '../../base_widget.dart';
import '../../check_out/ui/check_out_view.dart';
import '../controller/cart_screen_logic.dart';

class CartScreen extends GetView<CartScreenController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<CartScreenController>(CartScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              Container(
                height: Dimensions.height80,
                color: ColorConstants.primaryBigTextColor.withOpacity(0.5),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: Row(
                    children: [
                      Text(
                        'My order (Eat in)',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.TextSize25),
                      ),
                      Spacer(),
                      Text(
                        'Total:  \$72.00',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.TextSize25),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue30,
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: GridView.count(
                    //  shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    physics: ScrollPhysics(),
                    children: List.generate(
                      70,
                      (index) {
                        return CustomWidget.CustomOrderView();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: Row(
                    children: [
                      CustomWidget.CustomRedButton(
                          height: 60.0,
                          width: 320.0,
                          text: 'Cancel Order',
                          context: context),
                      Spacer(),
                      CustomWidget.CustomAddtoCartButton(
                          height: 60.0,
                          width: 320.0,
                          text: 'Done',
                          context: context,
                        ontap: (){
                            Get.to(CheckoutScreen());
                        }
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
