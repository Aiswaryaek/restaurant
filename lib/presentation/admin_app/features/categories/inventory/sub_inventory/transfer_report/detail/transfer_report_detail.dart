// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../../../../../../styles/colors.dart';
import '../../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../../utiles/app_screen_util.dart';

class TransferReportDetail extends StatefulWidget {
String tappedItem;
   TransferReportDetail(this.tappedItem, {super.key});

  @override
  State<TransferReportDetail> createState() =>
      _TransferReportDetailState();
}

class _TransferReportDetailState extends State<TransferReportDetail> {
  List<String> br = [
    'Product 1',
    'Product 2',
    'Product 3',
    '20/12/2023',
    '20/12/2023',
    '20/12/2023',
    '20/12/2023',
    '20/12/2023',
    '20/12/2023',
    '20/12/2023',
  ];
  List<String> description = [
    'GSHG',
    'WGG',
    'FSDG',
    'fafasdf',
    'GSHG',
    'WGG',
    'FSDG',
    'fafasdf',
    'GSHG',
    'WGG',
    'FSDG',
  ];
  List<String> uom = [
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit'
  ];
  List<String> income = [
    '5.00',
    '5.00',
    '5.00',
    '5.00',
    '5.00',
    '5.00',
    '5.00',
    '5.00',
    '5.00',
    '5.00',
    '5.00'
  ];
  List<String> transferAmount = [
    '800.00',
    '800.00',
    '800.00',
    '800.00',
    '800.00',
    '800.00',
    '800.00',
    '800.00',
    '800.00',
    '800.00',
    '800.00'
  ];
  List<String> total = [
    '805.00',
    '305.00',
    '405.00',
    '505.00',
    '805.00',
    '305.00',
    '405.00',
    '505.00',
    '805.00',
    '305.00',
    '405.00',
  ];
  bool tappedDetail = false;

  @override
  Widget build(BuildContext context) {
    return
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(left: 16),
        child: Text(
          'Transfer Details ( Branch - 1 )',
          style: tableTitleLabelStyle,
        ),
      ),
      SizedBox(
        height: AppScreenUtil().screenHeight(15),
      ),
      Padding(
        padding: EdgeInsets.only(left: 16, bottom: 50),
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
                        width: AppScreenUtil().screenWidth(700),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child:  Text(
                                        'BR/124',
                                        style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Center(
                                      child: Text(
                                        'Description',
                                        style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child:  Text(
                                        'UOM',
                                        style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child:  Text(
                                        'Income',
                                        style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child: Text(
                                        'Transfer Amount',
                                        style:
                                        placeOrderingAndConfirmPaymentButtonLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
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
                            ],
                          ),
                        ),
                      ),
                      Column(
                          children: List.generate(br.length, (index) {
                            return InkWell(
                              child: Container(
                                height: AppScreenUtil().screenHeight(30),
                                width: AppScreenUtil().screenWidth(700),
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                br[index],
                                                style:
                                                salesReportSubTitleLabelStyle,
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
                                                description[index],
                                                style:
                                                salesReportSubTitleLabelStyle,
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
                                                uom[index],
                                                style:
                                                salesReportSubTitleLabelStyle,
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
                                                income[index],
                                                style:
                                                salesReportSubTitleLabelStyle,
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
                                                transferAmount[index],
                                                style:
                                                salesReportSubTitleLabelStyle,
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
                                                style:
                                                salesReportSubTitleLabelStyle,
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
                        width: AppScreenUtil().screenWidth(700),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child:  Text(
                                        '',
                                        style: accountPayableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Center(
                                      child: Text(
                                        'Total',
                                        style: accountPayableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child: Text(
                                        '000',
                                        style: accountPayableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child: Text(
                                        '000',
                                        style: accountPayableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child: Text(
                                        '000',
                                        style: accountPayableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child: Text(
                                        '000',
                                        style: accountPayableSubTitleLabelStyle,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
