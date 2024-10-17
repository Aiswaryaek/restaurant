// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../../product_margin_report/detail/product_margin_report_detail.dart';
import '../detail/customer_receipt_detail.dart';

class CustomerReceiptReportList extends StatefulWidget {
  const CustomerReceiptReportList({super.key});

  @override
  State<CustomerReceiptReportList> createState() =>
      _CustomerReceiptReportListState();
}

class _CustomerReceiptReportListState extends State<CustomerReceiptReportList> {
  List<String> customer = [
    'Name of Customer',
    'Name of Customer',
    'Name of Customer',
    'Name of Customer',
    'Name of Customer',
    'Name of Customer',
    'Name of Customer',
    'Name of Customer',
    'Name of Customer',
    'Name of Customer',
  ];
  List<String> invCount = [
    '5',
    '5',
    '5',
    '5',
    '5',
    '5',
    '5',
    '5',
    '5',
    '5',
  ];
  List<String> invAmount = [
    'QR 0.00',
    'QR 0.00',
    'QR 0.00',
    'QR 0.00',
    'QR 0.00',
    'QR 0.00',
    'QR 0.00',
    'QR 0.00',
    'QR 0.00',
    'QR 0.00',
  ];
  List<String> amount = [
    'QR 100.00',
    'QR 100.00',
    'QR 100.00',
    'QR 100.00',
    'QR 100.00',
    'QR 100.00',
    'QR 100.00',
    'QR 100.00',
    'QR 100.00',
    'QR 100.00',
  ];
  List<String> credit = [
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
  ];

  bool tappedList = false;
  bool status = false;
  bool isTab1Tapped = true;
  bool isTab2Tapped = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'Customer Receipt Report',
            style: tableTitleLabelStyle,
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        tappedList == true?CustomerReceiptReportDetail():Column(
          children: [
            Container(
                padding: EdgeInsets.only(
                  left: 16,
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
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
                                    height:
                                    AppScreenUtil().screenHeight(25),
                                    width:
                                    AppScreenUtil().screenWidth(510),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              AppScreenUtil()
                                                  .screenWidth(6)),
                                          topRight: Radius.circular(
                                              AppScreenUtil()
                                                  .screenWidth(6))),
                                      color: blackColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppScreenUtil()
                                              .screenWidth(18)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(100),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text(
                                                    'Customer',
                                                    style:
                                                    placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                            color: Colors.transparent,
                                            width: AppScreenUtil()
                                                .screenWidth(100),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  'INV Count',
                                                  style:
                                                  placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: Colors.transparent,
                                            width: AppScreenUtil()
                                                .screenWidth(90),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  'INV Amount',
                                                  style:
                                                  placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: Colors.transparent,
                                            width: AppScreenUtil()
                                                .screenWidth(90),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  'Paid Amount',
                                                  style:
                                                  placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: Colors.transparent,
                                            width: AppScreenUtil()
                                                .screenWidth(90),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  'Credit',
                                                  style:
                                                  placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                      children: List.generate(customer.length,
                                              (index) {
                                            return InkWell(
                                              child: Container(
                                                height: AppScreenUtil()
                                                    .screenHeight(30),
                                                width: AppScreenUtil()
                                                    .screenWidth(510),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: whiteColor
                                                          .withOpacity(0.7),
                                                      width: 0.8),
                                                  color: salesReportTableColor,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: AppScreenUtil()
                                                          .screenWidth(18)),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width: AppScreenUtil()
                                                                .screenWidth(100),
                                                            child: Center(
                                                                child: Text(
                                                                  customer[index],
                                                                  style:
                                                                  salesReportSubTitleLabelStyle,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width: AppScreenUtil()
                                                                .screenWidth(100),
                                                            child: Center(
                                                              child: Text(
                                                                invCount[index],
                                                                style:
                                                                salesReportSubTitleLabelStyle,
                                                                maxLines: 1,
                                                                overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width: AppScreenUtil()
                                                                .screenWidth(90),
                                                            child: Center(
                                                              child: Text(
                                                                invAmount[index],
                                                                style:
                                                                salesReportSubTitleLabelStyle,
                                                                maxLines: 1,
                                                                overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width: AppScreenUtil()
                                                                .screenWidth(90),
                                                            child: Center(
                                                              child: Text(
                                                                amount[index],
                                                                style:
                                                                salesReportSubTitleLabelStyle,
                                                                maxLines: 1,
                                                                overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width: AppScreenUtil()
                                                                .screenWidth(90),
                                                            child: Center(
                                                              child: Text(
                                                                credit[index],
                                                                style:
                                                                salesReportSubTitleLabelStyle,
                                                                maxLines: 1,
                                                                overflow:
                                                                TextOverflow
                                                                    .ellipsis,
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
                                    height:
                                    AppScreenUtil().screenHeight(25),
                                    width:
                                    AppScreenUtil().screenWidth(510),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              AppScreenUtil()
                                                  .screenWidth(6)),
                                          bottomRight: Radius.circular(
                                              AppScreenUtil()
                                                  .screenWidth(6))),
                                      color: blackColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppScreenUtil()
                                              .screenWidth(18)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(100),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text(
                                                    'Total',
                                                    style:
                                                    accountPayableSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  )
                                                ],
                                              )),
                                          Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(100),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text(
                                                    '0.00',
                                                    style:
                                                    accountPayableSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  )
                                                ],
                                              )),
                                          Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text(
                                                    '0.00',
                                                    style:
                                                    accountPayableSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  )
                                                ],
                                              )),
                                          Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text(
                                                    '0.00',
                                                    style:
                                                    accountPayableSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  )
                                                ],
                                              )),
                                          Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text(
                                                    '0.00',
                                                    style:
                                                    accountPayableSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  )
                                                ],
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
                    SizedBox(height: AppScreenUtil().screenHeight(40)),
                  ],
                )),
            SizedBox(
              height: AppScreenUtil().screenHeight(40),
            )
          ],
        )
      ],
    );
  }
}
