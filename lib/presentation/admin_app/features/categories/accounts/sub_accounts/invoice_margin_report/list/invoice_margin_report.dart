// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../bank_and_cash_report/detail/bank_and_cash_report_detail.dart';
import '../detail/invoice_margin_report_detail.dart';

class InvoiceMarginReportList extends StatefulWidget {
  const InvoiceMarginReportList({super.key});

  @override
  State<InvoiceMarginReportList> createState() =>
      _InvoiceMarginReportListState();
}

class _InvoiceMarginReportListState extends State<InvoiceMarginReportList> {
  List<String> date = [
    '29/01/2124',
    '29/01/2124',
    '29/01/2124',
    '29/01/2124',
    '29/01/2124',
    '29/01/2124',
    '29/01/2124',
    '29/01/2124',
    '29/01/2124',
    '29/01/2124',
  ];
  List<String> invoice = [
    'WSO/868/978',
    'WSO/868/978',
    '',
    '',
    'WSO/868/978',
    '',
    'WSO/868/978',
    '',
    'WSO/868/978',
    'WSO/868/978',
  ];
  List<String> employee = [
    'Deepak',
    'Deepak',
    'Deepak',
    'Deepak',
    'Deepak',
    'Deepak',
    'Deepak',
    'Deepak',
    'Deepak',
    'Deepak',
  ];
  List<String> customer = [
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
  ];
  List<String> cost = [
    '14285.714',
    '14285.714',
    '14285.714',
    '14285.714',
    '14285.714',
    '14285.714',
    '14285.714',
    '14285.714',
    '14285.714',
    '14285.714',
  ];
  List<String> revenue = [
    '14821.000',
    '14821.000',
    '14821.000',
    '14821.000',
    '14821.000',
    '14821.000',
    '14821.000',
    '14821.000',
    '14821.000',
    '14821.000',
  ];
  List<String> profit = [
    '534.286',
    '534.286',
    '534.286',
    '534.286',
    '534.286',
    '534.286',
    '534.286',
    '534.286',
    '534.286',
    '534.286',
  ];
  List<String> profitMargin = [
    '3.605',
    '3.605',
    '3.605',
    '3.605',
    '3.605',
    '3.605',
    '3.605',
    '3.605',
    '3.605',
    '3.605',
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
            'Invoice Margin Report',
            style: tableTitleLabelStyle,
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(5),
        ),
        tappedList == true
            ? InvoiceMarginReportDetail()
            : Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(
                        left: 16,
                      ),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Transform.translate(
                                        offset: Offset(7, -1),
                                        child: Text(
                                          'Chart View',
                                          style: posSettingsDropDownStyle,
                                        ),
                                      ),
                                      Transform.scale(
                                        scale: 0.55,
                                        child: CupertinoSwitch(
                                          activeColor:
                                              greenColor.withOpacity(0.8),
                                          thumbColor: whiteColor,
                                          trackColor:
                                              confirmColor.withOpacity(0.8),
                                          value: status,
                                          onChanged: (value) =>
                                              setState(() => status = value),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )),
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
                                              AppScreenUtil().screenWidth(760),
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
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      width: AppScreenUtil()
                                                          .screenWidth(80),
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(100),
                                                      child: Center(
                                                        child: Text(
                                                          'Invoice',
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          'Employee',
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          'Customer',
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          'Cost',
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          'Revenue',
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          'Profit',
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          'Profit Margin',
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
                                            children: List.generate(date.length,
                                                (index) {
                                          return InkWell(
                                            child: Container(
                                              height: AppScreenUtil()
                                                  .screenHeight(30),
                                              width: AppScreenUtil()
                                                  .screenWidth(760),
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
                                                              .screenWidth(80),
                                                          child: Center(
                                                              child: Text(
                                                            date[index],
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
                                                              invoice[index],
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
                                                              employee[index],
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
                                                              customer[index],
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
                                                              cost[index],
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
                                                              revenue[index],
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
                                                              profit[index],
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
                                                              profitMargin[
                                                                  index],
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
                                              AppScreenUtil().screenWidth(760),
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
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      width: AppScreenUtil()
                                                          .screenWidth(80),
                                                      child: Center(
                                                        child: Text(
                                                          'Total',
                                                          style:
                                                              accountPayableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                          '',
                                                          style:
                                                              accountPayableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          '',
                                                          style:
                                                              accountPayableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          '',
                                                          style:
                                                              accountPayableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          '0.00',
                                                          style:
                                                              accountPayableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          '0.00',
                                                          style:
                                                              accountPayableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          '0.00',
                                                          style:
                                                              accountPayableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          '0.00',
                                                          style:
                                                              accountPayableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
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
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppScreenUtil().screenHeight(15)),
                          status == true
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(right: 16, bottom: 21),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height:
                                            AppScreenUtil().screenHeight(22.65),
                                        width:
                                            AppScreenUtil().screenWidth(128.21),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: whiteColor,
                                          boxShadow: const [
                                            BoxShadow(
                                              color:
                                                  adminDashBoardDateDropDownContainerBoxShadowColor,
                                              offset: Offset(0, 0),
                                              blurRadius: 6,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                height: AppScreenUtil()
                                                    .screenHeight(19.93),
                                                width: AppScreenUtil()
                                                    .screenWidth(61.61),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color: isTab1Tapped == true
                                                        ? invoiceCustomerTabColor
                                                        : Colors.transparent),
                                                child: Center(
                                                  child: Text(
                                                    'Customer',
                                                    style: isTab1Tapped == true
                                                        ? swipeWhiteLabelStyle
                                                        : swipeBlackLabelStyle,
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  isTab1Tapped = true;
                                                  isTab2Tapped = false;
                                                });
                                              },
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isTab2Tapped = true;
                                                  isTab1Tapped = false;
                                                });
                                              },
                                              child: Container(
                                                height: AppScreenUtil()
                                                    .screenHeight(19.93),
                                                width: AppScreenUtil()
                                                    .screenWidth(61.61),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color: isTab2Tapped == true
                                                        ? invoiceCustomerTabColor
                                                        : Colors.transparent),
                                                child: Center(
                                                  child: Text(
                                                    'Employee',
                                                    style: isTab2Tapped == true
                                                        ? swipeWhiteLabelStyle
                                                        : swipeBlackLabelStyle,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(),
                        ],
                      )),
                  status == true
                      ? Padding(
                          padding: EdgeInsets.only(left: 0, right: 18),
                          child: SizedBox(
                            height: 384,
                            child: BarChart(
                              BarChartData(
                                titlesData: FlTitlesData(
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),

                                ),
                                gridData: FlGridData(
                                  horizontalInterval: 10,
                                  verticalInterval: 10,
                                  drawVerticalLine: true,
                                ),
                                minY: 10,
                                maxY: 100,
                                borderData: FlBorderData(
                                  border: const Border(
                                    top: BorderSide.none,
                                    right: BorderSide.none,
                                    left: BorderSide(
                                        width: 1,
                                        color: invoiceGraphBorderColor),
                                    bottom: BorderSide(
                                        width: 1,
                                        color: invoiceGraphBorderColor),
                                  ),
                                ),
                                groupsSpace: 10,
                                // add bars
                                barGroups: [
                                  BarChartGroupData(
                                    x: 10,
                                    barRods: [
                                      BarChartRodData(
                                        toY: 45,
                                        width: 21,
                                        color: invoiceGraphTopGradientColor,
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            stops: [
                                              0.2,
                                              1
                                            ],
                                            colors: const [
                                              invoiceGraphTopGradientColor,
                                              invoiceGraphBottomGradientColor,
                                            ]),
                                        // gradientColorStops: [0.58, 3],
                                        // gradientFrom: Offset(0.2, 0),
                                        // gradientTo: Offset(0.4, 1),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  BarChartGroupData(
                                    x: 20,
                                    barRods: [
                                      BarChartRodData(
                                        toY: 75,
                                        width: 21,
                                        color: invoiceGraphTopGradientColor, gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: [
                                            0.2,
                                            1
                                          ],
                                          colors: const [
                                            invoiceGraphTopGradientColor,
                                            invoiceGraphBottomGradientColor,
                                          ]),
                                        // gradientColorStops: [0.58, 3],
                                        // gradientFrom: Offset(0.2, 0),
                                        // gradientTo: Offset(0.4, 1),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  BarChartGroupData(
                                    x: 30,
                                    barRods: [
                                      BarChartRodData(
                                        toY: 55,
                                        width: 21,
                                        color: invoiceGraphTopGradientColor, gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: [
                                            0.2,
                                            1
                                          ],
                                          colors: const [
                                            invoiceGraphTopGradientColor,
                                            invoiceGraphBottomGradientColor,
                                          ]),
                                        // gradientColorStops: [0.58, 3],
                                        // gradientFrom: Offset(0.2, 0),
                                        // gradientTo: Offset(0.4, 1),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  BarChartGroupData(
                                    x: 40,
                                    barRods: [
                                      BarChartRodData(
                                        toY: 90,
                                        width: 21,
                                        color: invoiceGraphTopGradientColor, gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: [
                                            0.2,
                                            1
                                          ],
                                          colors: const [
                                            invoiceGraphTopGradientColor,
                                            invoiceGraphBottomGradientColor,
                                          ]),
                                        // gradientColorStops: [0.58, 3],
                                        // gradientFrom: Offset(0.2, 0),
                                        // gradientTo: Offset(0.4, 1),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  BarChartGroupData(
                                    x: 50,
                                    barRods: [
                                      BarChartRodData(
                                        toY: 25,
                                        width: 21,
                                        color: invoiceGraphTopGradientColor, gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: [
                                            0.2,
                                            1
                                          ],
                                          colors: const [
                                            invoiceGraphTopGradientColor,
                                            invoiceGraphBottomGradientColor,
                                          ]),
                                        // gradientColorStops: [0.58, 3],
                                        // gradientFrom: Offset(0.2, 0),
                                        // gradientTo: Offset(0.4, 1),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  BarChartGroupData(
                                    x: 60,
                                    barRods: [
                                      BarChartRodData(
                                        toY: 45,
                                        width: 21,
                                        color: invoiceGraphTopGradientColor, gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: [
                                            0.2,
                                            1
                                          ],
                                          colors: const [
                                            invoiceGraphTopGradientColor,
                                            invoiceGraphBottomGradientColor,
                                          ]),
                                        // gradientColorStops: [0.58, 3],
                                        // gradientFrom: Offset(0.2, 0),
                                        // gradientTo: Offset(0.4, 1),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(40),
                  )
                ],
              )
      ],
    );
  }
}
