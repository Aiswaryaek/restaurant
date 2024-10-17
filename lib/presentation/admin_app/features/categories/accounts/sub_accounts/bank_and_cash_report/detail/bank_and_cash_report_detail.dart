// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/account_payable/create/account_payable.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class BankAndCashReportDetail extends StatefulWidget {
  const BankAndCashReportDetail({super.key});

  @override
  State<BankAndCashReportDetail> createState() =>
      _BankAndCashReportDetailState();
}

class _BankAndCashReportDetailState extends State<BankAndCashReportDetail> {
  List<String> date = [
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
  ];

  List<String> journal = [
    'JRN/32',
    'JRN/32',
    'JRN/32',
    'JRN/32',
    'JRN/32',
    'JRN/32',
    'JRN/32',
    'JRN/32',
    'JRN/32',
    'JRN/32',
  ];
  List<String> reference = [
    'P/PCJ/2024/01/1',
    'P/PCJ/2024/01/1',
    'P/PCJ/2024/01/1',
    'P/PCJ/2024/01/1',
    'P/PCJ/2024/01/1',
    'P/PCJ/2024/01/1',
    'P/PCJ/2024/01/1',
    'P/PCJ/2024/01/1',
    'P/PCJ/2024/01/1',
    'P/PCJ/2024/01/1',
  ];
  List<String> debit = [
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
  ];

  List<String> credit = [
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
  ];
  List<String> balance = [
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
  ];
  bool tappedDetail = false;

  @override
  Widget build(BuildContext context) {
    return tappedDetail == true
        ? AccountPayable()
        : Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ///Table heading
                          Container(
                            height: AppScreenUtil().screenHeight(25),
                            width: AppScreenUtil().screenWidth(650),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      AppScreenUtil().screenWidth(6)),
                                  topRight: Radius.circular(
                                      AppScreenUtil().screenWidth(6))),
                              color: blackColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil().screenWidth(18)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Date',
                                            style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                            maxLines: 1,
                                          ),
                                        ],
                                      )),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Journal',
                                          style:
                                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Reference',
                                          style:
                                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Debit',
                                          style:
                                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Credit',
                                            style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                            maxLines: 1,
                                          ),
                                        ],
                                      )),
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Balance',
                                            style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                            maxLines: 1,
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Column(
                              children: List.generate(date.length, (index) {
                            return InkWell(
                              child: Container(
                                height: AppScreenUtil().screenHeight(30),
                                width: AppScreenUtil().screenWidth(650),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          tableOutlinedColor.withOpacity(0.7),
                                      width: 0.8),
                                  color: whiteColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppScreenUtil().screenWidth(18)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            width:
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child:  Text(
                                                date[index],
                                                style:
                                                salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            width:
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                journal[index],
                                                style:
                                                salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            width:
                                            AppScreenUtil().screenWidth(120),
                                            child: Center(
                                              child: Text(
                                                reference[index],
                                                style:
                                                salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            width:
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                debit[index],
                                                style:
                                                salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            width:
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                credit[index],
                                                style:
                                                salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            width:
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                balance[index],
                                                style:
                                                salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  tappedDetail = true;
                                });
                              },
                            );
                          })),
                          Container(
                            height: AppScreenUtil().screenHeight(25),
                            width: AppScreenUtil().screenWidth(650),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(
                                      AppScreenUtil().screenWidth(6)),
                                  bottomLeft: Radius.circular(
                                      AppScreenUtil().screenWidth(6))),
                              color: blackColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil().screenWidth(18)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total',
                                          style:
                                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child: Text(
                                          '3000.00',
                                          style:
                                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child: Text(
                                          '3000.00',
                                          style:
                                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child: Text(
                                          '7000.00',
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          maxLines: 1,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
