import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../base_widget.dart';
import '../controller/item_screen_logic.dart';

class ItemPageScreen extends GetView<ItemScreenController> {
  const ItemPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<ItemScreenController>(ItemScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage("assets/images/itempag.png"),
                    height: 298,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: Dimensions.SizedBoxValue20,
                    right: Dimensions.SizedBoxValue15,
                    child: CustomWidget.CustomButtonInImage(
                        text: 'Eat in', onTap: () {}),
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Text(
                  'Burger',
                  style: TextStyle(
                      fontSize: Dimensions.TextSize30,
                      fontWeight: FontWeight.w700,
                      color: ColorConstants.primaryBigTextColor),
                ),
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue30,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.SizedBoxValue30),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/smallburger.png'),
                                    height: 70,
                                    width: 76,
                                  ),
                                ),
                                Text('Dumpling'),
                              ],
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2,
                              physics: NeverScrollableScrollPhysics(),
                              children: List.generate(7, (index) {
                                return foodVarision(text: 'Club Beef');
                              }),
                            ),
                            SizedBox(
                              height: Dimensions.SizedBoxValue30,
                            ),
                            CustomWidget.CustomItemwithPrice(onTap: userChoice(context: context)),
                          ]),
                        ),
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

  Widget foodVarision({required String text})
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
            color: ColorConstants.borderColor.withOpacity(0.2), width: 3),
      ),
      child: Center(child: Text(text)),
    );
  }

  userChoice({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          child: Text('hello'),
        ),
      ),
    );
  }
}
