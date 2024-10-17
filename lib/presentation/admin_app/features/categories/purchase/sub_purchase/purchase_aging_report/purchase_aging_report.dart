// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class PurchaseAgingReportList extends StatefulWidget {
  const PurchaseAgingReportList({super.key});

  @override
  State<PurchaseAgingReportList> createState() =>
      _PurchaseAgingReportListState();
}

class _PurchaseAgingReportListState extends State<PurchaseAgingReportList> {
  ScrollController purchaseAgingReportTableScrollController =
  ScrollController();
  double purchaseAgingReportTableIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    purchaseAgingReportTableScrollController.addListener(() {
      setState(() {
        purchaseAgingReportTableIndicatorPosition =
            (purchaseAgingReportTableScrollController.offset /
                purchaseAgingReportTableScrollController
                    .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    purchaseAgingReportTableScrollController.dispose();

    super.dispose();
  }

  List<String> code = [
    'Product 01',
    'Product 01',
    'Product 01',
    'Product 01',
  ];
  List<String> product = [
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
  ];
  List<String> uom = [
    'Unit',
    'Unit',
    'Unit',
    'Unit',
  ];
  List<String> zeroQty = [
    '0',
    '0',
    '0',
    '0',
  ];
  List<String> zeroValue = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  List<String> thirtyOneQty = [
    '50',
    '50',
    '50',
    '50',
  ];
  List<String> thirtyOneValue = [
    '5000',
    '5000',
    '5000',
    '5000',
  ];
  List<String> sixtyOneQty = [
    '200',
    '200',
    '200',
    '200',
  ];
  List<String> sixtyOneValue = [
    '20,000',
    '20,000',
    '20,000',
    '20,000',
  ];
  List<String> ninetyOneQty = [
    '0',
    '0',
    '0',
    '0',
  ];
  List<String> ninetyOneValue = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  List<String> oneTwentyOneQty = [
    '100',
    '100',
    '100',
    '100',
  ];
  List<String> oneTwentyOneValue = [
    '10,000',
    '10,000',
    '10,000',
    '10,000',
  ];
  List<String> oneFiftyOneQty = [
    '0',
    '0',
    '0',
    '0',
  ];
  List<String> oneFiftyOneValue = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  List<String> totalQty = [
    '350',
    '350',
    '350',
    '350',
  ];
  List<String> totalValue = [
    '35,000',
    '35,000',
    '35,000',
    '35,000',
  ];


  bool tappedList = false;
  // dynamic tappedItem ='Stock Move Report';

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.only(left: 16, bottom: 40),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Purchase Aging Report',
              style: tableTitleLabelStyle,
            ),
            SizedBox(height: AppScreenUtil().screenHeight(10),),
            Column(
              children: List.generate(2, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Branch - 1',
                      style: posSettingsDropDownStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(7),
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
                                    height: AppScreenUtil().screenHeight(62.76),
                                    width: AppScreenUtil().screenWidth(764),
                                    decoration: BoxDecoration(
                                      color: blackColor,
                                    ),
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
                                              width: AppScreenUtil().screenWidth(73),
                                              color: Colors.black,
                                              child: Center(
                                                child: Text(
                                                  'Code',
                                                  style:
                                                  userDraftStatusStyle,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(width: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: AppScreenUtil().screenWidth(73),
                                              color: Colors.black,
                                              child: Center(
                                                child: Text(
                                                  'Product',
                                                  style:
                                                  userDraftStatusStyle,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(width: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: AppScreenUtil().screenWidth(73),
                                              color: Colors.black,
                                              child: Center(
                                                child: Text(
                                                  'UOM',
                                                  style:
                                                  userDraftStatusStyle,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(width: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(73),
                                          child:Column(
                                            children: [
                                              Container(
                                                  height: AppScreenUtil().screenHeight(21.26),
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      '0-30',
                                                      style:
                                                      posContainerTextStyle,
                                                      maxLines: 1,
                                                    ),
                                                  )),
                                              Container(height: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                              Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                            color: blackColor,
                                                            child: Center(
                                                              child: Text(
                                                                'Qty',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )),
                                                      ),
                                                      Container(
                                                        height: double.infinity,
                                                        color: whiteColor,
                                                        width: 2,
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              color: blackColor,
                                                              child: Center(
                                                                child: Text(
                                                                  'Value',
                                                                  style:
                                                                  clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                  maxLines: 1,
                                                                ),
                                                              )))
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Container(width: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(73),
                                          child:Column(
                                            children: [
                                              Container(
                                                  height: AppScreenUtil().screenHeight(21.26),
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      '31-60',
                                                      style:
                                                      posContainerTextStyle,
                                                      maxLines: 1,
                                                    ),
                                                  )),
                                              Container(height: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                              Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                            color: blackColor,
                                                            child: Center(
                                                              child: Text(
                                                                'Qty',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )),
                                                      ),
                                                      Container(
                                                        height: double.infinity,
                                                        color: whiteColor,
                                                        width: 2,
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              color: blackColor,
                                                              child: Center(
                                                                child: Text(
                                                                  'Value',
                                                                  style:
                                                                  clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                  maxLines: 1,
                                                                ),
                                                              )))
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Container(width: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(73),
                                          child:Column(
                                            children: [
                                              Container(
                                                  height: AppScreenUtil().screenHeight(21.26),
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      '61-90',
                                                      style:
                                                      posContainerTextStyle,
                                                      maxLines: 1,
                                                    ),
                                                  )),
                                              Container(height: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                              Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                            color: blackColor,
                                                            child: Center(
                                                              child: Text(
                                                                'Qty',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )),
                                                      ),
                                                      Container(
                                                        height: double.infinity,
                                                        color: whiteColor,
                                                        width: 2,
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              color: blackColor,
                                                              child: Center(
                                                                child: Text(
                                                                  'Value',
                                                                  style:
                                                                  clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                  maxLines: 1,
                                                                ),
                                                              )))
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Container(width: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(73),
                                          child:Column(
                                            children: [
                                              Container(
                                                  height: AppScreenUtil().screenHeight(21.26),
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      '91-120',
                                                      style:
                                                      posContainerTextStyle,
                                                      maxLines: 1,
                                                    ),
                                                  )),
                                              Container(height: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                              Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                            color: blackColor,
                                                            child: Center(
                                                              child: Text(
                                                                'Qty',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )),
                                                      ),
                                                      Container(
                                                        height: double.infinity,
                                                        color: whiteColor,
                                                        width: 2,
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              color: blackColor,
                                                              child: Center(
                                                                child: Text(
                                                                  'Value',
                                                                  style:
                                                                  clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                  maxLines: 1,
                                                                ),
                                                              )))
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Container(width: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(73),
                                          child:Column(
                                            children: [
                                              Container(
                                                  height: AppScreenUtil().screenHeight(21.26),
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      '121-150',
                                                      style:
                                                      posContainerTextStyle,
                                                      maxLines: 1,
                                                    ),
                                                  )),
                                              Container(height: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                              Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                            color: blackColor,
                                                            child: Center(
                                                              child: Text(
                                                                'Qty',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )),
                                                      ),
                                                      Container(
                                                        height: double.infinity,
                                                        color: whiteColor,
                                                        width: 2,
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              color: blackColor,
                                                              child: Center(
                                                                child: Text(
                                                                  'Value',
                                                                  style:
                                                                  clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                  maxLines: 1,
                                                                ),
                                                              )))
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Container(width: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(73),
                                          child:Column(
                                            children: [
                                              Container(
                                                  height: AppScreenUtil().screenHeight(21.26),
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      '151 Above',
                                                      style:
                                                      posContainerTextStyle,
                                                      maxLines: 1,
                                                    ),
                                                  )),
                                              Container(height: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                              Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                            color: blackColor,
                                                            child: Center(
                                                              child: Text(
                                                                'Qty',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )),
                                                      ),
                                                      Container(
                                                        height: double.infinity,
                                                        color: whiteColor,
                                                        width: 2,
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              color: blackColor,
                                                              child: Center(
                                                                child: Text(
                                                                  'Value',
                                                                  style:
                                                                  clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                  maxLines: 1,
                                                                ),
                                                              )))
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Container(width: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(73),
                                          child:Column(
                                            children: [
                                              Container(
                                                  height: AppScreenUtil().screenHeight(21.26),
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      'Total',
                                                      style:
                                                      posContainerTextStyle,
                                                      maxLines: 1,
                                                    ),
                                                  )),
                                              Container(height: AppScreenUtil().screenWidth(3),color: whiteColor,),
                                              Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                            color: blackColor,
                                                            child: Center(
                                                              child: Text(
                                                                'Qty',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )),
                                                      ),
                                                      Container(
                                                        height: double.infinity,
                                                        color: whiteColor,
                                                        width: 2,
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              color: blackColor,
                                                              child: Center(
                                                                child: Text(
                                                                  'Value',
                                                                  style:
                                                                  clearDataAlertEnterPasswordSubmitButtonLabelStyle,
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
                                  Column(
                                      children: List.generate(code.length, (index) {
                                        return InkWell(
                                          child: Container(
                                            height: AppScreenUtil().screenHeight(26.46),
                                            width: AppScreenUtil().screenWidth(764),
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
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: kotDarkModeToggleButtonTrackColor,
                                                            width: 0.8),
                                                        color: whiteColor,
                                                      ),
                                                      width: AppScreenUtil().screenWidth(74),
                                                      child: Center(
                                                        child: Text(
                                                          code[index],
                                                          style:
                                                          employeeDashBoardChartSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(width: AppScreenUtil().screenWidth(1),color: whiteColor,),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: kotDarkModeToggleButtonTrackColor,
                                                            width: 0.8),
                                                        color: whiteColor,
                                                      ),
                                                      width: AppScreenUtil().screenWidth(76),
                                                      child: Center(
                                                        child: Text(
                                                          product[index],
                                                          style:
                                                          employeeDashBoardChartSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(width: AppScreenUtil().screenWidth(1),color: whiteColor,),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: kotDarkModeToggleButtonTrackColor,
                                                            width: 0.8),
                                                        color: whiteColor,
                                                      ),
                                                      width: AppScreenUtil().screenWidth(76),
                                                      child: Center(
                                                        child: Text(
                                                          uom[index],
                                                          style:
                                                          employeeDashBoardChartSubTitleLabelStyle,
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(width: AppScreenUtil().screenWidth(1),color: whiteColor,),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        width: AppScreenUtil().screenWidth(76),
                                                        color: Colors.transparent,
                                                        child:  Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: kotDarkModeToggleButtonTrackColor,
                                                                        width: 0.8),
                                                                    color: whiteColor,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      zeroQty[index],
                                                                      style:
                                                                      employeeDashBoardChartSubTitleLabelStyle,
                                                                      maxLines: 1,
                                                                    ),
                                                                  )),
                                                            ),
                                                            Container(
                                                              height: double.infinity,
                                                              color: whiteColor,
                                                              width: 2,
                                                            ),
                                                            Expanded(
                                                                child: Container(
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: kotDarkModeToggleButtonTrackColor,
                                                                          width: 0.8),
                                                                      color: whiteColor,
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        zeroValue[index],
                                                                        style:
                                                                        employeeDashBoardChartSubTitleLabelStyle,
                                                                        maxLines: 1,
                                                                      ),
                                                                    )))
                                                          ],
                                                        )
                                                    ),
                                                    Container(width: AppScreenUtil().screenWidth(1),color: whiteColor,),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        width: AppScreenUtil().screenWidth(76),
                                                        color: Colors.transparent,
                                                        child:  Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: kotDarkModeToggleButtonTrackColor,
                                                                        width: 0.8),
                                                                    color: whiteColor,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      thirtyOneQty[index],
                                                                      style:
                                                                      employeeDashBoardChartSubTitleLabelStyle,
                                                                      maxLines: 1,
                                                                    ),
                                                                  )),
                                                            ),
                                                            Container(
                                                              height: double.infinity,
                                                              color: whiteColor,
                                                              width: 2,
                                                            ),
                                                            Expanded(
                                                                child: Container(
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: kotDarkModeToggleButtonTrackColor,
                                                                          width: 0.8),
                                                                      color: whiteColor,
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        thirtyOneValue[index],
                                                                        style:
                                                                        employeeDashBoardChartSubTitleLabelStyle,
                                                                        maxLines: 1,
                                                                      ),
                                                                    )))
                                                          ],
                                                        )
                                                    ),
                                                    Container(width: AppScreenUtil().screenWidth(1),color: whiteColor,),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        width: AppScreenUtil().screenWidth(75),
                                                        color: Colors.transparent,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: kotDarkModeToggleButtonTrackColor,
                                                                        width: 0.8),
                                                                    color: whiteColor,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      sixtyOneQty[index],
                                                                      style:
                                                                      employeeDashBoardChartSubTitleLabelStyle,
                                                                      maxLines: 1,
                                                                    ),
                                                                  )),
                                                            ),
                                                            Container(
                                                              height: double.infinity,
                                                              color: whiteColor,
                                                              width: 2,
                                                            ),
                                                            Expanded(
                                                                child: Container(
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: kotDarkModeToggleButtonTrackColor,
                                                                          width: 0.8),
                                                                      color: whiteColor,
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        sixtyOneValue[index],
                                                                        style:
                                                                        employeeDashBoardChartSubTitleLabelStyle,
                                                                        maxLines: 1,
                                                                      ),
                                                                    )))
                                                          ],
                                                        )
                                                    ),
                                                    Container(width: AppScreenUtil().screenWidth(1),color: whiteColor,),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        width: AppScreenUtil().screenWidth(76),
                                                        color: Colors.transparent,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: kotDarkModeToggleButtonTrackColor,
                                                                        width: 0.8),
                                                                    color: whiteColor,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      ninetyOneQty[index],
                                                                      style:
                                                                      employeeDashBoardChartSubTitleLabelStyle,
                                                                      maxLines: 1,
                                                                    ),
                                                                  )),
                                                            ),
                                                            Container(
                                                              height: double.infinity,
                                                              color: whiteColor,
                                                              width: 2,
                                                            ),
                                                            Expanded(
                                                                child: Container(
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: kotDarkModeToggleButtonTrackColor,
                                                                          width: 0.8),
                                                                      color: whiteColor,
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        ninetyOneValue[index],
                                                                        style:
                                                                        employeeDashBoardChartSubTitleLabelStyle,
                                                                        maxLines: 1,
                                                                      ),
                                                                    )))
                                                          ],
                                                        )
                                                    ),
                                                    Container(width: AppScreenUtil().screenWidth(1),color: whiteColor,),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        width: AppScreenUtil().screenWidth(76),
                                                        color: Colors.transparent,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: kotDarkModeToggleButtonTrackColor,
                                                                        width: 0.8),
                                                                    color: whiteColor,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      oneTwentyOneQty[index],
                                                                      style:
                                                                      employeeDashBoardChartSubTitleLabelStyle,
                                                                      maxLines: 1,
                                                                    ),
                                                                  )),
                                                            ),
                                                            Container(
                                                              height: double.infinity,
                                                              color: whiteColor,
                                                              width: 2,
                                                            ),
                                                            Expanded(
                                                                child: Container(
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: kotDarkModeToggleButtonTrackColor,
                                                                          width: 0.8),
                                                                      color: whiteColor,
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        oneTwentyOneValue[index],
                                                                        style:
                                                                        employeeDashBoardChartSubTitleLabelStyle,
                                                                        maxLines: 1,
                                                                      ),
                                                                    )))
                                                          ],
                                                        )
                                                    ),
                                                    Container(width: AppScreenUtil().screenWidth(1),color: whiteColor,),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        width: AppScreenUtil().screenWidth(76),
                                                        color: Colors.transparent,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: kotDarkModeToggleButtonTrackColor,
                                                                        width: 0.8),
                                                                    color: whiteColor,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      oneFiftyOneQty[index],
                                                                      style:
                                                                      employeeDashBoardChartSubTitleLabelStyle,
                                                                      maxLines: 1,
                                                                    ),
                                                                  )),
                                                            ),
                                                            Container(
                                                              height: double.infinity,
                                                              color: whiteColor,
                                                              width: 2,
                                                            ),
                                                            Expanded(
                                                                child: Container(
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: kotDarkModeToggleButtonTrackColor,
                                                                          width: 0.8),
                                                                      color: whiteColor,
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        oneFiftyOneValue[index],
                                                                        style:
                                                                        employeeDashBoardChartSubTitleLabelStyle,
                                                                        maxLines: 1,
                                                                      ),
                                                                    )))
                                                          ],
                                                        )
                                                    ),
                                                    Container(width: AppScreenUtil().screenWidth(1),color: whiteColor,),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        width: AppScreenUtil().screenWidth(74),
                                                        color: Colors.transparent,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: kotDarkModeToggleButtonTrackColor,
                                                                        width: 0.8),
                                                                    color: whiteColor,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      totalQty[index],
                                                                      style:
                                                                      employeeDashBoardChartSubTitleLabelStyle,
                                                                      maxLines: 1,
                                                                    ),
                                                                  )),
                                                            ),
                                                            Container(
                                                              height: double.infinity,
                                                              color: whiteColor,
                                                              width: 2,
                                                            ),
                                                            Expanded(
                                                                child: Container(
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: kotDarkModeToggleButtonTrackColor,
                                                                          width: 0.8),
                                                                      color: whiteColor,
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        totalValue[index],
                                                                        style:
                                                                        employeeDashBoardChartSubTitleLabelStyle,
                                                                        maxLines: 1,
                                                                      ),
                                                                    )))
                                                          ],
                                                        )
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              tappedList = true;
                                            });
                                          },
                                        );
                                      })),

                                  ///total
                                  Container(
                                    decoration: BoxDecoration(
                                      color: blackColor,
                                    ),
                                    height: AppScreenUtil().screenHeight(26.46),
                                    width: AppScreenUtil().screenWidth(764),
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
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              width: AppScreenUtil().screenWidth(73),
                                              child: Center(
                                                child: Text(
                                                  '',
                                                  style:
                                                  clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            Container(width: AppScreenUtil().screenWidth(2),color: whiteColor,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              width: AppScreenUtil().screenWidth(75),
                                              child: Center(
                                                child: Text(
                                                  '',
                                                  style:
                                                  clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            Container(width: AppScreenUtil().screenWidth(2),color: whiteColor,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              width: AppScreenUtil().screenWidth(75),
                                              child: Center(
                                                child: Text(
                                                  'Total',
                                                  style:
                                                  clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            Container(width: AppScreenUtil().screenWidth(2),color: whiteColor,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: AppScreenUtil().screenWidth(75),
                                                color: Colors.transparent,
                                                child:  Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.transparent,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '000',
                                                              style:
                                                              clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                              maxLines: 1,
                                                            ),
                                                          )),
                                                    ),
                                                    Container(
                                                      height: double.infinity,
                                                      color: whiteColor,
                                                      width: 2,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            color: Colors.transparent,
                                                            child: Center(
                                                              child: Text(
                                                                '000',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )))
                                                  ],
                                                )
                                            ),
                                            Container(width: AppScreenUtil().screenWidth(2),color: whiteColor,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: AppScreenUtil().screenWidth(74),
                                                color: Colors.transparent,
                                                child:  Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.transparent,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '000',
                                                              style:
                                                              clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                              maxLines: 1,
                                                            ),
                                                          )),
                                                    ),
                                                    Container(
                                                      height: double.infinity,
                                                      color: whiteColor,
                                                      width: 2,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            color: Colors.transparent,
                                                            child: Center(
                                                              child: Text(
                                                                '000',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )))
                                                  ],
                                                )
                                            ),
                                            Container(width: AppScreenUtil().screenWidth(2),color: whiteColor,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: AppScreenUtil().screenWidth(75),
                                                color: Colors.transparent,
                                                child:  Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.transparent,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '000',
                                                              style:
                                                              clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                              maxLines: 1,
                                                            ),
                                                          )),
                                                    ),
                                                    Container(
                                                      height: double.infinity,
                                                      color: whiteColor,
                                                      width: 2,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            color: Colors.transparent,
                                                            child: Center(
                                                              child: Text(
                                                                '000',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )))
                                                  ],
                                                )
                                            ),
                                            Container(width: AppScreenUtil().screenWidth(2),color: whiteColor,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: AppScreenUtil().screenWidth(75),
                                                color: Colors.transparent,
                                                child:  Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.transparent,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '000',
                                                              style:
                                                              clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                              maxLines: 1,
                                                            ),
                                                          )),
                                                    ),
                                                    Container(
                                                      height: double.infinity,
                                                      color: whiteColor,
                                                      width: 2,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            color: Colors.transparent,
                                                            child: Center(
                                                              child: Text(
                                                                '000',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )))
                                                  ],
                                                )
                                            ),
                                            Container(width: AppScreenUtil().screenWidth(2),color: whiteColor,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: AppScreenUtil().screenWidth(75),
                                                color: Colors.transparent,
                                                child:  Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.transparent,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '000',
                                                              style:
                                                              clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                              maxLines: 1,
                                                            ),
                                                          )),
                                                    ),
                                                    Container(
                                                      height: double.infinity,
                                                      color: whiteColor,
                                                      width: 2,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            color: Colors.transparent,
                                                            child: Center(
                                                              child: Text(
                                                                '000',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )))
                                                  ],
                                                )
                                            ),
                                            Container(width: AppScreenUtil().screenWidth(2),color: whiteColor,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: AppScreenUtil().screenWidth(74.5),
                                                color: Colors.transparent,
                                                child:  Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.transparent,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '000',
                                                              style:
                                                              clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                              maxLines: 1,
                                                            ),
                                                          )),
                                                    ),
                                                    Container(
                                                      height: double.infinity,
                                                      color: whiteColor,
                                                      width: 2,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            color: Colors.transparent,
                                                            child: Center(
                                                              child: Text(
                                                                '000',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )))
                                                  ],
                                                )
                                            ),
                                            Container(width: AppScreenUtil().screenWidth(2),color: whiteColor,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: AppScreenUtil().screenWidth(73.8),
                                                color: Colors.transparent,
                                                child:  Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.transparent,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '000',
                                                              style:
                                                              clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                              maxLines: 1,
                                                            ),
                                                          )),
                                                    ),
                                                    Container(
                                                      height: double.infinity,
                                                      color: whiteColor,
                                                      width: 2,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            color: Colors.transparent,
                                                            child: Center(
                                                              child: Text(
                                                                '000',
                                                                style:
                                                                clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                                                                maxLines: 1,
                                                              ),
                                                            )))
                                                  ],
                                                )
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(20),
                    ),
                  ],
                );
              }),
            )
          ],
        )
    );
  }
}
