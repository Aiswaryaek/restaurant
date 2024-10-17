// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/account_payable/detail/detail.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class AccountPayableList extends StatefulWidget {
  const AccountPayableList({super.key});

  @override
  State<AccountPayableList> createState() => _AccountPayableListState();
}

class _AccountPayableListState extends State<AccountPayableList> {
  ScrollController accountPayableTableScrollController = ScrollController();
  double accountPayableTableIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    accountPayableTableScrollController.addListener(() {
      setState(() {
        accountPayableTableIndicatorPosition =
            (accountPayableTableScrollController.offset /
                    accountPayableTableScrollController
                        .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    accountPayableTableScrollController.dispose();

    super.dispose();
  }

  List<String> vendor = [
    'Name of Vendor',
    'Name of Vendor',
    'Name of Vendor',
    'Name of Vendor',
    'Name of Vendor',
    'Name of Vendor',
    'Name of Vendor',
    'Name of Vendor',
    'Name of Vendor',
    'Name of Vendor',
    'Name of Vendor'
  ];
  List<String> debit = [
    '2000.0',
    '2000.0',
    '2000.0',
    '2000.0',
    '2000.0',
    '2000.0',
    '2000.0',
    '2000.0',
    '2000.0',
    '2000.0',
    '2000.0'
  ];
  List<String> credit = [
    '4000.0',
    '4000.0',
    '4000.0',
    '4000.0',
    '4000.0',
    '4000.0',
    '4000.0',
    '4000.0',
    '4000.0',
    '4000.0',
    '4000.0'
  ];
  List<String> balance = [
    '6000.0',
    '6000.0',
    '6000.0',
    '6000.0',
    '6000.0',
    '6000.0',
    '6000.0',
    '6000.0',
    '6000.0',
    '6000.0',
    '6000.0'
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
          'Account Payable Report',
          style: tableTitleLabelStyle,
        ),),
        SizedBox(height: AppScreenUtil().screenHeight(15),),
        tappedList == true
            ? AccountPayableDetail()
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
                                          'Vendor',
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
                            children: List.generate(vendor.length, (index) {
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
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil().screenWidth(80),
                                              child: Center(
                                                child: Text(
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
                                              child: Center(child:  Text(
                                                credit[index],
                                                style: salesReportSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),),
                                            )
                                          ],
                                        ),
                                        Container(
                                            color: Colors.transparent,
                                            width: AppScreenUtil().screenWidth(80),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                              Container(
                                                color: Colors.transparent,
                                                width: AppScreenUtil().screenWidth(80),
                                                child: Center(
                                                child:   Text(
                                                  balance[index],
                                                  style: salesReportSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),)
                                              ],
                                            )),
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
                                          '8000',
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
                                          '22000',
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
                                          '14000',
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
