import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/modules/ItemPage/ui/item_screen_view.dart';
import 'package:self_order/modules/combo_screen_two/controller/combo_screen_two_logic.dart';
import 'package:self_order/modules/combo_screen_two/ui/combo_screen_two_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';

import '../../modules/Home/controller/home_screen_logic.dart';
import '../../modules/check_out/ui/check_out_view.dart';

class CustomWidget {
  static CustomButton({required String text, required Color color}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Dimensions.BorderRadius100),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.padding53,
            right: Dimensions.padding53,
            top: Dimensions.padding19,
            bottom: Dimensions.padding19),
        child: Text(
          text,
          style: TextStyle(
              fontSize: Dimensions.TextSize20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static CustomImageButton(
      {required String text,
      required Color color,
      required Image image,
      height = 90,
      width = 250}) {
    return Container(
      height: height * 1.0,
      width: width * 1.0,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Dimensions.BorderRadius10),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            SizedBox(
              width: 25.w,
            ),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  static CustomButtonInImage({required String text, required onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 56.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorConstants.primaryButtonColor,
            ),
            child: Center(
                child: Text(
              'Eat in',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: Dimensions.TextSize18,
                  color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }

  static CustomItemwithPrice({Tap}) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 15.0,
      childAspectRatio: 0.6,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(15, (index) {
        return GestureDetector(
          onTap: Tap != null ? Tap : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("assets/images/item.png"),
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue20,
              ),
              Text(
                'Chicken Burger',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.TextSize20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Chicken Burger',
                style: TextStyle(
                    color: ColorConstants.primaryBigTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.TextSize18),
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue25,
              ),
              Row(
                children: [
                  Text(
                    '\$9.00',
                    style: TextStyle(
                        color: ColorConstants.primaryBigTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.TextSize18),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(FeatherIcons.plus),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  static CustomTitleWithVariation() {
    HomeScreenController controller = Get.find();
    final orientation = MediaQuery.of(Get.context!).orientation;
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 4 : 5),
        itemCount: controller.categories.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () => Get.to(ItemPageScreen(
              id: controller.categories[index]['id'],
              name: controller.categories[index]['category_name'],
            )),
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.h, left: 30.w),
              child: Container(
                height: 209.h,
                width: 208.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: ColorConstants.primaryBigTextColor
                            .withOpacity(0.03),
                        offset: Offset(0, 9),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                        width: 208.w,
                        height: 100.h,
                        errorWidget: (context, url, error) =>
                            Image(image: AssetImage("assets/images/item.png")),
                        imageUrl: controller.categories[index]['base_url'] +
                            controller.categories[index]['sub_image']),
                    SizedBox(
                      height: Dimensions.SizedBoxValue20,
                    ),
                    Center(
                      child: Text(
                        '${controller.categories[index]['category_name']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.TextSize20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static CustomCloseSection({required BuildContext context}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 50,
        width: 50,
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 40,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: ColorConstants.primaryBigTextColor.withOpacity(0.2),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                  color: ColorConstants.primaryBigTextColor.withOpacity(.15),
                  blurRadius: 0.2,
                  offset: Offset(1, 1))
            ]),
      ),
    );
  }

  static ItemCountSection(quantity) {
    ItemScreenController controller = Get.find();
    return Row(
      children: [
        GestureDetector(
          onTap: () => controller.decreaseQuantity(),
          child: Container(
              height: 24,
              width: 37,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.white,
                  border:
                      Border.all(color: ColorConstants.primaryBigTextColor)),
              child: Icon(
                FeatherIcons.minus,
                size: Dimensions.TextSize15,
                color: ColorConstants.primaryBigTextColor,
              )),
        ),
        SizedBox(
          width: Dimensions.SizedBoxValue25,
        ),
        Text(
          '$quantity',
          style: TextStyle(
              fontSize: Dimensions.TextSize30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: Dimensions.SizedBoxValue25,
        ),
        GestureDetector(
          onTap: () => controller.increaseQuantity(),
          child: Container(
              height: 24,
              width: 37,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: ColorConstants.bannerHeadingTextColor,
                  border:
                      Border.all(color: ColorConstants.bannerHeadingTextColor)),
              child: Icon(
                FeatherIcons.plus,
                size: Dimensions.TextSize15,
                color: Colors.white,
              )),
        ),
      ],
    );
  }

  // static CustomcustomiseButton(
  //     {height, width, context, onTap, text = 'Customise'}) {
  //   return SizedBox(
  //     height: height,
  //     width: width,
  //     child: ElevatedButton(
  //       onPressed: () {
  //         onTap();
  //       },
  //       style: ButtonStyle(
  //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //             RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //           ),
  //           backgroundColor: MaterialStateProperty.all(
  //               ColorConstants.bannerHeadingTextColor)),
  //       child: Text(
  //         text,
  //         style: TextStyle(fontSize: Dimensions.TextSize30),
  //       ),
  //     ),
  //   );
  // }

  static CustomAddtoCartButton(
      {height, width, context, ontap, text = 'Add to cart'}) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: ontap != null ? ontap : null,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).buttonColor)),
        child: Text(
          text,
          style:
              TextStyle(fontSize: Dimensions.TextSize30, color: Colors.white),
        ),
      ),
    );
  }

  static CustomRedButton({height, width, context, ontap, text}) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: ontap != null ? ontap : null,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all(ColorConstants.redButtonColor)),
        child: Text(
          text,
          style:
              TextStyle(fontSize: Dimensions.TextSize30, color: Colors.white),
        ),
      ),
    );
  }

  static CustomOrderView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: Get.width / 1.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://img.freepik.com/free-photo/delicious-fried-chicken-plate_144627-27383.jpg',
                height: 158.h,
                width: 120.w,
              ),
              SizedBox(
                width: Dimensions.SizedBoxValue20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Beef Burger',
                      style: TextStyle(
                          fontSize: Dimensions.TextSize25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: Dimensions.SizedBoxValue15,
                    ),
                    Text(
                      '+ 1 Beef patty, or make a list non-nullable Miraz Khan | Arohi Mim | Jamrul Razu | Bangla New Natok 2022',
                      maxLines: 3,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: Dimensions.TextSize20,
                          color: ColorConstants.primaryBigTextColor
                              .withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: Dimensions.SizedBoxValue10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                '2X \$18.00',
                style: TextStyle(
                  fontSize: Dimensions.SizedBoxValue20,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(96),
                  color: ColorConstants.bannerHeadingTextColor,
                ),
                child: Center(
                  child: Text(
                    'Customise',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(96),
                  color: ColorConstants.priceborderColor,
                ),
                child: Center(
                  child: Text(
                    'Combo',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
            color: ColorConstants.bannerBackgroundColor,
            height: 8,
            endIndent: 100,
            indent: 165),
      ],
    );
  }

  static ComboCartView(comboItem, type) {
    ComboScreenControllertwo controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Dimensions.height65,
              width: 70.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(1),
                border: Border.all(color: ColorConstants.primaryButtonColor),
              ),
              child: Image(
                image: AssetImage('assets/images/bug.png'),
                height: Dimensions.height60,
                width: Dimensions.width70,
              ),
            ),
            SizedBox(
              width: Dimensions.SizedBoxValue20,
            ),
            Expanded(
              child: Text(
                '${comboItem['label']}',
                style: TextStyle(
                    fontSize: Dimensions.TextSize25,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              width: Dimensions.SizedBoxValue30,
            ),
            (type == 'main')
                ? Text(
                    '\$${controller.productTotal.value + int.parse(comboItem['price'])}',
                    style: TextStyle(
                      fontSize: Dimensions.TextSize25,
                    ),
                  )
                : Text(
                    '\$${int.parse(comboItem['price'])}',
                    style: TextStyle(
                      fontSize: Dimensions.TextSize25,
                    ),
                  ),
            SizedBox(
              width: 30.w,
            ),
            GestureDetector(
              onTap: () {
                switch (type) {
                  case 'main':
                    controller.currentStatus.value = 1;
                    Get.to(ComboScreenViewTwo());
                    break;
                  case 'side':
                    controller.currentStatus.value = 2;
                    Get.to(ComboScreenViewTwo());
                    break;
                  case 'drink':
                    controller.currentStatus.value = 3;
                    Get.to(ComboScreenViewTwo());
                    break;
                  default:
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(96),
                  color: ColorConstants.bannerHeadingTextColor,
                ),
                child: Center(
                  child: Text(
                    'Change',
                    style: TextStyle(
                        fontSize: Dimensions.TextSize20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
            color: ColorConstants.bannerBackgroundColor,
            height: 8,
            endIndent: 100,
            indent: 165),
      ],
    );
  }

  static CustomCartModalBottomSheet({context}) {
    return Column(
      children: [
        Container(
          height: Dimensions.height80,
          color: ColorConstants.primaryBigTextColor.withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
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
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
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
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
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
                    ontap: () {
                      Get.to(CheckoutScreen());
                    }),
              ],
            ),
          ),
        )
      ],
    );
  }

  static CustomComboPackName({context, img, flag}) {
    return Container(
      height: 92,
      width: 342,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: ColorConstants.selectedDesire),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            img,
            SizedBox(
              width: 15,
            ),
            Text(
              flag == 0
                  ? 'Small Combo'
                  : flag == 1
                      ? 'Medium Combo'
                      : 'Large Combo',
              style: TextStyle(
                  color: ColorConstants.primaryBigTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  static CustomComboPackItem({context, menu}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CachedNetworkImage(
            errorWidget: (context, url, error) =>
                Image(image: AssetImage("assets/images/item.png")),
            imageUrl: menu['base_url'] + menu['label_image']),
        SizedBox(
          height: Dimensions.SizedBoxValue20,
        ),
        Text(
          '${menu['label']}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.TextSize25,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              '\$${menu['price']}',
              style: TextStyle(
                  color: ColorConstants.primaryBigTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.TextSize20),
            ),
            SizedBox(
              width: 60,
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.08),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(FeatherIcons.plus),
            )
          ],
        )
      ],
    );
  }

  static CustomComboCart(
      {context, itemName, extraItemName, quantity, Itemprice}) {
    List count = [1, 2, 3, 4, 5];
    return Column(children: [
      Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstants.primaryBigTextColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
          child: Row(
            children: [
              Text(
                'My order (Eat in)',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              Spacer(),
              Text(
                'Total:  \$20.00',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Container(
        height: 200,
        child: ResponsiveGridList(
            desiredItemWidth: 200,
            minSpacing: 40,
            children: count.map((i) {
              return Container(
                  height: 90,
                  alignment: Alignment(0, 0),
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: ColorConstants.cartImageBorderColor),
                          ),
                          child: Image(
                            image: AssetImage("assets/images/bug.png"),
                            height: 60,
                            width: 80,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'Beef Burger',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '+ 1 Beef patty',
                            style: TextStyle(
                                color: ColorConstants.primaryBigTextColor
                                    .withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '1X    \$9.00',
                            style: TextStyle(
                                color: ColorConstants.primaryBigTextColor,
                                fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ));
            }).toList()),
      ),
    ]);
  }

///////////////////new //////////////////
  static customTextField({
    context,
    name,
    labelText,
    obscureText,
    validator,
    verticalPadding = 20,
    horizontalPadding = 10,
    TextType = 'text',
    borderColor,
    helperTextColor,
    helperTextFontSize,
    changed,
    helperTextFontWeight = FontWeight.w400,
  }) {
    return FormBuilderTextField(
      obscureText: obscureText,
      keyboardType:
          TextType == 'number' ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          labelText: labelText,
          labelStyle: TextStyle(
              color: helperTextColor,
              fontSize: helperTextFontSize,
              fontWeight: helperTextFontWeight),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: borderColor,
              width: 2.0,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: borderColor,
              width: 2.0,
            ),
          )),
      validator: validator,
      name: name,
      onChanged: changed,
    );
  }

  static CustomPrimaryButton(
      {context,
      height,
      width,
      title,
      titleFontWeight,
      titlefontSize,
      borderradius,
      backgroundcolor,
      titlecolor = Colors.white,
      buttonType = "text",
      image,
      icon,
      Color? borderColor}) {
    return Container(
      height: height * 1.0,
      width: width * 1.0,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius * 1.0),
        color: backgroundcolor,
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: buttonType == 'text'
          ? Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: titlefontSize,
                    fontWeight: titleFontWeight,
                    color: titlecolor),
              ),
            )
          : buttonType == 'image'
              ? image
              : icon,
    );
  }
}
