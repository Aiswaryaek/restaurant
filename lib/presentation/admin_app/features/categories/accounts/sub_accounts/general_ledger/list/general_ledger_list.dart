// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../../account_receivable/detail/account_receivable_detail.dart';
import '../detail/general_ledger_detail.dart';


class GeneralLedgerList extends StatefulWidget {
  const GeneralLedgerList({super.key});

  @override
  State<GeneralLedgerList> createState() => _GeneralLedgerListState();
}

class _GeneralLedgerListState extends State<GeneralLedgerList> {
  ScrollController accountReceivableTableScrollController = ScrollController();
  double accountReceivableTableIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    accountReceivableTableScrollController.addListener(() {
      setState(() {
        accountReceivableTableIndicatorPosition =
            (accountReceivableTableScrollController.offset /
                accountReceivableTableScrollController
                    .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    accountReceivableTableScrollController.dispose();
    super.dispose();
  }

  List<String> particular = [
    'SBI',
    'ICICI',
    'Cash',
    'Petty Cash',
    'Customer Receivable',
    'Deepak Capital',
    'Short term Debt',
    'Vendor Payable',
    'Rent Payable',
    'Sales Income',
    'Discount Received',
    'Interest From Bond',
    'Certain types of Royalties',
    'Commisision',
    'Advertising',
    'Tax',
    'Utility',
    'Depreciation'
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
    'QR 1000.00',
    'QR 1000.00'
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
          'General Ledger',
          style: tableTitleLabelStyle,
        ),),
        SizedBox(height: AppScreenUtil().screenHeight(15),),
        tappedList == true
            ? GeneralLedgerDetail()
            :Container(
          padding: EdgeInsets.only(left: 16, bottom: 30),
          // height: MediaQuery.of(context).size.height / 1.8,
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
                          width: AppScreenUtil().screenWidth(518),
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
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                  width: AppScreenUtil().screenWidth(120),
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
                                  width: AppScreenUtil().screenWidth(120),
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
                                  width: AppScreenUtil().screenWidth(120),
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
                            children: List.generate(particular.length, (index) {
                              return InkWell(
                                child: Container(
                                  height: AppScreenUtil().screenHeight(30),
                                  width: AppScreenUtil().screenWidth(518),
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
                                              width: AppScreenUtil().screenWidth(120),
                                              child: Center(
                                                child: Text(
                                                  particular[index],
                                                  style: salesReportSubTitleLabelStyle,
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
                                              width: AppScreenUtil().screenWidth(120),
                                              child: Center(
                                                child: Text(
                                                  debit[index],
                                                  style: salesReportSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil().screenWidth(120),
                                              child:  Center(
                                                child: Text(
                                                  credit[index],
                                                  style: salesReportSubTitleLabelStyle,
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
                                              width: AppScreenUtil().screenWidth(120),
                                              child: Center(
                                                child: Text(
                                                  balance[index],
                                                  style: salesReportSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              )
                                            )
                                          ],
                                        )
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
                          width: AppScreenUtil().screenWidth(518),
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
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Particular',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Debit',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Credit',
                                          style: accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Balance',
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
