// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../detail/bank_and_cash_report_detail.dart';

class BankAndCashReportList extends StatefulWidget {
  const BankAndCashReportList({super.key});

  @override
  State<BankAndCashReportList> createState() => _BankAndCashReportListState();
}

class _BankAndCashReportListState extends State<BankAndCashReportList> {



  List<String> bank = [
    'SBI',
    'ICICI',
    'Cash',
    'Petty Cash',
    'SBI',
    'ICICI',
    'Cash',
    'Petty Cash',
    'SBI',
    'ICICI',
    'Cash',
    'Petty Cash',
    'SBI',
    'ICICI',
    'Cash',
    'Petty Cash',
  ];
  List<String> debit = [
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
    'QR 1000.00',
  ];
  List<String> credit = [
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
    'QR 300.00',
  ];
  List<String> balance = [
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
        Padding(padding: EdgeInsets.only(left: 16),child: Text(
          'Bank & Cash Report',
          style: tableTitleLabelStyle,
        ),),
        SizedBox(height: AppScreenUtil().screenHeight(15),),
        tappedList == true
            ? BankAndCashReportDetail()
            : Container(
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
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///Table heading
                        Container(
                          height: AppScreenUtil().screenHeight(25),
                          width: AppScreenUtil().screenWidth(360),
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
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Bank',
                                          style:
                                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )),
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(80),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  width: AppScreenUtil().screenWidth(80),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(80),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Balance',
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
                            children: List.generate(bank.length, (index) {
                              return InkWell(
                                child: Container(
                                  height: AppScreenUtil().screenHeight(30),
                                  width: AppScreenUtil().screenWidth(360),
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
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil().screenWidth(80),
                                              child: Center(
                                                child: Text(
                                                  bank[index],
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
                                              width: AppScreenUtil().screenWidth(80),
                                              child: Center(
                                                child: Text(
                                                  debit[index],
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
                                              width: AppScreenUtil().screenWidth(80),
                                              child: Center(
                                                child:  Text(
                                                  credit[index],
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
                                              width: AppScreenUtil().screenWidth(80),
                                              child: Center(
                                                child:  Text(
                                                  balance[index],
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
                          width: AppScreenUtil().screenWidth(360),
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
                                    width: AppScreenUtil().screenWidth(80),
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
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'QR 10000.00',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'QR 3000.00',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'QR 7000.00',
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
