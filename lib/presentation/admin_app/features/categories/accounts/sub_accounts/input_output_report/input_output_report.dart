// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/account_payable/detail/detail.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class InputOutPutReport extends StatefulWidget {
  const InputOutPutReport({super.key});

  @override
  State<InputOutPutReport> createState() => _InputOutPutReportState();
}

class _InputOutPutReportState extends State<InputOutPutReport> {
  List<String> date = [
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
  ];
  List<String> transactionNumber = [
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
    'BILL/2023/01',
  ];
  List<String> transactionType = [
    'Purchase',
    'Purchase W/PO',
    'Purchase Return',
    'Sales',
    'Purchase',
    'Purchase W/PO',
    'Purchase Return',
    'Sales',
    'Purchase',
    'Purchase W/PO',
    'Purchase Return',
    'Sales',
    'Purchase',
    'Purchase W/PO',
    'Purchase Return',
    'Sales',
  ];
  List<String> debit = [
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
  ];
  List<String> credit = [
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
    'QR 700.00',
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  List<String> statusList = ['Available', 'Cancel'];

  List<Color> alternateStatusColor = [
    bankReceiptButtonColorGreen,
    bankReceiptButtonColorRed
  ];
  bool tappedList = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'Input / Output Report',
            style: tableTitleLabelStyle,
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(15),
        ),
      Container(
                padding: EdgeInsets.only(left: 16, bottom: 30),
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
                                width: AppScreenUtil().screenWidth(600),
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
                                            AppScreenUtil().screenWidth(115),
                                            child: Center(
                                              child: Text(
                                                'Date',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                maxLines: 1,
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
                                            width: AppScreenUtil().screenWidth(110),
                                            child: Center(
                                              child: Text(
                                                'Transaction Number',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                maxLines: 1,
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
                                            width: AppScreenUtil().screenWidth(120),
                                            child: Center(
                                              child:  Text(
                                                'Transaction Type',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                maxLines: 1,
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
                                            width: AppScreenUtil().screenWidth(100),
                                            child: Center(
                                              child:   Text(
                                                'Debit',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                maxLines: 1,
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
                                            width: AppScreenUtil().screenWidth(100),
                                            child: Center(
                                              child:  Text(
                                                'Credit',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                maxLines: 1,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                  children: List.generate(date.length, (index) {
                                return InkWell(
                                  child: Container(
                                    height: AppScreenUtil().screenHeight(30),
                                    width: AppScreenUtil().screenWidth(600),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: whiteColor.withOpacity(0.7),
                                          width: 0.8),
                                      color: salesReportTableColor,
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
                                                width: AppScreenUtil()
                                                    .screenWidth(115),
                                                child: Center(
                                                  child: Text(
                                                    date[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                width: AppScreenUtil()
                                                    .screenWidth(110),
                                                child: Center(
                                                  child:  Text(
                                                    transactionNumber[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                width: AppScreenUtil()
                                                    .screenWidth(120),
                                                child: Center(
                                                  child: Text(
                                                    transactionType[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                width: AppScreenUtil()
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text(
                                                    debit[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                width: AppScreenUtil()
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text(
                                                    credit[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                      tappedList = true;
                                    });
                                  },
                                );
                              })),
                              Container(
                                height: AppScreenUtil().screenHeight(25),
                                width: AppScreenUtil().screenWidth(600),
                                color: whiteColor,
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
                                        MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 27),
                                            color: Colors.transparent,
                                            width:
                                            AppScreenUtil().screenWidth(115),
                                            child: Text(
                                              'Total',
                                              style:
                                              inputOutputSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
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
                                            AppScreenUtil().screenWidth(110),
                                            child: Center(
                                              child: Text(
                                                '',
                                                style:
                                                accountPayableSubTitleLabelStyle,
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
                                              child:  Text(
                                                '',
                                                style:
                                                accountPayableSubTitleLabelStyle,
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
                                            AppScreenUtil().screenWidth(100),
                                            child: Center(
                                              child: Text(
                                                'QR 3000.00',
                                                style:
                                                inputOutputSubTitleLabelStyle,
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
                                            AppScreenUtil().screenWidth(100),
                                            child: Center(
                                              child: Text(
                                                'QR 7000.00',
                                                style:
                                                inputOutputSubTitleLabelStyle,
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
                              Container(
                                height: AppScreenUtil().screenHeight(25),
                                width: AppScreenUtil().screenWidth(600),
                                color: blackColor,
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
                                        MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 27),
                                            color: Colors.transparent,
                                            width:
                                            AppScreenUtil().screenWidth(115),
                                            child: Center(
                                              child: Text(
                                                'Total Input Status',
                                                style:
                                                accountPayableSubTitleLabelStyle,
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
                                            AppScreenUtil().screenWidth(110),
                                            child: Center(
                                              child: Text(
                                                '',
                                                style:
                                                accountPayableSubTitleLabelStyle,
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
                                              child:  Text(
                                                '',
                                                style:
                                                accountPayableSubTitleLabelStyle,
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
                                            AppScreenUtil().screenWidth(100),
                                            child: Center(
                                              child:  Text(
                                                '',
                                                style:
                                                accountPayableSubTitleLabelStyle,
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
                                            AppScreenUtil().screenWidth(100),
                                            child: Center(
                                              child: Text(
                                                'QR 7000.00',
                                                style:
                                                accountPayableSubTitleLabelStyle,
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

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
