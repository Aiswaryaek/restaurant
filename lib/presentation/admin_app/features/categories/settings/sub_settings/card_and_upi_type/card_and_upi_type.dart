// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/card_and_upi_type/card_auto/card_auto.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/card_and_upi_type/cheque/cheque.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/card_and_upi_type/upi_manual/upi_manual.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_textfield.dart';

import '../../../../../../../models/product_categories_model.dart';
import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../utiles/image_constant.dart';
import 'card_manual/card_manual.dart';

class CardAndUpiType extends StatefulWidget {
  const CardAndUpiType({super.key});

  @override
  State<CardAndUpiType> createState() => _CardAndUpiTypeState();
}

class _CardAndUpiTypeState extends State<CardAndUpiType> {
  final tabHead = <ProductCategoriesModel>[];
  int? tappedProduct;
  dynamic currentTab;

  @override
  void initState() {
    tabHead.add(ProductCategoriesModel('Card Manual',''));
    tabHead.add(ProductCategoriesModel('UPI Manual',''));
    tabHead.add(ProductCategoriesModel('Cheque',''));
    tabHead.add(ProductCategoriesModel('Card Auto',''));
    tappedProduct = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 8, 0, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.transparent,
            height: 21,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tabHead.length,
              itemBuilder: (context, index) => InkWell(
                child: Container(
                    padding: EdgeInsets.only(bottom: 2),
                    height: AppScreenUtil().screenHeight(24),
                    width: AppScreenUtil().screenWidth(101),
                    decoration: BoxDecoration(
                        color: tappedProduct == index
                            ? blackColor
                            : whiteColor,
                        borderRadius: BorderRadius.circular(11)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(tabHead[index].text,
                          style: tappedProduct == index
                              ? inventoryCreateButtonLabelStyle
                              : subCompanySettingsTextStyle,
                          textAlign: TextAlign.center),
                    )),
                ////
                onTap: () {
                  setState(() {
                    tappedProduct = index;
                    currentTab = tabHead[index].text;
                  });
                  print('Tapped time:$currentTab');
                },
              ),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 3);
              },
            ),
          ),
          Transform.translate(
              offset: Offset(0, -9),
              child: Padding(
                padding: EdgeInsets.only(left: 7, right: 8),
                child: Divider(
                  color: blackColor,
                  thickness: 1.5,
                ),
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(5),
          ),
          tappedProduct == 0
              ? CardManual()
              : tappedProduct == 1
              ? UpiManual()
              : tappedProduct == 2
              ? Cheque():tappedProduct == 3
              ? CardAuto()
              : SizedBox(),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
        ],
      ),
    );
  }
}
