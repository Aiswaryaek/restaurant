// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class GeneralLedgerDetail extends StatefulWidget {
  const GeneralLedgerDetail({super.key});

  @override
  State<GeneralLedgerDetail> createState() => _GeneralLedgerDetailState();
}

class _GeneralLedgerDetailState extends State<GeneralLedgerDetail> {
  List<String> date = [
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
    '21/09/2024',
  ];

  List<String> branch = [
    'Name Of Branch',
    'Name Of Branch',
    'Name Of Branch',
    'Name Of Branch',
    'Name Of Branch',
    'Name Of Branch',
    'Name Of Branch',
    'Name Of Branch',
    'Name Of Branch',
    'Name Of Branch',
    'Name Of Branch',
    'Name Of Branch',
    'Name Of Branch',
  ];
  List<String> particular = [
    'Opening Balance',
    'Petty Cash Journal',
    'Vendor Bills',
    'Bank',
    'Petty Cash Journal',
    'Vendor Bills',
    'Bank',
    'Petty Cash Journal',
    'Vendor Bills',
    'Bank',
    'Petty Cash Journal',
    'Vendor Bills',
    'Bank',
  ];
  List<String> journal = [
    '',
    'JRN/28',
    'JRN/28',
    'JRN/28',
    'JRN/28',
    'JRN/28',
    'JRN/28',
    'JRN/28',
    'JRN/28',
    'JRN/28',
    'JRN/28',
    'JRN/28',
    'JRN/28',
  ];

  List<String> reference = [
    'Opening Balance',
    'P/PCJ/2024/01/1',
    'WPO/2024/1/2',
    'PMT/2024/01/1',
    'P/PCJ/2024/01/1',
    'WPO/2024/1/2',
    'PMT/2024/01/1',
    'P/PCJ/2024/01/1',
    'WPO/2024/1/2',
    'PMT/2024/01/1',
    'P/PCJ/2024/01/1',
    'WPO/2024/1/2',
    'PMT/2024/01/1',
  ];

  List<String> debit = [
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
    '300.00',
    '300.00',
    '300.00',
  ];
  List<String> credit = [
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
    '300.00',
    '300.00',
    '300.00',
  ];
  List<String> balance = [
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
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
                      width: AppScreenUtil().screenWidth(818),
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
                              width: AppScreenUtil().screenWidth(110),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Branch',
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
                                    'Journal',
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
                                      'Reference',
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
                                      'Debit',
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
                                      'Credit',
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
                                      'Balance',
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
                              width: AppScreenUtil().screenWidth(818),
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
                                    Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(100),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              date[index],
                                              style: salesReportSubTitleLabelStyle,
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
                                              branch[index],
                                              style: salesReportSubTitleLabelStyle,
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
                                              particular[index],
                                              style: salesReportSubTitleLabelStyle,
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
                                              journal[index],
                                              style: salesReportSubTitleLabelStyle,
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
                                              reference[index],
                                              style: salesReportSubTitleLabelStyle,
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
                                              debit[index],
                                              style: salesReportSubTitleLabelStyle,
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
                                              credit[index],
                                              style: salesReportSubTitleLabelStyle,
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
                                              balance[index],
                                              style: salesReportSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        )),
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
