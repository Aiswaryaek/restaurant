// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';

class SaleTab extends StatefulWidget {
  const SaleTab({super.key});

  @override
  State<SaleTab> createState() => _SaleTabState();
}

class _SaleTabState extends State<SaleTab> {
  ///Sale
  List<String> date = [
    '2024/03/22',
    '2024/03/22',
    '2024/03/22',
    '2024/03/22',
    '2024/03/22',
    '2024/03/22',
  ];
  List<String> orderRef = [
    'ORD1234',
    'ORD1234',
    'ORD1234',
    'ORD1234',
    'ORD1234',
    'ORD1234',
  ];
  List<String> customer = [
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
  ];
  List<String> mobile = [
    '9065363324',
    '9065363324',
    '9065363324',
    '9065363324',
    '9065363324',
    '9065363324',
  ];
  List<String> deliveryCharge = [
    '133.00',
    '133.00',
    '133.00',
    '133.00',
    '133.00',
    '133.00',
  ];
  List<String> discount = [
    '133.00',
    '133.00',
    '133.00',
    '133.00',
    '133.00',
    '133.00',
  ];
  List<String> orderAmount = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  List<String> paidAmount = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  List<String> balance = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ///Table heading
                                Container(
                                  height: AppScreenUtil().screenHeight(30),
                                  width: AppScreenUtil().screenWidth(1010),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: adminDashBoardTableAlternateColor
                                        .withOpacity(0.05),
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
                                                  .screenWidth(95),
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
                                                  .screenWidth(130),
                                              child: Center(
                                                child: Text(
                                                  'Order Reff',
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
                                                  'Customer',
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
                                                  'Mobile',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Delivery Charge',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Discount',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Order Amount',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Paid Amount',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Balance',
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
                                  children: List.generate(date.length, (index) {
                                    return InkWell(
                                      child: Container(
                                        height:
                                            AppScreenUtil().screenHeight(33),
                                        width:
                                            AppScreenUtil().screenWidth(1010),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              width: 0.7,
                                              color: posPaymentBorderColor
                                                  .withOpacity(0.5)),
                                          color: whiteColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: AppScreenUtil()
                                                  .screenWidth(18)),
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
                                                        .screenWidth(95),
                                                    child: Center(
                                                      child: Text(date[index],
                                                          style:
                                                              tableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: double.infinity,
                                                    color: Colors.transparent,
                                                    width: AppScreenUtil()
                                                        .screenWidth(130),
                                                    child: Center(
                                                      child: Text(
                                                          orderRef[index],
                                                          style:
                                                              tableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
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
                                                          customer[index],
                                                          style:
                                                              tableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
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
                                                      child: Text(mobile[index],
                                                          style:
                                                              tableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
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
                                                          deliveryCharge[index],
                                                          style:
                                                              tableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
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
                                                          discount[index],
                                                          style:
                                                              tableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
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
                                                          orderAmount[index],
                                                          style:
                                                              tableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
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
                                                          paidAmount[index],
                                                          style:
                                                              tableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
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
                                                          balance[index],
                                                          style:
                                                              tableSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
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
                                        bottomBar(context);
                                      },
                                    );
                                  }),
                                ),
                                Container(
                                  height: AppScreenUtil().screenHeight(30),
                                  width: AppScreenUtil().screenWidth(1010),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color:
                                        posPaymentBorderColor.withOpacity(0.5),
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
                                                    .screenWidth(95),
                                                child: Center(
                                                  child: Text(''),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: double.infinity,
                                                color: Colors.transparent,
                                                width: AppScreenUtil()
                                                    .screenWidth(130),
                                                child: Center(
                                                  child: Text('',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
                                                  child: Text('',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
                                                  child: Text('Total',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
                                                  child: Text('1165.00',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
                                                  child: Text('',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
                                                  child: Text('00.00',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
                                                  child: Text('00.00',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
                                                  child: Text('00.00',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
            )),
      ],
    );
  }

  void bottomBar(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: AppScreenUtil().screenHeight(100),
          decoration: BoxDecoration(
            color: confirmColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              SizedBox(
                width: AppScreenUtil().screenWidth(50),
                child: Center(
                  child: Divider(
                    color: whiteColor,
                    thickness: 3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InventoryBottomSheetItemLayout(
                        iconHeight: 13.09,
                        iconPath: ImageCons.imgVisibility,
                        iconWidth: 20.53),
                    GestureDetector(
                      onTap: () {},
                      child: InventoryBottomSheetItemLayout(
                          iconHeight: 15.29,
                          iconPath: ImageCons.edit,
                          iconWidth: 15.29),
                    ),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.84,
                        iconPath: ImageCons.imgDelete,
                        iconWidth: 13.91),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}