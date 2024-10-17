// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../user_app/widgets/custom_button.dart';
import '../../../../../../widgets/uom_table.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  ScrollController orderDetail = ScrollController();
  double orderDetailPosition = 0.0;

  List<String> productId = [
    'PROD1',
    'PROD1',
    'PROD1',
    'PROD1',
    'PROD1',
    'PROD1',
  ];
  List<String> productName = [
    'Veg Biriyani',
    'Veg Biriyani',
    'Veg Biriyani',
    'Veg Biriyani',
    'Veg Biriyani',
    'Veg Biriyani',
  ];
  List<String> qty = [
    '2',
    '2',
    '2',
    '2',
    '2',
    '2',
  ];
  List<String> uom = [
    'Units',
    'Units',
    'Units',
    'Units',
    'Units',
    'Units',
  ];
  List<String> rate = [
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
  ];
  List<String> amount = [
    '40.00',
    '40.00',
    '40.00',
    '40.00',
    '40.00',
    '40.00',
  ];
  List<String> vat1 = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  List<String> vat = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  List<String> netAmount = [
    '40.00',
    '40.00',
    '40.00',
    '40.00',
    '40.00',
    '40.00',
  ];

  ///payments
  List<String> date = [
    '2024/03/22 11:23:AM',
    '2024/03/22 11:23:AM',
    '2024/03/22 11:23:AM',
    '2024/03/22 11:23:AM',
    '2024/03/22 11:23:AM',
    '2024/03/22 11:23:AM',
  ];
  List<String> paymentMethod = [
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
  ];
  List<String> type = [
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
  ];
  List<String> paymentAmount = [
    '-20',
    '-20',
    '-20',
    '-20',
    '-20',
    '-20',
  ];

  ///kotDisplay
  List<String> sequence = [
    'KOT22',
    'KOT22',
    'KOT22',
    'KOT22',
    'KOT22',
    'KOT22',
  ];
  List<String> kotDisplayStatus = [
    'New',
    'New',
    'New',
    'New',
    'New',
    'New',
  ];
  String tab1 = 'Products';
  String tab2 = 'Payments';
  String tab3 = 'KOT Order';
  bool tappedTab1 = true;
  bool tappedTab2 = false;
  bool tappedTab3 = false;
  dynamic item = 'Products';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppScreenUtil().screenHeight(154),
                width: double.infinity,
                color: shiftContainerColor,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BILL/19',
                      style: pangramMedium(size: 14.0, color: blackColor),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(9),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  'Branch',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  'Shift No',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  'Employee',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  'Table',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  'Chair',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(10),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '2024-04-30 06:04:30',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  'Jabel Ali',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  '2024/03/22 11:23:AM',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  '2024/03/22 11:32:AM',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  '2024/03/22 11:32:AM',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  '2024/03/22 11:32:AM',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(10),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Customer',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  'Mobile',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  'Order Type',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(10),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TEST CUSTOMER',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  '1234567890',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(6.5),
                                ),
                                Text(
                                  'DINEIN',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: InkWell(
                    child: Container(
                        height: 24,
                        decoration: BoxDecoration(
                            color: tappedTab1 == true ? blackColor : whiteColor,
                            borderRadius: BorderRadius.circular(11)),
                        padding: EdgeInsets.only(bottom: 2),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(tab1,
                              style: tappedTab1 == true
                                  ? placeOrderingAndConfirmPaymentButtonLabelStyle
                                  : subCompanySettingsTextStyle,
                              textAlign: TextAlign.center),
                        )),
                    onTap: () {
                      setState(() {
                        item = tab1;
                        tappedTab1 = true;
                        tappedTab2 = false;
                        tappedTab3 = false;
                      });
                    },
                  )),
                  Expanded(
                      child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            color: tappedTab2 == true ? blackColor : whiteColor,
                            borderRadius: BorderRadius.circular(11)),
                        height: 24,
                        padding: EdgeInsets.only(bottom: 2),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(tab2,
                              style: tappedTab2 == true
                                  ? placeOrderingAndConfirmPaymentButtonLabelStyle
                                  : subCompanySettingsTextStyle,
                              textAlign: TextAlign.center),
                        )),
                    onTap: () {
                      setState(() {
                        item = tab2;
                        tappedTab1 = false;
                        tappedTab2 = true;
                        tappedTab3 = false;
                      });
                    },
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        item = tab3;
                        tappedTab1 = false;
                        tappedTab2 = false;
                        tappedTab3 = true;
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: tappedTab3 == true ? blackColor : whiteColor,
                            borderRadius: BorderRadius.circular(11)),
                        height: 24,
                        padding: EdgeInsets.only(bottom: 2),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(tab3,
                              style: tappedTab3 == true
                                  ? placeOrderingAndConfirmPaymentButtonLabelStyle
                                  : subCompanySettingsTextStyle,
                              textAlign: TextAlign.center),
                        )),
                  )),
                ],
              ),
              Transform.translate(
                  offset: Offset(0, -10),
                  child: Padding(
                    padding: EdgeInsets.only(left: 6, right: 6),
                    child: Divider(
                      color: blackColor,
                      thickness: 1.5,
                    ),
                  )),
            ],
          ),
        ),
        item == 'Payments'
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                    padding: EdgeInsets.only(
                        bottom: AppScreenUtil().screenHeight(30),
                        left: AppScreenUtil().screenWidth(20)),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.transparent,
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
                                          height:
                                              AppScreenUtil().screenHeight(30),
                                          width:
                                              AppScreenUtil().screenWidth(470),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color:
                                                adminDashBoardTableAlternateColor
                                                    .withOpacity(0.05),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: AppScreenUtil()
                                                    .screenWidth(18)),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      width: AppScreenUtil()
                                                          .screenWidth(110),
                                                      child: Center(
                                                        child: Text(
                                                          'Date',
                                                          style:
                                                              tableTitleLabelStyleForEmployeeDashBoard,
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(110),
                                                      child: Center(
                                                        child: Text(
                                                          'Payment Method',
                                                          style:
                                                              tableTitleLabelStyleForEmployeeDashBoard,
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
                                                          .screenWidth(100),
                                                      child: Center(
                                                        child: Text(
                                                          'Type',
                                                          style:
                                                              tableTitleLabelStyleForEmployeeDashBoard,
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
                                                          .screenWidth(100),
                                                      child: Center(
                                                        child: Text(
                                                          'Amount',
                                                          style:
                                                              tableTitleLabelStyleForEmployeeDashBoard,
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
                                          children: List.generate(
                                              productId.length, (index) {
                                            return InkWell(
                                              child: Container(
                                                height: AppScreenUtil()
                                                    .screenHeight(33),
                                                width: AppScreenUtil()
                                                    .screenWidth(470),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                      color:
                                                          posPaymentBorderColor
                                                              .withOpacity(1)),
                                                  color: whiteColor,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          AppScreenUtil()
                                                              .screenWidth(18)),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        110),
                                                            child: Center(
                                                              child: Text(
                                                                  date[index],
                                                                  style:
                                                                      tableSubTitleLabelStyle,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height:
                                                                double.infinity,
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        110),
                                                            child: Center(
                                                              child: Text(
                                                                  paymentMethod[
                                                                      index],
                                                                  style:
                                                                      tableSubTitleLabelStyle,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                            child: Center(
                                                              child: Text(
                                                                  type[index],
                                                                  style:
                                                                      tableSubTitleLabelStyle,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                            child: Center(
                                                              child: Text(
                                                                  paymentAmount[
                                                                      index],
                                                                  style:
                                                                      tableSubTitleLabelStyle,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {});
                                              },
                                            );
                                          }),
                                        ),
                                        Container(
                                          height:
                                              AppScreenUtil().screenHeight(30),
                                          width:
                                              AppScreenUtil().screenWidth(470),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: posPaymentBorderColor
                                                .withOpacity(0.5),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: AppScreenUtil()
                                                    .screenWidth(18)),
                                            child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(110),
                                                        child: Center(
                                                          child: Text(
                                                            'TOTAL',
                                                            style:
                                                                staffNotificationTitleLabelStyle,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(100),
                                                        child: Center(
                                                          child: Text(
                                                            '',
                                                            style:
                                                                staffNotificationTitleLabelStyle,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(100),
                                                        child: Center(
                                                          child: Text(
                                                            '',
                                                            style:
                                                                staffNotificationTitleLabelStyle,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(100),
                                                        child: Center(
                                                          child: Text(
                                                            '-20.00',
                                                            style:
                                                                staffNotificationTitleLabelStyle,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )))
            : item == 'KOT Order'
                ? Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ///Table heading
                          Container(
                            height: AppScreenUtil().screenHeight(30),
                            width: AppScreenUtil().screenWidth(300),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: adminDashBoardTableAlternateColor
                                  .withOpacity(0.05),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(120),
                                        child: Center(
                                          child: Text(
                                            'Sequence',
                                            style:
                                                tableTitleLabelStyleForEmployeeDashBoard,
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
                                        width: AppScreenUtil().screenWidth(100),
                                        child: Center(
                                          child: Text(
                                            'Status',
                                            style:
                                                tableTitleLabelStyleForEmployeeDashBoard,
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
                            children: List.generate(productId.length, (index) {
                              return InkWell(
                                child: Container(
                                  height: AppScreenUtil().screenHeight(33),
                                  width: AppScreenUtil().screenWidth(300),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: posPaymentBorderColor
                                            .withOpacity(1)),
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
                                              width: AppScreenUtil()
                                                  .screenWidth(120),
                                              child: Center(
                                                child: Text(sequence[index],
                                                    style:
                                                        tableSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                            color: Colors.transparent,
                                            width: AppScreenUtil()
                                                .screenWidth(100),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomButton(
                                                    buttonHeight:
                                                        AppScreenUtil()
                                                            .screenHeight(16),
                                                    buttonWidth: AppScreenUtil()
                                                        .screenWidth(50),
                                                    buttonColor: greenColor,
                                                    borderRadius: 3,
                                                    buttonText:
                                                        kotDisplayStatus[index],
                                                    buttonLabelStyle:
                                                        adminDashBoardViewMoreButtonLabelStyle),
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
                            }),
                          ),
                        ],
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenHeight(30),
                            left: AppScreenUtil().screenWidth(20)),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                      physics: ClampingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ///Table heading
                                            Container(
                                              height: AppScreenUtil()
                                                  .screenHeight(30),
                                              width: AppScreenUtil()
                                                  .screenWidth(1010),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color:
                                                    adminDashBoardTableAlternateColor
                                                        .withOpacity(0.05),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: AppScreenUtil()
                                                        .screenWidth(18)),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          color: Colors
                                                              .transparent,
                                                          width: AppScreenUtil()
                                                              .screenWidth(95),
                                                          child: Center(
                                                            child: Text(
                                                              'Product ID',
                                                              style:
                                                                  tableTitleLabelStyleForEmployeeDashBoard,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          color: Colors
                                                              .transparent,
                                                          width: AppScreenUtil()
                                                              .screenWidth(130),
                                                          child: Center(
                                                            child: Text(
                                                              'Product Name',
                                                              style:
                                                                  tableTitleLabelStyleForEmployeeDashBoard,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          color: Colors
                                                              .transparent,
                                                          width: AppScreenUtil()
                                                              .screenWidth(100),
                                                          child: Center(
                                                            child: Text(
                                                              'Qty',
                                                              style:
                                                                  tableTitleLabelStyleForEmployeeDashBoard,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          color: Colors
                                                              .transparent,
                                                          width: AppScreenUtil()
                                                              .screenWidth(100),
                                                          child: Center(
                                                            child: Text(
                                                              'UOM',
                                                              style:
                                                                  tableTitleLabelStyleForEmployeeDashBoard,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          color: Colors
                                                              .transparent,
                                                          width: AppScreenUtil()
                                                              .screenWidth(100),
                                                          child: Center(
                                                            child: Text(
                                                              'Rate',
                                                              style:
                                                                  tableTitleLabelStyleForEmployeeDashBoard,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          color: Colors
                                                              .transparent,
                                                          width: AppScreenUtil()
                                                              .screenWidth(100),
                                                          child: Center(
                                                            child: Text(
                                                              'Amount',
                                                              style:
                                                                  tableTitleLabelStyleForEmployeeDashBoard,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          color: Colors
                                                              .transparent,
                                                          width: AppScreenUtil()
                                                              .screenWidth(100),
                                                          child: Center(
                                                            child: Text(
                                                              'Vat%',
                                                              style:
                                                                  tableTitleLabelStyleForEmployeeDashBoard,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          color: Colors
                                                              .transparent,
                                                          width: AppScreenUtil()
                                                              .screenWidth(100),
                                                          child: Center(
                                                            child: Text(
                                                              'Vat',
                                                              style:
                                                                  tableTitleLabelStyleForEmployeeDashBoard,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          color: Colors
                                                              .transparent,
                                                          width: AppScreenUtil()
                                                              .screenWidth(100),
                                                          child: Center(
                                                            child: Text(
                                                              'Net Amount',
                                                              style:
                                                                  tableTitleLabelStyleForEmployeeDashBoard,
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
                                              children: List.generate(
                                                  productId.length, (index) {
                                                return InkWell(
                                                  child: Container(
                                                    height: AppScreenUtil()
                                                        .screenHeight(33),
                                                    width: AppScreenUtil()
                                                        .screenWidth(1010),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      border: Border.all(
                                                          color:
                                                              posPaymentBorderColor
                                                                  .withOpacity(
                                                                      1)),
                                                      color: whiteColor,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal:
                                                              AppScreenUtil()
                                                                  .screenWidth(
                                                                      18)),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                color: Colors
                                                                    .transparent,
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        95),
                                                                child: Center(
                                                                  child: Text(
                                                                      productId[
                                                                          index],
                                                                      style:
                                                                          tableSubTitleLabelStyle,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                height: double
                                                                    .infinity,
                                                                color: Colors
                                                                    .transparent,
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        130),
                                                                child: Center(
                                                                  child: Text(
                                                                      productName[
                                                                          index],
                                                                      style:
                                                                          tableSubTitleLabelStyle,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                color: Colors
                                                                    .transparent,
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                                child: Center(
                                                                  child: Text(
                                                                      qty[
                                                                          index],
                                                                      style:
                                                                          tableSubTitleLabelStyle,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                color: Colors
                                                                    .transparent,
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                                child: Center(
                                                                  child: Text(
                                                                      uom[
                                                                          index],
                                                                      style:
                                                                          tableSubTitleLabelStyle,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                color: Colors
                                                                    .transparent,
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                                child: Center(
                                                                  child: Text(
                                                                      rate[
                                                                          index],
                                                                      style:
                                                                          tableSubTitleLabelStyle,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                color: Colors
                                                                    .transparent,
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                                child: Center(
                                                                  child: Text(
                                                                      amount[
                                                                          index],
                                                                      style:
                                                                          tableSubTitleLabelStyle,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                color: Colors
                                                                    .transparent,
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                                child: Center(
                                                                  child: Text(
                                                                      vat1[
                                                                          index],
                                                                      style:
                                                                          tableSubTitleLabelStyle,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                color: Colors
                                                                    .transparent,
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                                child: Center(
                                                                  child: Text(
                                                                      vat[
                                                                          index],
                                                                      style:
                                                                          tableSubTitleLabelStyle,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                color: Colors
                                                                    .transparent,
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                                child: Center(
                                                                  child: Text(
                                                                      netAmount[
                                                                          index],
                                                                      style:
                                                                          tableSubTitleLabelStyle,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    setState(() {});
                                                  },
                                                );
                                              }),
                                            ),
                                            Container(
                                              height: AppScreenUtil()
                                                  .screenHeight(30),
                                              width: AppScreenUtil()
                                                  .screenWidth(1010),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: posPaymentBorderColor
                                                    .withOpacity(0.5),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: AppScreenUtil()
                                                        .screenWidth(18)),
                                                child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        95),
                                                            child: Center(
                                                              child: Text(
                                                                'TOTAL',
                                                                style:
                                                                    staffNotificationTitleLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        130),
                                                            child: Center(
                                                              child: Text(
                                                                '',
                                                                style:
                                                                    staffNotificationTitleLabelStyle,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                            child: Center(
                                                              child: Text(
                                                                '',
                                                                style:
                                                                    staffNotificationTitleLabelStyle,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                            child: Center(
                                                              child: Text(
                                                                '',
                                                                style:
                                                                    staffNotificationTitleLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                            child: Center(
                                                              child: Text(
                                                                '',
                                                                style:
                                                                    staffNotificationTitleLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                            child: Center(
                                                              child: Text(
                                                                '280.00',
                                                                style:
                                                                    staffNotificationTitleLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        208),
                                                            child: Center(
                                                              child: Text(
                                                                '280.00',
                                                                style:
                                                                    staffNotificationTitleLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        100),
                                                            child: Center(
                                                              child: Text(
                                                                '280.00',
                                                                style:
                                                                    staffNotificationTitleLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 40, top: 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            'Total before VAT',
                                                            style:
                                                                detailProductsFirstTotalTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        4),
                                                          ),
                                                          Text(
                                                            'Discount',
                                                            style:
                                                                detailProductsSecondTotalTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        4),
                                                          ),
                                                          Text(
                                                            'Delivery Charge',
                                                            style:
                                                                detailProductsSecondTotalTextStyle,
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: AppScreenUtil()
                                                            .screenWidth(20),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            '280.00',
                                                            style:
                                                                orderDetailProductRightTotalTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        1),
                                                          ),
                                                          Text(
                                                            '0.00',
                                                            style:
                                                                orderDetailProductBottomTotalTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        1),
                                                          ),
                                                          Text(
                                                            '0.00',
                                                            style:
                                                                orderDetailProductBottomTotalTextStyle,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: AppScreenUtil()
                                                        .screenWidth(140),
                                                    child: Divider(
                                                      color: blackColor
                                                          .withOpacity(0.5),
                                                      thickness: 0.6,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .end,
                                                        children: [
                                                          Text(
                                                            'Total INC VAT',
                                                            style:
                                                            productsHeadTotalTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height:
                                                            AppScreenUtil()
                                                                .screenHeight(
                                                                4),
                                                          ),
                                                          Text(
                                                            'Amount Paid',
                                                            style:
                                                            detailProductsSecondTotalTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height:
                                                            AppScreenUtil()
                                                                .screenHeight(
                                                                4),
                                                          ),
                                                          Text(
                                                            'Amount Due',
                                                            style:
                                                            detailProductsSecondTotalTextStyle,
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: AppScreenUtil()
                                                            .screenWidth(28),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .end,
                                                        children: [
                                                          Text(
                                                            '280.00',
                                                            style:
                                                            productsHeadTotalTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height:
                                                            AppScreenUtil()
                                                                .screenHeight(
                                                                1),
                                                          ),
                                                          Text(
                                                            '0.00',
                                                            style:
                                                            orderDetailProductBottomTotalTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height:
                                                            AppScreenUtil()
                                                                .screenHeight(
                                                                1),
                                                          ),
                                                          Text(
                                                            '280.00',
                                                            style:
                                                            orderDetailProductBottomTotalTextStyle,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ))),
      ],
    );
  }
}
