// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../widgets/pos_table.dart';

class Credit extends StatefulWidget {
  const Credit({super.key});

  @override
  State<Credit> createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  List<String> orderNo = [
    'CA2W02',
    'CA2W02',
    'CA2W02',
    'CA2W02',
    'CA2W02',
    'CA2W02',
  ];
  List<String> customerName = [
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
  ];
  List<String> mobileNo = [
    '7546353523',
    '7546353523',
    '7546353523',
    '7546353523',
    '7546353523',
    '7546353523',
  ];
  List<String> orderDate = [
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
  ];
  List<String> netAmount = [
    '1100,00',
    '1100,00',
    '1100,00',
    '1100,00',
    '1100,00',
    '1100,00',
  ];
  List<String> discount = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  List<String> lastPaid = [
    '15/09/2023',
    '15/09/2023',
    '15/09/2023',
    '15/09/2023',
    '15/09/2023',
    '15/09/2023',
  ];
  List<String> paidAmount = [
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
  ];
  List<String> balance = [
    '600.00',
    '600.00',
    '600.00',
    '600.00',
    '600.00',
    '600.00',
  ];
  List<String> status = [
    'Completed',
    'Pending',
    'Completed',
    'Pending',
    'Completed',
    'Pending',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(7, 13, 5, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        creditContainerLeftColor,
                        creditContainerRightColor
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight,
                    ),
                    color: creditContainerRightColor,
                  ),
                  height: AppScreenUtil().screenHeight(122),
                  width: AppScreenUtil().screenWidth(223),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: AppScreenUtil().screenHeight(49),
                            width: AppScreenUtil().screenWidth(1.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: whiteColor),
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(10),
                          ),
                          Transform.translate(
                            offset: Offset(0, 7),
                            child: Text(
                              'Card',
                              style: completeButtonTextStyle,
                            ),
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: Offset(42, -30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Transform.translate(
                                  offset: Offset(35, 0),
                                  child: Text(
                                    'Total Credit',
                                    style: subCreditTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  AppScreenUtil().screenHeight(3),
                                ),
                                Text(
                                  'Rs.35,1245.00',
                                  style: creditHeadTextStyle,
                                )
                              ],
                            ),
                            Transform.translate(
                              offset: Offset(20, -6),
                              child: SvgPicture.asset(
                                ImageCons.imgDownload,
                                height: 13,
                              ),
                            )
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(20, -2),
                        child: Text(
                          '**** **** 0123',
                          style: subCreditTextStyle,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(-8, 6),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: AppScreenUtil().screenHeight(1.3),
                            width: AppScreenUtil().screenWidth(71),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: whiteColor),
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(220),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: creditBottomRightColor
                        ),
                        height: AppScreenUtil().screenHeight(22),
                        child: Transform.translate(
                          offset: Offset(-5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageCons.imgUpArrow,
                                height: 10,
                              ),
                              SizedBox(
                                width: AppScreenUtil().screenWidth(13),
                              ),
                              Transform.translate(offset: Offset(0,-1),child: Text(
                                'Rs.0.00',
                                style: adminDashBoardContainerLabelStyle,
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppScreenUtil().screenWidth(10),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: creditBottomRightColor.withOpacity(0.25)),
                        height: AppScreenUtil().screenHeight(22),
                        child: Transform.translate(
                          offset: Offset(-4, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageCons.imgCreditDownArrow,
                                height: 10,
                              ),
                              SizedBox(
                                width: AppScreenUtil().screenWidth(10),
                              ),
                              Transform.translate(
                                offset: Offset(0, -1),
                                child: Text(
                                  'Rs.3512.00',
                                  style:
                                  creditBottomRightTextStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 16, bottom: 20, top: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment History',
                  style: paymentTextStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                POSTable(
                    tableDataWidgets:
                    List.generate(orderNo.length, (index) {
                      return InkWell(
                        child: Container(
                            height: AppScreenUtil().screenHeight(37),
                            width: AppScreenUtil().screenWidth(1061),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: whiteColor, width: 0.5),
                              color: whiteColor,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Transform.translate(
                                    offset: Offset(0, 7),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil()
                                              .screenWidth(95),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(orderNo[index],
                                                  style:
                                                  tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow
                                                      .ellipsis),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil()
                                              .screenWidth(120),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(customerName[index],
                                                  style:
                                                  tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow
                                                      .ellipsis),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil()
                                              .screenWidth(95),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(mobileNo[index],
                                                  style:
                                                  tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow
                                                      .ellipsis),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil()
                                              .screenWidth(85),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(orderDate[index],
                                                  style:
                                                  tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow
                                                      .ellipsis),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil()
                                              .screenWidth(85),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(netAmount[index],
                                                  style:
                                                  tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow
                                                      .ellipsis),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil()
                                              .screenWidth(85),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(discount[index],
                                                  style:
                                                  tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow
                                                      .ellipsis),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil()
                                              .screenWidth(95),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(lastPaid[index],
                                                  style:
                                                  tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow
                                                      .ellipsis),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil()
                                              .screenWidth(95),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(paidAmount[index],
                                                  style:
                                                  tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow
                                                      .ellipsis),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil()
                                              .screenWidth(85),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(balance[index],
                                                  style:
                                                  tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow
                                                      .ellipsis),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            color: Colors.transparent,
                                            width: AppScreenUtil()
                                                .screenWidth(110),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Container(
                                                    padding:
                                                    EdgeInsets
                                                        .only(
                                                        bottom:
                                                        2),
                                                    width:
                                                    AppScreenUtil()
                                                        .screenWidth(
                                                        65),
                                                    height:
                                                    AppScreenUtil()
                                                        .screenHeight(
                                                        18),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          3),
                                                      color: status[
                                                      index] ==
                                                          'Completed'
                                                          ? completedButtonColor
                                                          .withOpacity(
                                                          0.5)
                                                          : pendingButtonColor
                                                          .withOpacity(
                                                          0.55),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        status[index],
                                                        style:
                                                        inventoryCreateButtonLabelStyle,
                                                        maxLines: 1,
                                                        overflow:
                                                        TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                        TextAlign
                                                            .center,
                                                      ),
                                                    ))
                                              ],
                                            )),
                                        Container(
                                            color: Colors.transparent,
                                            width: AppScreenUtil()
                                                .screenWidth(90),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Container(
                                                  padding:
                                                  EdgeInsets.only(
                                                      top: 3),
                                                  width: AppScreenUtil()
                                                      .screenWidth(50),
                                                  height:
                                                  AppScreenUtil()
                                                      .screenHeight(
                                                      20),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        4),
                                                    color: payButtonColor
                                                        .withOpacity(
                                                        0.6),
                                                  ),
                                                  child: Text(
                                                    'Pay',
                                                    style:
                                                    inventoryCreateButtonLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow
                                                        .ellipsis,
                                                    textAlign: TextAlign
                                                        .center,
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(0, 9),
                                    child: Divider(
                                        color: rfqTextColor,
                                        thickness: 0.2),
                                  )
                                ],
                              ),
                            )),
                        onTap: () {},
                      );
                    }),
                    tableRowWidth: 1077,
                    titleWidgets: [
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(92),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Order No',
                                style: tableTitleLabelStyle,
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
                              'Customer Name',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Mobile No',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(85),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Order Date',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(85),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Net Amount',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ],
                          )),
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(85),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Discount',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ],
                          )),
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(95),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Last Paid Date',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ],
                          )),
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(95),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Paid Amount',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ],
                          )),
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(85),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Balance',
                                style: tableTitleLabelStyle,
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
                                'Status',
                                style: tableTitleLabelStyle,
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
                                '',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ],
                          )),
                    ]),
              ],
            )),
      ],
    );
  }
}
