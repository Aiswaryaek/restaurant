// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/account_payable/create/account_payable.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class AccountReceivableAgingReportDetail extends StatefulWidget {
  const AccountReceivableAgingReportDetail({super.key});

  @override
  State<AccountReceivableAgingReportDetail> createState() => _AccountReceivableAgingReportDetailState();
}

class _AccountReceivableAgingReportDetailState extends State<AccountReceivableAgingReportDetail> {
  List<String> date = [
    '23/09/2024',
    '23/09/2024',
    '23/09/2024',
    '23/09/2024',
    '23/09/2024',
    '23/09/2024',
    '23/09/2024',
    '23/09/2024',
    '23/09/2024',
    '23/09/2024',
  ];
  List<String> particular = [
    'BILL/BRANCH/2023/001',
    'BILL/BRANCH/2023/001',
    'BILL/BRANCH/2023/001',
    'BILL/BRANCH/2023/001',
    'BILL/BRANCH/2023/001',
    'BILL/BRANCH/2023/001',
    'BILL/BRANCH/2023/001',
    'BILL/BRANCH/2023/001',
    'BILL/BRANCH/2023/001',
    'BILL/BRANCH/2023/001',
    'BILL/BRANCH/2023/001'
  ];
  List<String> oneToThirty = [
    '2500.00',
    '2500.00',
    '2500.00',
    '2500.00',
    '2500.00',
    '2500.00',
    '2500.00',
    '2500.00',
    '2500.00',
    '2500.00',
    '2500.00'
  ];
  List<String> thirtyOneToSixty = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];
  List<String> sixtyOneToNinety = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];
  List<String> ninetyOneToOneTwenty = [
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00',
    '300.00'
  ];
  List<String> oneTwentyOneToOneFifty = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];
  List<String> oneFiftyOneAbove = [
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
  List<String> total = [
    '3300.00',
    '3300.00',
    '3300.00',
    '3300.00',
    '3300.00',
    '3300.00',
    '3300.00',
    '3300.00',
    '3300.00',
    '3300.00',
    '3300.00'
  ];
  bool tappedDetail = false;

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
                      width: AppScreenUtil().screenWidth(880),
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
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(90),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1 To 30',
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
                                    '31 To 60',
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
                                    '61 To 90',
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
                                    '91 To 120',
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
                                    '121 To 150',
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
                                    '151 Above',
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
                                    'Total',
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
                        children: List.generate(date.length, (index) {
                          return InkWell(
                            child: Container(
                              height: AppScreenUtil().screenHeight(30),
                              width: AppScreenUtil().screenWidth(880),
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
                                            child:  Text(
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
                                          width: AppScreenUtil().screenWidth(120),
                                          child: Center(
                                            child: Text(
                                              particular[index],
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
                                              oneToThirty[index],
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
                                              thirtyOneToSixty[index],
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
                                              sixtyOneToNinety[index],
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
                                              ninetyOneToOneTwenty[index],
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
                                              oneTwentyOneToOneFifty[index],
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
                                              oneFiftyOneAbove[index],
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
                      width: AppScreenUtil().screenWidth(880),
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
                            width: AppScreenUtil().screenWidth(120),
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
                            width: AppScreenUtil().screenWidth(90),
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
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(90),
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
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(90),
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
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(90),
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
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(90),
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
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(90),
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
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(90),
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
    );
  }
}
