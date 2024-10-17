// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/account_payable/create/account_payable.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class ProductMarginReportDetail extends StatefulWidget {
  const ProductMarginReportDetail({super.key});

  @override
  State<ProductMarginReportDetail> createState() =>
      _ProductMarginReportDetailState();
}

class _ProductMarginReportDetailState extends State<ProductMarginReportDetail> {
  List<String> date  = [
    '12/04/2024',
    '12/04/2024',
  ];

  List<String> invoice = [
    'INV/2024/1/1',
    'INV/2024/1/1',
  ];
  List<String> employee = [
    'Name Of Employee',
    'Name Of Employee',
  ];
  List<String> customer = [
    'Name Of Customer',
    'Name Of Customer',
  ];

  List<String> cost = [
    '1218.750',
    '11.429',
  ];
  List<String> revenue = [
    '28776.250',
    '24983.571',
  ];
  List<String> profit = [
    '95.937',
    '99.954',
  ];
  List<String> profitMargin = [
    '0.00',
    '100.00',
  ];
  bool tappedDetail = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 16,top: 10),
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
                      width: AppScreenUtil().screenWidth(860),
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
                            horizontal: AppScreenUtil().screenWidth(5)),
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
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child:  Text(
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
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child:  Text(
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
                                  width: AppScreenUtil().screenWidth(120),
                                  child: Center(
                                    child:  Text(
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
                                  width: AppScreenUtil().screenWidth(100),
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
                                  width: AppScreenUtil().screenWidth(100),
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
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child:  Text(
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
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child:  Text(
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
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child: Text(
                                      'Profit Margin %',
                                      style:
                                      placeOrderingAndConfirmPaymentButtonLabelStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                        children: List.generate(date.length, (index) {
                          return InkWell(
                            child: Container(
                              height: AppScreenUtil().screenHeight(30),
                              width: AppScreenUtil().screenWidth(860),
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
                                    AppScreenUtil().screenWidth(5)),
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
                                            AppScreenUtil().screenWidth(100),
                                            child: Center(
                                              child:  Text(
                                                date[index],
                                                style:
                                                personalInfoAccountLoginLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
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
                                              invoice[index],
                                              style:
                                              personalInfoAccountLoginLabelStyle,
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
                                              employee[index],
                                              style:
                                              personalInfoAccountLoginLabelStyle,
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
                                          child:  Center(
                                            child: Text(
                                              customer[index],
                                              style:
                                              personalInfoAccountLoginLabelStyle,
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
                                            child:   Text(
                                              cost[index],
                                              style:
                                              personalInfoAccountLoginLabelStyle,
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
                                              revenue[index],
                                              style:
                                              personalInfoAccountLoginLabelStyle,
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
                                              profit[index],
                                              style:
                                              personalInfoAccountLoginLabelStyle,
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
                                              profitMargin[index],
                                              style:
                                              personalInfoAccountLoginLabelStyle,
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
                      width: AppScreenUtil().screenWidth(860),
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
                            horizontal: AppScreenUtil().screenWidth(5)),
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
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child: Text(
                                      'Total',
                                      style:
                                      placeOrderingAndConfirmPaymentButtonLabelStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(100),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(120),
                            ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(100),
                                ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(100),
                                child: Center(
                                  child: Text(
                                    '1230.179',
                                    style:
                                    placeOrderingAndConfirmPaymentButtonLabelStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(100),
                                child: Center(
                                  child: Text(
                                    '53759.821',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                    placeOrderingAndConfirmPaymentButtonLabelStyle,
                                    maxLines: 1,
                                  ),
                                )),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(100),
                                child: Center(
                                  child: Text(
                                    '97.763',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                    placeOrderingAndConfirmPaymentButtonLabelStyle,
                                    maxLines: 1,
                                  ),
                                )),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(100),
                                child: Center(
                                  child: Text(
                                    '00.00',
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
