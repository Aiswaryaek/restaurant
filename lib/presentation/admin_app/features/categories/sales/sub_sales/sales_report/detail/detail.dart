// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class SalesReportDetail extends StatefulWidget {
  const SalesReportDetail({super.key});

  @override
  State<SalesReportDetail> createState() => _SalesReportDetailState();
}

class _SalesReportDetailState extends State<SalesReportDetail> {
  List<String> date = [
    '12/08/2023',
    '12/08/2023',
    '12/08/2023',
    '12/08/2023',
    '12/08/2023',
    '12/08/2023',
    '12/08/2023',
    '12/08/2023',
    '12/08/2023',
    '12/08/2023',
  ];

  List<String> customer = [
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
  ];
  List<String> invoiceNo = [
    'INV/001',
    'INV/001',
    'INV/001',
    'INV/001',
    'INV/001',
    'INV/001',
    'INV/001',
    'INV/001',
    'INV/001',
    'INV/001',
  ];
  List<String> qty = [
    '7',
    '7',
    '7',
    '7',
    '7',
    '7',
    '7',
    '7',
    '7',
    '7',
  ];

  List<String> salesPrice = [
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
  ];
  List<String> discount = [
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
  ];
  List<String> salesAmount = [
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      width: AppScreenUtil().screenWidth(690),
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
                                      'Date',
                                      style:
                                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                                      maxLines: 1,
                                    ),
                                  ],
                                )),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Customer',
                                    style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Invoice No.',
                                    style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(70),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Qty',
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sales Price',
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Discount',
                                      style:
                                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                                      maxLines: 1,
                                    ),
                                  ],
                                )),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(95),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sales Amount',
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
                        children: List.generate(customer.length, (index) {
                      return InkWell(
                        child: Container(
                          height: AppScreenUtil().screenHeight(30),
                          width: AppScreenUtil().screenWidth(690),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: tableOutlinedColor.withOpacity(0.7),
                                width: 0.8),
                            color: whiteColor,
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
                                          date[index],
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
                                      width: AppScreenUtil().screenWidth(95),
                                      child: Center(
                                        child: Text(
                                          customer[index],
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
                                      width: AppScreenUtil().screenWidth(95),
                                      child: Center(
                                        child: Text(
                                          invoiceNo[index],
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
                                      width: AppScreenUtil().screenWidth(70),
                                      child: Center(
                                        child:  Text(
                                          qty[index],
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
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child:  Text(
                                          salesPrice[index],
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
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child:  Text(
                                          discount[index],
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
                                      width: AppScreenUtil().screenWidth(95),
                                      child: Center(
                                        child: Text(
                                          salesAmount[index],
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
                        onTap: () {},
                      );
                    })),
                    Container(
                      height: AppScreenUtil().screenHeight(25),
                      width: AppScreenUtil().screenWidth(690),
                      decoration: BoxDecoration(
                        color: tableOutlinedColor,
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
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total',
                                    style: tableTitleLabelStyle,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: AppScreenUtil().screenWidth(0.6),
                                  color: blackColor,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(70),
                                      child:
                                     Center(
                                       child:  Text(
                                         '100',
                                         style:
                                         tableTitleLabelStyle,
                                         maxLines: 1,overflow: TextOverflow.ellipsis,
                                       ),
                                     ))
                                  ],
                                ),
                                Container(
                                  height: double.infinity,
                                  width: AppScreenUtil().screenWidth(0.6),
                                  color: blackColor,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(90),
                                      child:  Center(
                                        child: Text(
                                          '100000',
                                          style:
                                          tableTitleLabelStyle,overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    )
                                  ],
                                ),
                                Container(
                                  height: double.infinity,
                                  width: AppScreenUtil().screenWidth(0.6),
                                  color: blackColor,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Row(crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(
                                      '500',overflow: TextOverflow.ellipsis,
                                      style:
                                      tableTitleLabelStyle,
                                      maxLines: 1,
                                    ),
                                  )
                                )
                              ],
                            ),
                                Container(
                                  height: double.infinity,
                                  width: AppScreenUtil().screenWidth(0.6),
                                  color: blackColor,
                                ),
                              ],
                            ),
                            Row(crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(95),
                                  child:  Center(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      '10000',overflow: TextOverflow.ellipsis,
                                      style: tableTitleLabelStyle,
                                      maxLines: 1,
                                    ),
                                  )
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
    );
  }
}
