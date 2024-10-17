// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/account_payable/create/account_payable.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class InvoiceMarginReportDetail extends StatefulWidget {
  const InvoiceMarginReportDetail({super.key});

  @override
  State<InvoiceMarginReportDetail> createState() =>
      _InvoiceMarginReportDetailState();
}

class _InvoiceMarginReportDetailState extends State<InvoiceMarginReportDetail> {
  List<String> product = [
    'FR BUMPER W/FINISHER',
    'HOOK HOLE COVER',
  ];

  List<String> qty = [
    '10.000',
    '10.000',
  ];
  List<String> unitPrice = [
    '3000.00',
    '2500.00',
  ];
  List<String> netSales = [
    '29995.000',
    '24995.000',
  ];

  List<String> cost = [
    '1218.750',
    '11.429',
  ];
  List<String> profit = [
    '28776.250',
    '24983.571',
  ];
  List<String> profitMargin = [
    '95.937',
    '99.954',
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
                      width: AppScreenUtil().screenWidth(708),
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
                                width: AppScreenUtil().screenWidth(100),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Product',
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
                              width: AppScreenUtil().screenWidth(120),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Unit Price',
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
                                    'Net Sales',
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
                                      'Cost',
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
                                      'Profit',
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
                                      'Profit Margin',
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
                        children: List.generate(product.length, (index) {
                          return InkWell(
                            child: Container(
                              height: AppScreenUtil().screenHeight(30),
                              width: AppScreenUtil().screenWidth(708),
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
                                          AppScreenUtil().screenWidth(100),
                                          child: Center(
                                            child:  Text(
                                              product[index],
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
                                          AppScreenUtil().screenWidth(90),
                                          child: Center(
                                            child:  Text(
                                              qty[index],
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
                                              unitPrice[index],
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
                                          AppScreenUtil().screenWidth(90),
                                          child:  Center(
                                            child: Text(
                                              netSales[index],
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
                                          AppScreenUtil().screenWidth(90),
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
                                          AppScreenUtil().screenWidth(90),
                                          child: Center(
                                            child: Text(
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
                                          AppScreenUtil().screenWidth(90),
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
                      width: AppScreenUtil().screenWidth(708),
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
                              width: AppScreenUtil().screenWidth(100),
                              child:  Row(
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
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(120),
                            ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child: Text(
                                    '54990.000',
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
                                    '1230.179',
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
                                    '53759.821',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                    placeOrderingAndConfirmPaymentButtonLabelStyle,
                                    maxLines: 1,
                                  ),
                                )),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child: Text(
                                    '97.763',
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
