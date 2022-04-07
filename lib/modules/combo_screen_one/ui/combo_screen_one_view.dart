import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import '../../base_widget.dart';
import '../controller/combo_screen_one_logic.dart';

class ComboScreenOne extends GetView<ComboScreenController> {
  const ComboScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<ComboScreenController>(ComboScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              Image(image: AssetImage("assets/images/combo_one.png"),height: 180,width: double.infinity,),
              SizedBox(height: 43,),
              Text('Choose your desire',style: TextStyle(color: ColorConstants.primaryBigTextColor,fontWeight: FontWeight.w700,fontSize: 24),),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customDesire(imageName: Image(image: AssetImage("assets/images/small_type.png"),),),
                    customDesire(imageName: Image(image: AssetImage("assets/images/medium_type.png"),),),
                    customDesire(imageName: Image(image: AssetImage("assets/images/large_type.png"),),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  customDesire({imageName}) {
    return InkWell(
      onTap: null,
      child: Container(
        height: 167,
        width: 208,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(11),color: ColorConstants.unselectedDesire),
        child: imageName
      ),
    );
  }
}
