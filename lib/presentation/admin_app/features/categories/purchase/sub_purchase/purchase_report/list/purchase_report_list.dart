// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../detail/purchase_report_detail.dart';

class PurchaseReportList extends StatefulWidget {
  const PurchaseReportList({super.key});

  @override
  State<PurchaseReportList> createState() => _PurchaseReportListState();
}

class _PurchaseReportListState extends State<PurchaseReportList> {
  ScrollController purchaseReportTableScrollController = ScrollController();
  double accountPayableTableIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    purchaseReportTableScrollController.addListener(() {
      setState(() {
        accountPayableTableIndicatorPosition =
            (purchaseReportTableScrollController.offset /
                purchaseReportTableScrollController
                    .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    purchaseReportTableScrollController.dispose();

    super.dispose();
  }

  List<String> item = [
    'Name of Item',
    'Name of Item',
    'Name of Item',
    'Name of Item',
    'Name of Item',
    'Name of Item',
    'Name of Item',
    'Name of Item',
    'Name of Item',
    'Name of Item',
    'Name of Item'
  ];
  List<String> uom = [
    'kg',
    'kg',
    'kg',
    'kg',
    'kg',
    'kg',
    'kg',
    'kg',
    'kg',
    'kg',
    'kg'
  ];
  List<String> purchaseQty = [
    '150',
    '150',
    '150',
    '150',
    '150',
    '150',
    '150',
    '150',
    '150',
    '150',
    '150'
  ];
  List<String> purchaseReturnQty = [
    '70',
    '70',
    '70',
    '70',
    '70',
    '70',
    '70',
    '70',
    '70',
    '70',
    '70'
  ];

  List<String> totalQty = [
    '300',
    '300',
    '300',
    '300',
    '300',
    '300',
    '300',
    '300',
    '300',
    '300',
    '300'
  ];
  List<String> averageUnitCost = [
    '150.00',
    '150.00',
    '150.00',
    '150.00',
    '150.00',
    '150.00',
    '150.00',
    '150.00',
    '150.00',
    '150.00',
    '150.00'
  ];
  List<String> averageTotalValue = [
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00'
  ];

  bool tappedList = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 16),child: Text(
          'Purchase Report',
          style: tableTitleLabelStyle,
        ),),
        SizedBox(height: AppScreenUtil().screenHeight(15),),
        tappedList == true
            ? PurchaseReportDetail()
            : Container(
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
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///Table heading
                        Container(
                          height: AppScreenUtil().screenHeight(25),
                          width: AppScreenUtil().screenWidth(770),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft:
                                Radius.circular(AppScreenUtil().screenWidth(6)),
                                topRight: Radius.circular(
                                    AppScreenUtil().screenWidth(6))),
                            color: blackColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(18)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Item',
                                          style:
                                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )),
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'UOM',
                                        style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Purchase Qty',
                                        style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(110),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Purchase Return Qty',
                                        style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Total Qty',
                                        style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(110),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Average Unit Cost',
                                        style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(110),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Average Total Value',
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
                            children: List.generate(item.length, (index) {
                              return InkWell(
                                child: Container(
                                  height: AppScreenUtil().screenHeight(30),
                                  width: AppScreenUtil().screenWidth(770),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: whiteColor.withOpacity(0.7),
                                        width: 0.8),
                                    color: salesReportTableColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppScreenUtil().screenWidth(18)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil().screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  item[index],
                                                  style: salesReportSubTitleLabelStyle,
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
                                              width: AppScreenUtil().screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  uom[index],
                                                  style: salesReportSubTitleLabelStyle,
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
                                              width: AppScreenUtil().screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  purchaseQty[index],
                                                  style: salesReportSubTitleLabelStyle,
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
                                              width: AppScreenUtil().screenWidth(110),
                                              child: Center(
                                                child: Text(
                                                  purchaseReturnQty[index],
                                                  style: salesReportSubTitleLabelStyle,
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
                                              width: AppScreenUtil().screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  totalQty[index],
                                                  style: salesReportSubTitleLabelStyle,
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
                                              width: AppScreenUtil().screenWidth(110),
                                              child: Center(
                                                child: Text(
                                                  averageUnitCost[index],
                                                  style: salesReportSubTitleLabelStyle,
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
                                              width: AppScreenUtil().screenWidth(110),
                                              child: Center(
                                                child:   Text(
                                                  averageTotalValue[index],
                                                  style: salesReportSubTitleLabelStyle,
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
                                    tappedList=true;
                                  });
                                },
                              );
                            })),
                        Container(
                          height: AppScreenUtil().screenHeight(25),
                          width: AppScreenUtil().screenWidth(770),
                          decoration: BoxDecoration( borderRadius: BorderRadius.only(
                              bottomLeft:
                              Radius.circular(AppScreenUtil().screenWidth(6)),
                              bottomRight: Radius.circular(
                                  AppScreenUtil().screenWidth(6))),
                            color: blackColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(18)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(110),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(110),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(110),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '0.00',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
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
        ),
      ],
    );
  }
}
