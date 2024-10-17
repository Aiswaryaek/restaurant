// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';

class TrailBalance extends StatefulWidget {
  const TrailBalance({super.key});

  @override
  State<TrailBalance> createState() => _TrailBalanceState();
}

class _TrailBalanceState extends State<TrailBalance> {
  List<String> particular = [
    'SBI',
    'ICICI',
    'Cash',
    'Petty Cash',
    'Customer Receivable',
    'Munshid Capital',
    'Short Term Debt',
    'Vendor Payable',
    'Rent Payable',
    'Sales Income',
    'Discount Received'
  ];
  List<String> openingDebit = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00'
  ];
  List<String> openingCredit = [
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.000',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00'
  ];
  List<String> transactionDebit = [
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.000',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00'
  ];

  List<String> transactionCredit = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00'
  ];
  List<String> closingBalanceDebit = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00'
  ];
  List<String> closingBalanceCredit = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 5, 16, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trial Balance',
            style: dialoguePasswordTextStyle,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
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
                          height: AppScreenUtil().screenHeight(50),
                          width: AppScreenUtil().screenWidth(715),
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
                                horizontal: AppScreenUtil().screenWidth(0)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(186),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Particular',
                                          style:
                                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )),
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(177),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        color: whiteColor,
                                        width: 1.5,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      'Opening Balance',
                                                      style:
                                                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                      maxLines: 1,
                                                    ),
                                                  )),
                                            ),
                                            Expanded(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                      color: searchTextColor
                                                          .withOpacity(0.99),
                                                      child: Center(
                                                        child: Text(
                                                          'Debit',
                                                          style:
                                                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                          maxLines: 1,
                                                        ),
                                                      )),
                                                ),
                                                Container(
                                                  height: double.infinity,
                                                  color: whiteColor,
                                                  width: 1.5,
                                                ),
                                                Expanded(
                                                    child: Container(
                                                        color: searchTextColor
                                                            .withOpacity(0.99),
                                                        child: Center(
                                                          child: Text(
                                                            'Credit',
                                                            style:
                                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                            maxLines: 1,
                                                          ),
                                                        )))
                                              ],
                                            ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        color: whiteColor,
                                        width: 1.5,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(177),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      'Transaction',
                                                      style:
                                                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                      maxLines: 1,
                                                    ),
                                                  )),
                                            ),
                                            Expanded(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                      color: searchTextColor
                                                          .withOpacity(0.99),
                                                      child: Center(
                                                        child: Text(
                                                          'Debit',
                                                          style:
                                                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                          maxLines: 1,
                                                        ),
                                                      )),
                                                ),
                                                Container(
                                                  height: double.infinity,
                                                  color: whiteColor,
                                                  width: 1.5,
                                                ),
                                                Expanded(
                                                    child: Container(
                                                        color: searchTextColor
                                                            .withOpacity(0.99),
                                                        child: Center(
                                                          child: Text(
                                                            'Credit',
                                                            style:
                                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                            maxLines: 1,
                                                          ),
                                                        )))
                                              ],
                                            ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        color: whiteColor,
                                        width: 1.5,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            AppScreenUtil().screenWidth(6))),
                                  ),
                                  width: AppScreenUtil().screenWidth(174.4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      'Closing Balance',
                                                      style:
                                                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                      maxLines: 1,
                                                    ),
                                                  )),
                                            ),
                                            Expanded(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                      color: searchTextColor
                                                          .withOpacity(0.99),
                                                      child: Center(
                                                        child: Text(
                                                          'Debit',
                                                          style:
                                                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                          maxLines: 1,
                                                        ),
                                                      )),
                                                ),
                                                Container(
                                                  height: double.infinity,
                                                  color: whiteColor,
                                                  width: 1.5,
                                                ),
                                                Expanded(
                                                    child: Container(
                                                        color: searchTextColor
                                                            .withOpacity(0.99),
                                                        child: Center(
                                                          child: Text(
                                                            'Credit',
                                                            style:
                                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                            maxLines: 1,
                                                          ),
                                                        )))
                                              ],
                                            ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                            children: List.generate(particular.length, (index) {
                          return InkWell(
                            child: Container(
                              height: AppScreenUtil().screenHeight(30),
                              width: AppScreenUtil().screenWidth(715),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: optionalColor.withOpacity(0.99),
                                    width: 0.8),
                                color: salesReportTableColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppScreenUtil().screenWidth(0)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 7),
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(185),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              particular[index],
                                              style:
                                                  salesReportSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        )),
                                    Container(
                                        color: Colors.transparent,
                                        width:
                                            AppScreenUtil().screenWidth(174.5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Center(
                                              child: Text(
                                                openingDebit[index],
                                                style:
                                                    salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                            Expanded(
                                                child: Center(
                                              child: Text(
                                                openingCredit[index],
                                                style:
                                                    salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                          ],
                                        )),
                                    Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(176),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Center(
                                              child: Text(
                                                transactionDebit[index],
                                                style:
                                                    salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                            Expanded(
                                                child: Center(
                                              child: Text(
                                                transactionCredit[index],
                                                style:
                                                    salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                          ],
                                        )),
                                    Container(
                                        color: Colors.transparent,
                                        width:
                                            AppScreenUtil().screenWidth(173.2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Center(
                                              child: Text(
                                                closingBalanceDebit[index],
                                                style:
                                                    salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                            Expanded(
                                                child: Center(
                                              child: Text(
                                                closingBalanceCredit[index],
                                                style:
                                                    salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          );
                        })),
                        Container(
                          height: AppScreenUtil().screenHeight(25),
                          width: AppScreenUtil().screenWidth(715),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                    AppScreenUtil().screenWidth(6)),
                                bottomRight: Radius.circular(
                                    AppScreenUtil().screenWidth(6))),
                            color: blackColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(0)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 40),
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(186),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Total',
                                          style:
                                              accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(176.5),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Center(
                                              child: Text(
                                                '0.00',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        Expanded(
                                            child: Center(
                                              child: Text(
                                                '50000.0',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(177),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Center(
                                              child: Text(
                                                '50000.0',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        Expanded(
                                            child: Center(
                                              child: Text(
                                                '0.00',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(173.2),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Center(
                                              child: Text(
                                               '0.00',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        Expanded(
                                            child: Center(
                                              child: Text(
                                                '0.00',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
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
        ],
      ),
    );
  }
}
