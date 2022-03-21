import 'package:flutter/material.dart';

import '../../../shared/constants/Dimensions.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/customWidget_utils.dart';
import 'item_customise_dialog.dart';

uerChoiceDialog(
    {required BuildContext context,
    required String heading,
    required String subHeading,
    required String price}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),), //this right here
          child: Container(
            height: Dimensions.userChoiceDialogHeight,
            width: Dimensions.userChoiceDialogWidth,
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.SizedBoxValue30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.SizedBoxValue30),
                  child: Row(
                    children: [
                      Text(
                        'Make your choice',
                        style: TextStyle(
                            color: ColorConstants.primaryButtonColor,
                            fontSize: Dimensions.TextSize30),
                      ),
                      Spacer(),
                      CustomWidget.CustomCloseSection(context: context),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.SizedBoxValue30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(
                          "assets/images/item.png",
                        ),
                        height: 158,
                        width: 212,
                      ),
                      SizedBox(
                        width: Dimensions.SizedBoxValue30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            heading,
                            style: TextStyle(
                                color: ColorConstants.primaryBigTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.TextSize30),
                          ),
                          SizedBox(
                            height: Dimensions.SizedBoxValue8,
                          ),
                          Text(
                            subHeading,
                            style: TextStyle(
                                color: ColorConstants.primaryBigTextColor
                                    .withOpacity(0.5),
                                fontSize: Dimensions.TextSize30),
                          ),
                          SizedBox(
                            height: Dimensions.SizedBoxValue15,
                          ),
                          Text(
                            price,
                            style: TextStyle(
                                color: ColorConstants.bannerHeadingTextColor
                                    .withOpacity(0.5),
                                fontSize: Dimensions.TextSize30),
                          ),
                          SizedBox(
                            height: Dimensions.SizedBoxValue15,
                          ),
                          CustomWidget.ItemCountSection(),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: Row(
                    children: [
                      CustomWidget.CustomcustomizeButton(
                        height: 60.0,
                        width: 253.0,
                        context: context,
                        onTap: () {
                          Navigator.of(context).pop();
                          itemCustomiseDialog(context: context);
                        },
                      ),
                      Spacer(),
                      CustomWidget.CustomAddtoCartButton(
                          height: 60.0, width: 253.0, context: context),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
