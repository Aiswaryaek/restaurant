// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../detail/transfer_report_detail.dart';

class TransferReportList extends StatefulWidget {
  const TransferReportList({super.key});

  @override
  State<TransferReportList> createState() =>
      _TransferReportListState();
}

class _TransferReportListState extends State<TransferReportList> {
  ScrollController TransferReportTableScrollController =
  ScrollController();
  double TransferReportTableIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    TransferReportTableScrollController.addListener(() {
      setState(() {
        TransferReportTableIndicatorPosition =
            (TransferReportTableScrollController.offset /
                TransferReportTableScrollController
                    .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    TransferReportTableScrollController.dispose();

    super.dispose();
  }

  List<String> date = [
    '2/12/2024',
    '3/12/2024',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts'
  ];
  List<String> transferId = [
    'BT/001',
    'BT/001',
    'BT/001',
    'BT/001',
    'BT/001',
    'BT/001',
    'BT/001',
    'BT/001',
    'BT/001',
    'BT/001',
    'BT/001'
  ];
  List<String> from = [
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1'
  ];
  List<String> to = [
    'Branch 2',
    'Branch 2',
    'Branch 2',
    'Branch 2',
    'Branch 2',
    'Branch 2',
    'Branch 2',
    'Branch 2',
    'Branch 2',
    'Branch 2',
    'Branch 2'
  ];
  List<String> spMargin = [
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00'
  ];
  List<String> employee = [
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith',
    'Kshanith'
  ];
  List<String> grn = [
    'BR/124',
    'BR/124',
    'BR/124',
    'BR/124',
    'BR/124',
    'BR/124',
    'BR/124',
    'BR/124',
    'BR/124',
    'BR/124',
    'BR/124'
  ];
  List<String> total = [
    '3000.00',
    '3000.00',
    '3000.00',
    '3000.00',
    '3000.00',
    '3000.00',
    '3000.00',
    '3000.00',
    '3000.00',
    '3000.00',
    '3000.00'
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
  dynamic tappedItem ='Transfer Report';

  @override
  Widget build(BuildContext context) {
    return   tappedList == true
        ? TransferReportDetail(tappedItem)
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            tappedItem,
            style: tableTitleLabelStyle,
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(15),
        ),
        Container(
          padding: EdgeInsets.only(left: 16, bottom: 40),
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
                          width: AppScreenUtil().screenWidth(850),
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
                                      AppScreenUtil().screenWidth(90),
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
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child: Text(
                                          'Transfer ID',
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
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child: Text(
                                          'From',
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
                                      width: AppScreenUtil().screenWidth(90),

                                      child: Center(
                                        child: Text(
                                          'To',
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
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child:  Text(
                                          'SP Margin',
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
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child: Text(
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
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child:  Text(
                                          'GRN',
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
                            children: List.generate(date.length, (index) {
                              return InkWell(
                                child: Container(
                                  height: AppScreenUtil().screenHeight(30),
                                  width: AppScreenUtil().screenWidth(850),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: whiteColor.withOpacity(0.7),
                                        width: 0.8),
                                    color: salesReportTableColor,
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
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Center(
                                                child: Text(
                                                  date[index],
                                                  style:
                                                  salesReportSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,)
                                                ,
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
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Center(
                                                child: Text(
                                                  transferId[index],
                                                  style:
                                                  salesReportSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
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
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Center(
                                                child: Text(
                                                  from[index],
                                                  style:
                                                  salesReportSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
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
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Center(
                                                child: Text(
                                                  to[index],
                                                  style:
                                                  salesReportSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
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
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Center(
                                                child: Text(
                                                  spMargin[index],
                                                  style:
                                                  salesReportSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
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
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Center(
                                                child: Text(
                                                  employee[index],
                                                  style:
                                                  salesReportSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
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
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Center(
                                                child: Text(
                                                  grn[index],
                                                  style:
                                                  salesReportSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
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
                                              width: AppScreenUtil()
                                                  .screenWidth(90),
                                              child: Center(
                                                child:  Text(
                                                  total[index],
                                                  style:
                                                  salesReportSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
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
                                    tappedList = true;
                                  });
                                },
                              );
                            })),
                        Container(
                          height: AppScreenUtil().screenHeight(25),
                          width: AppScreenUtil().screenWidth(850),
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
                                      AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child: Text(
                                          'Total',
                                          style:
                                          accountPayableSubTitleLabelStyle,
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
                                      AppScreenUtil().screenWidth(80),
                                      child: Center(
                                        child: Text(
                                          '',
                                          style:
                                          accountPayableSubTitleLabelStyle,
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
                                          '',
                                          style:
                                          accountPayableSubTitleLabelStyle,
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
                                          '',
                                          style:
                                          accountPayableSubTitleLabelStyle,
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
                                    Container( color: Colors.transparent,
                                      width:
                                      AppScreenUtil().screenWidth(90),child: Center(
                                        child: Text(
                                          '',
                                          style:
                                          accountPayableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),)
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
                                          '',
                                          style:
                                          accountPayableSubTitleLabelStyle,
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
                                          '',
                                          style:
                                          accountPayableSubTitleLabelStyle,
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
                                          '000.00',
                                          style:
                                          accountPayableSubTitleLabelStyle,
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
        ),
      ],
    );
  }
}
