import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../AddDrink/ui/add_drink_screen_view.dart';
import '../../base_widget.dart';
import '../controller/add_side_screen_logic.dart';

class AddSidesScreen extends GetView<AddSidesScreenController> {
  int itemtype;
  AddSidesScreen({Key? key, required this.itemtype}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<AddSidesScreenController>(AddSidesScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("assets/images/combobg.png"),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.SizedBoxValue30),child:  CustomWidget.CustomComboPackName(
                context: context,
                flag: itemtype,
                img: Image(
                  image: AssetImage("assets/images/large_type.png"),
                  height: 79,
                  width: 119,
                ),
              ),),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.SizedBoxValue30),
                  child: Text('Choose a Sides',style: TextStyle(color: ColorConstants.primaryBigTextColor,fontWeight: FontWeight.w700,fontSize: 24),)),
              SizedBox(height: Dimensions.SizedBoxValue30,),
              Expanded(
                child: ResponsiveGridList(
                    desiredItemWidth: 147,
                    minSpacing: 35,
                    children: controller.count.map((i) {
                      return Container(
                          height: 270,
                          alignment: Alignment(0, 0),
                          color: Colors.white,
                          child: CustomWidget.CustomComboPackItem(
                            context: context,
                            image: Image(
                              image: AssetImage("assets/images/side.png"),
                            ),
                          ));
                    }).toList()),
              ),
              SizedBox(height: Dimensions.SizedBoxValue10,),
             CustomWidget.CustomComboCart(context: context,quantity: 2,Itemprice: '100',extraItemName: 'Bee'),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.SizedBoxValue30),
                child: Row(
                  children: [
                    CustomWidget.CustomPrimaryButton(context: context,width: 320, height: 60, borderradius: 5,backgroundcolor: ColorConstants.bannerBackgroundColor,title: 'Cancel Order',titlecolor: Colors.white),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        Get.to(AddDrinkScreenView(itemtype: itemtype,));
                      },
                      child:CustomWidget.CustomPrimaryButton(context: context,width: 320, height: 60, borderradius: 5,backgroundcolor: ColorConstants.primaryButtonColor,title: 'Confirm',titlecolor: Colors.white),
                    )


                  ],
                ),
              ),
              SizedBox(height: 10,),


            ],
          ),
        ),
      ),
    );
  }
}
