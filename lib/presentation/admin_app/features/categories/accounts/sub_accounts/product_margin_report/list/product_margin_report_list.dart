// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../detail/product_margin_report_detail.dart';

class ProductMarginReportList extends StatefulWidget {
  const ProductMarginReportList({super.key});

  @override
  State<ProductMarginReportList> createState() =>
      _ProductMarginReportListState();
}

class _ProductMarginReportListState extends State<ProductMarginReportList> {
  List<String> product = [
    'Out Cloth',
    'Out Cloth',
    'Out Cloth',
    'Out Cloth',
    'Out Cloth',
    'Out Cloth',
    'Out Cloth',
    'Out Cloth',
    'Out Cloth',
    'Out Cloth',
  ];
  List<String> netSale = [
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
  List<String> cost = [
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
  List<String> profit = [
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
  List<String> profitMargin = [
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
            'Product Margin Report',
            style: tableTitleLabelStyle,
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        tappedList == true?ProductMarginReportDetail():Column(
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
                                              .screenWidth(5)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Container(
                                                color: Colors.transparent,
                                                width: AppScreenUtil()
                                                    .screenWidth(100),
                                                child: Center(
                                                  child:  Text(
                                                    'Product',
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
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Container(
                                                color: Colors.transparent,
                                                width: AppScreenUtil()
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text(
                                                    'Net Sale',
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
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Container(
                                                color: Colors.transparent,
                                                width: AppScreenUtil()
                                                    .screenWidth(90),
                                                child: Center(
                                                  child:  Text(
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
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Container(
                                                color: Colors.transparent,
                                                width: AppScreenUtil()
                                                    .screenWidth(90),
                                                child: Center(
                                                  child:   Text(
                                                    'profit',
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
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Container(
                                                color: Colors.transparent,
                                                width: AppScreenUtil()
                                                    .screenWidth(90),
                                                child: Center(
                                                  child:   Text(
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
                                      children: List.generate(product.length,
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
                                                          .screenWidth(5)),
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
                                                                  product[index],
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
                                                                netSale[index],
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
                                                                profitMargin[index],
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
                                              .screenWidth(5)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Container(
                                                color: Colors.transparent,
                                                width: AppScreenUtil()
                                                    .screenWidth(100),
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
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Container(
                                                color: Colors.transparent,
                                                width: AppScreenUtil()
                                                    .screenWidth(100),
                                                child: Center(
                                                  child:  Text(
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
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Container(
                                                color: Colors.transparent,
                                                width: AppScreenUtil()
                                                    .screenWidth(90),
                                                child: Center(
                                                  child:  Text(
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
                                          Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Container(
                                                        color: Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(90),
                                                        child: Center(
                                                          child:  Text(
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
                                                  )
                                                ],
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
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
                                          )
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
            Padding(padding: EdgeInsets.only(left: 0,right: 18),child:
            SizedBox(
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
            ),),
            SizedBox(
              height: AppScreenUtil().screenHeight(40),
            )
          ],
        )
      ],
    );
  }
}
