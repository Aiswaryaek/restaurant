// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_report/payment/payment.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_report/payment_summary/payment_summary.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_report/product_summary/product_summary.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_report/sale/sale.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_report/wallet/wallet.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../utiles/image_constant.dart';
import '../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../widgets/inventory_bottom_sheet_item_layout.dart';

class ShiftReport extends StatefulWidget {
  const ShiftReport({super.key});

  @override
  State<ShiftReport> createState() => _ShiftReportState();
}

class _ShiftReportState extends State<ShiftReport> {
  final branchController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  int currentTabIndex = 0;
  List<String> tabs = [
    'Sale',
    'Payment',
    'Wallet',
    'Product Summary',
    'Payment Summary'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomTextFieldWithTitle(
                          controller: branchController, title: 'Branch')),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Shift',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ))
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    width: 83,
                    height: 24,
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: blackColor)),
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Submit',
                          style: inventoryCreateButtonLabelStyle,
                          textAlign: TextAlign.center),
                    )),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Container(
                // height: AppScreenUtil().screenHeight(99),
                width: double.infinity,
                color: shiftContainerColor,
                padding: EdgeInsets.fromLTRB(10, 10, 15, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jabel Ali',
                      style: pangramMedium(size: 14.0, color: blackColor),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(9),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shift',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(7),
                                ),
                                Text(
                                  'Employee',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(10),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SHIFT 21',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(7),
                                ),
                                Text(
                                  'Jabel Ali',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Start Date',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(7),
                                ),
                                Text(
                                  'End Date',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(10),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '2024-05-08 10:06:00',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(7),
                                ),
                                Text(
                                  '2024-05-08 10:09:07',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
              Container(
                color: Colors.transparent,
                height: 23,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        currentTabIndex = index;
                      });
                    },
                    child: Container(
                        width: AppScreenUtil().screenWidth(101),
                        height: AppScreenUtil().screenHeight(24),
                        decoration: BoxDecoration(
                            color: currentTabIndex == index
                                ? blackColor
                                : whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(tabs[index],
                              style: currentTabIndex == index
                                  ? cartSelectedTabLabelTextStyle
                                  : categoryMenuTextStyle,
                              textAlign: TextAlign.center),
                        )),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox();
                  },
                ),
              ),
              Transform.translate(
                  offset: Offset(0, -9),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 9),
                    child: Divider(
                      color: blackColor,
                      thickness: 1.5,
                    ),
                  )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 40),
          child: currentTabIndex == 0
              ? SaleTab()
              : currentTabIndex == 1
                  ? PaymentTab()
                  : currentTabIndex == 2
                      ? WalletTab()
                      : currentTabIndex == 3
                          ? ProductSummaryTab()
                          : PaymentSummaryTab(),
        )
      ],
    );
  }
}
