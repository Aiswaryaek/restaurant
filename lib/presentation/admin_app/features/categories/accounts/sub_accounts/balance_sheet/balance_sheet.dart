// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/balance_sheet.dart';
import '../../../../../widgets/custom_bordered_drop_down.dart';
import '../../../../../widgets/profit_and_loss_expansion_table_layout.dart';

class BalanceSheet extends StatefulWidget {
  const BalanceSheet({super.key});

  @override
  State<BalanceSheet> createState() => _BalanceSheetState();
}

class _BalanceSheetState extends State<BalanceSheet> {
  List<String> particularAsset = [
    'Receivables',
    'Bank & Cash',
    'Current Asset',
    'Non Current Asset',
    'Pre payments',
    'Fixed Assets',
  ];
  List<String> subAsset = [
    'QR 20000.00',
    'QR 15000.00',
    'QR 2000.00',
    'QR 11000.00',
    'QR 5000.00',
    'QR 1050000.00',
  ];
  List<String> particularEquity = [
    'Current Year Earnings',
    'Equity',
  ];
  List<String> subEquity = [
    'QR 550000.00',
    'QR 400000.00',
  ];
  List<String> particularLiability = [
    'Payable',
    'Credit Card',
    'Current Liability',
    'Non Current Liability'
  ];
  List<String> subLiability = [
    'QR 120000.00',
    'QR 15000.00',
    'QR 6000.00',
    'QR 12000.00'
  ];

  List<String> particularReceivables = [
    'Vendor Receivable',
    'Rent Receivable',
    'Interest Receivable',
  ];
  List<String> subReceivables = [
    'QR 15000.00',
    'QR 1000.00',
    'QR 4000.00',
  ];
  List<String> particularBankAndCash = ['SBI', 'Petty Cash', 'ICICI', 'SIB'];
  List<String> subBankAndCash = [
    'QR 5000.00',
    'QR 2000.00',
    'QR 3000.00',
    'QR 5000.00'
  ];
  List<String> particularCurrentAsset = [
    'Salary Advance',
    'Tax Advance',
    'Closing Stock',
    'Short Term Investment'
  ];
  List<String> subCurrentAssets = [
    'QR 500.00',
    'QR 300.00',
    'QR 700.00',
    'QR 500.00'
  ];
  List<String> particularNonCurrentAsset = [
    'Long Term Investment',
    'Fixed Deposit',
  ];
  List<String> subNonCurrentAssets = [
    'QR 3000.00',
    'QR 8000.00',
  ];
  List<String> particularPrePayments = [
    'Prepaid Rent',
    'Prepaid Credit Card Bill',
  ];
  List<String> subPrePayments = [
    'QR 11000.00',
    'QR 5000.00',
  ];
  List<String> particularFixedAssets = [
    'Land',
    'Building',
    'Heavy Machinery',
    'Vehicle',
    'Computers',
    'Furniture & Fixtures',
    'Softwear'
  ];
  List<String> subFixedAssets = [
    'QR 30000.00',
    'QR 25000.00',
    'QR 300000.00',
    'QR 100000.00',
    'QR 15000.00',
    'QR 15000.00',
    'QR 225000.00'
  ];

  bool isReceivable = false;
  bool isBankAndCash = false;
  bool isCurrentAsset = false;
  bool isNonCurrentAsset = false;
  bool isPrePayment = false;
  bool isFixedAssets = false;
  dynamic item;
  final dynamic settingsDropDownFixedHeight = AppScreenUtil().screenHeight(22);
  bool isExpanded = false;
  dynamic particularIndex = 0;
  List<bool> isTappedList = List.generate(6, (index) => true);
  dynamic tappedItemName = 'Receivables';


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance Sheet ( 31/12/2023 )',
            style: tableTitleLabelStyle,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          Column(
            children: [
              ///Table heading
              Container(
                height: AppScreenUtil().screenHeight(23),
                // width: AppScreenUtil().screenWidth(518),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppScreenUtil().screenWidth(6)),
                      topRight:
                          Radius.circular(AppScreenUtil().screenWidth(6))),
                  color: blackColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(30)),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Container(
                        color: Colors.transparent,
                        width: double.infinity,
                        child: Text(
                          'Particular',
                          style: placeOrderingAndConfirmPaymentButtonLabelStyle,
                          maxLines: 1,
                        ),
                      )),
                      Expanded(
                        child: Container(
                            color: Colors.transparent,
                            width: double.infinity,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '2023',
                                style:
                                    placeOrderingAndConfirmPaymentButtonLabelStyle,
                                maxLines: 1,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              //
              ///subHeading
              Container(
                  height: AppScreenUtil().screenHeight(23),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(10)),
                  decoration: BoxDecoration(
                    color: assetBackgroundColor,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Asset',
                      style: placeOrderingAndConfirmPaymentButtonLabelStyle,
                      maxLines: 1,
                    ),
                  )),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(particularAsset.length, (index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            isTappedList[index] = !isTappedList[index];
                            tappedItemName = particularAsset[index];
                            // isTappedList[index] = isTappedToExpand;
                          });
                          // print('Inside Container ${isTappedList[index]}');
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          height: isTappedList[index]
                              ? AppScreenUtil().screenHeight(25)
                              : AppScreenUtil().screenHeight(190),
                          padding: EdgeInsets.fromLTRB(20, 6, 15, 5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: salesReportTableColor,
                              border: const Border(
                                  bottom: BorderSide(
                                      color: whiteColor, width: 0.5))),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(particularAsset[index],
                                          style: salesReportSubTitleLabelStyle),
                                      Text(
                                        subAsset[index],
                                        style: salesReportSubTitleLabelStyle,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: AppScreenUtil().screenHeight(8),),
                                  Column(
                                    children:List.generate( tappedItemName == 'Receivables'
                                        ? particularReceivables.length
                                        : tappedItemName == 'Bank & Cash'
                                        ? particularBankAndCash.length
                                        : tappedItemName == 'Current Asset'
                                        ? particularCurrentAsset.length
                                        : tappedItemName == 'Non Current Asset'
                                        ? particularNonCurrentAsset.length
                                        : tappedItemName == 'Pre payments'
                                        ? particularPrePayments.length
                                        : tappedItemName ==
                                        'Fixed Assets'
                                        ? particularFixedAssets.length
                                        : particularReceivables.length, (index) {
                                      return Container(
                                        height: AppScreenUtil().screenHeight(25),
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            color: whiteColor,
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: profitAndLossTableColor,
                                                    width: 0.5))),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10,right:10,top: 7),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                tappedItemName == 'Receivables'
                                                    ? particularReceivables[index]
                                                    : tappedItemName == 'Bank & Cash'
                                                    ? particularBankAndCash[index]
                                                    : tappedItemName == 'Current Asset'
                                                    ? particularCurrentAsset[index]
                                                    : tappedItemName == 'Non Current Asset'
                                                    ? particularNonCurrentAsset[index]
                                                    : tappedItemName == 'Pre payments'
                                                    ? particularPrePayments[index]
                                                    : tappedItemName ==
                                                    'Fixed Assets'
                                                    ? particularFixedAssets[index]
                                                    : particularReceivables[index],
                                                style: profitAndLossTableSubLabelStyle(
                                                    labelColor: blackColor),
                                              ),
                                              Text(
                                                tappedItemName == 'Receivables'
                                                    ? subReceivables[0]
                                                    : tappedItemName == 'Bank & Cash'
                                                    ? subBankAndCash[0]
                                                    : tappedItemName == 'Current Asset'
                                                    ? subCurrentAssets[0]
                                                    : tappedItemName == 'Non Current Asset'
                                                    ? subNonCurrentAssets[0]
                                                    : tappedItemName == 'Pre payments'
                                                    ? subPrePayments[0]
                                                    : tappedItemName ==
                                                    'Fixed Assets'
                                                    ? subFixedAssets[0]
                                                    :subReceivables[0],
                                                style: profitAndLossTableSubLabelStyle(
                                                    labelColor: blackColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  )
                                ],
                              )),
                        ));
                  }))
            ],
          ),
        ],
      ),
    );
  }
}
