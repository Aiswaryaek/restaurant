// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/utility/forgot_password_settings/forgot_password_settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/utility/payment_type_and_amount/payment_type_and_amount.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/utility/shift_Transfer/shift_transfer.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/utility/stock_corrections/stock_corrections.dart';

import '../../../../../../../models/product_categories_model.dart';
import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../utiles/image_constant.dart';
import '../../../../../widgets/colored_dropdown.dart';
import '../../../../../widgets/company_settings_table.dart';
import '../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../widgets/outlined_table.dart';

class Utility extends StatefulWidget {
  const Utility({super.key});

  @override
  State<Utility> createState() => _UtilityState();
}

class _UtilityState extends State<Utility> {
  final tabHead = <ProductCategoriesModel>[];
  int? tappedProduct;
  dynamic currentTab;

  @override
  void initState() {
    tabHead.add(ProductCategoriesModel('Stock Corrections',''));
    tabHead.add(ProductCategoriesModel('Payment Type & Amount',''));
    tabHead.add(ProductCategoriesModel('Shift Transfer',''));
    tabHead.add(ProductCategoriesModel('Forgot Password Settings',''));
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
                    height: 24,
                    width: tabHead[index].text == 'Forgot Password Settings'
                        ? AppScreenUtil().screenWidth(130)
                        : tabHead[index].text == 'Payment Type & Amount'
                        ? AppScreenUtil().screenWidth(132)
                        : AppScreenUtil().screenWidth(115),
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
              ? StockCorrections()
              : tappedProduct == 1
              ? PaymentTypeAndAmount()
              : tappedProduct == 2
              ? ShiftTransfer()
              : tappedProduct == 3
              ? ForgotPasswordSettings()
              : SizedBox(),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          ),
        ],
      ),
    );
  }
}
