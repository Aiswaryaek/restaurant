// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/account_payable/create/account_payable.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class PurchaseReportDetail extends StatefulWidget {
  const PurchaseReportDetail({super.key});

  @override
  State<PurchaseReportDetail> createState() => _PurchaseReportDetailState();
}

class _PurchaseReportDetailState extends State<PurchaseReportDetail> {
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
  ];

  List<String> vendor = [
    'Name Of Vendor',
    'Name Of Vendor',
    'Name Of Vendor',
    'Name Of Vendor',
    'Name Of Vendor',
    'Name Of Vendor',
    'Name Of Vendor',
    'Name Of Vendor',
    'Name Of Vendor',
    'Name Of Vendor',
  ];
  List<String> billNo = [
    'GRN/2024/01/1',
    'GRN/2024/01/1',
    'GRN/2024/01/1',
    'GRN/2024/01/1',
    'GRN/2024/01/1',
    'GRN/2024/01/1',
    'GRN/2024/01/1',
    'GRN/2024/01/1',
    'GRN/2024/01/1',
    'GRN/2024/01/1',
  ];
  List<String> qty = [
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

  List<String> unitPrice = [
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
  List<String> total = [
    'QR 3000.00',
    'QR 3000.00',
    'QR 3000.00',
    'QR 3000.00',
    'QR 3000.00',
    'QR 3000.00',
    'QR 3000.00',
    'QR 3000.00',
    'QR 3000.00',
    'QR 3000.00',
  ];
  bool tappedDetail = false;

  @override
  Widget build(BuildContext context) {
    return tappedDetail==true?AccountPayable():Padding(
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
                      width: AppScreenUtil().screenWidth(650),
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
                                width: AppScreenUtil().screenWidth(90),
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
                              width: AppScreenUtil().screenWidth(90),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Vendor',
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Bill No',
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
                                      'Unit Price',
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
                                      'Total',
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
                                          width: AppScreenUtil().screenWidth(90),
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
                                          width: AppScreenUtil().screenWidth(90),
                                          child: Center(
                                            child:  Text(
                                              vendor[index],
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
                                          width: AppScreenUtil().screenWidth(120),
                                          child: Center(
                                            child: Text(
                                              billNo[index],
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
                                            child: Text(
                                              unitPrice[index],
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
                                              total[index],
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
                                tappedDetail=true;
                              });
                            },
                          );
                        })),
                    Container(
                      height: AppScreenUtil().screenHeight(25),
                      width: AppScreenUtil().screenWidth(650),
                      decoration: BoxDecoration( borderRadius: BorderRadius.only(
                          bottomRight:
                          Radius.circular(AppScreenUtil().screenWidth(6)),
                          bottomLeft: Radius.circular(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '',
                                    style: placeOrderingAndConfirmPaymentButtonLabelStyle,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(90),
                                child:
                                Center(
                                  child:  Text(
                                    '000.00',
                                    style:
                                    placeOrderingAndConfirmPaymentButtonLabelStyle,
                                    maxLines: 1,overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(90),
                                child:  Center(
                                  child: Text(
                                    'Total',
                                    style:
                                    placeOrderingAndConfirmPaymentButtonLabelStyle,overflow: TextOverflow.ellipsis,
                                  ),
                                )
                            ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child: Text(
                                    '0.00',overflow: TextOverflow.ellipsis,
                                    style:
                                    placeOrderingAndConfirmPaymentButtonLabelStyle,
                                    maxLines: 1,
                                  ),
                                )
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
    );
  }
}
