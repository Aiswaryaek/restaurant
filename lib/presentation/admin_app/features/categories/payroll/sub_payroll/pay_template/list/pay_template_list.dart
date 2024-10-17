// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../widgets/dotted_line.dart';

class PayTemplateList extends StatefulWidget {
  const PayTemplateList({super.key});

  @override
  State<PayTemplateList> createState() => _PayTemplateListState();
}

class _PayTemplateListState extends State<PayTemplateList> {
  List<Color> tableLeftAlternateColor = [
    templateFirstColor,
    templateSecondColor,
  ];
  List<Color> tableComponentsHeadDataColor = [
    templateHeadContainerColor.withOpacity(0.16),
    templateSecondColor.withOpacity(0.11),
  ];
  List<Color> tableAllowanceHeadDataColor = [
    templateHeadContainerColor.withOpacity(0.055),
    templateSecondColor.withOpacity(0.055),
  ];
  List<TextStyle> tableAllowanceTextStyle = [
    payTemplateAllowanceStyle,
    payTemplateSecondAllowanceStyle
  ];
  List<Color> tableTotalHeadDataColor = [
    templateHeadContainerColor.withOpacity(0.5),
    templateSecondColor.withOpacity(0.38),
  ];
  ScrollController scrollController = ScrollController();
  List<String> basic = [
    'TEL ALW',
    'HOUSE ALW',
    'FOOD ALW',
    'TRAVEL ALW',
    'OTHER ALW',
  ];
  List<String> calculationLeft = [
    '% OF BASIC',
    '% OF BASIC',
    'FIXED',
    'FIXED',
    '',
  ];
  List<String> calculationRight = [
    '05.00',
    '05.00',
    '100.00',
    '100.00',
    '',
  ];
  List<String> monthly = [
    '445.00',
    '445.00',
    '100.00',
    '100.00',
    '10.00',
  ];
  List<String> yearly = [
    '540.00',
    '5400.00',
    '1200.00',
    '1200.00',
    '120.00',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, bottom: 40),
        child: Column(
            children: List.generate(2, (index) {
          return SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Card(
                        elevation: 0,
                        child: Container(
                          padding: EdgeInsets.only(left: 6),
                          decoration: BoxDecoration(
                            color:  tableLeftAlternateColor[
                            index % tableLeftAlternateColor.length],
                            boxShadow: [
                              BoxShadow(
                                color: payTemplateListShadow,
                                offset: Offset(0, 0),
                                blurRadius: 3.5,
                              ),
                            ],
                          ),
                          child: Container(
                            width: AppScreenUtil().screenWidth(714),
                            height: AppScreenUtil().screenHeight(300),
                            padding: EdgeInsets.fromLTRB(20, 11, 15, 13),
                            decoration: BoxDecoration(
                              color: whiteColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name',
                                          style: uomTextStyle,
                                        ),
                                        SizedBox(
                                          height: AppScreenUtil().screenHeight(2),
                                        ),
                                        Text(
                                          'SALESMAN SALARY',
                                          style:
                                          taxCreateEnterAPassWordLabelStyle,
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Yearly',
                                          style: uomTextStyle,
                                        ),
                                        SizedBox(
                                          height: AppScreenUtil().screenHeight(2),
                                        ),
                                        Text(
                                          '10000.00 AED',
                                          style:
                                          taxCreateEnterAPassWordLabelStyle,
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(3),
                                ),
                                MySeparator(
                                    color: subDividerColor.withOpacity(0.5)),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(3),
                                ),
                                Transform.translate(
                                  offset: Offset(50, 0),
                                  child: Text('FIXED PAY',
                                      style: fixedPayStyle,
                                      textAlign: TextAlign.center),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(9),
                                ),
                                Container(
                                  height: AppScreenUtil().screenHeight(27),
                                  width: double.infinity,
                                  color: tableComponentsHeadDataColor[
                                  index % tableComponentsHeadDataColor.length],
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            color: Colors.transparent,
                                            width:
                                            AppScreenUtil().screenWidth(125),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'COMPONENTS',
                                                  style:
                                                  clearDataAlertNoButtonLabelStyle,
                                                  maxLines: 1,
                                                ),
                                              ],
                                            )),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(135),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'CALCULATION TYPE',
                                                style:
                                                clearDataAlertNoButtonLabelStyle,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(135),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'MONTHLY',
                                                style:
                                                clearDataAlertNoButtonLabelStyle,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(125),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'YEARLY',
                                                style:
                                                clearDataAlertNoButtonLabelStyle,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: AppScreenUtil().screenHeight(26),
                                  width: double.infinity,
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(110),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'BASIC',
                                                style:
                                                clearDataAlertNoButtonLabelStyle,
                                                maxLines: 1,
                                              ),
                                            ],
                                          )),
                                      Transform.translate(
                                        offset: Offset(11, 0),
                                        child: Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(100),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '% OF CTC',
                                                style:
                                                clearDataAlertNoButtonLabelStyle,
                                                maxLines: 1,
                                              ),
                                              Text(
                                                '89.00',
                                                style:
                                                clearDataAlertNoButtonLabelStyle,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(15, 0),
                                        child: Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(90),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '8900.00',
                                                style:
                                                clearDataAlertNoButtonLabelStyle,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(145),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '108000.0',
                                              style:
                                              clearDataAlertNoButtonLabelStyle,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 42, right: 10, top: 2),
                                  height: AppScreenUtil().screenHeight(16),
                                  width: double.infinity,
                                  color:tableAllowanceHeadDataColor[
                                  index % tableAllowanceHeadDataColor.length],
                                  child: Text(
                                    'ALLOWANCES',
                                    style: tableAllowanceTextStyle[
                                    index % tableAllowanceTextStyle.length],
                                    maxLines: 1,
                                  ),
                                ),
                                Column(
                                    children:
                                    List.generate(basic.length, (index) {
                                      return Column(
                                        children: [
                                          Container(
                                            height: AppScreenUtil().screenHeight(24),
                                            width: double.infinity,
                                            color: Colors.transparent,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 42, right: 10),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                      color: Colors.transparent,
                                                      width: AppScreenUtil()
                                                          .screenWidth(115),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            basic[index],
                                                            style:
                                                            clearDataAlertNoButtonLabelStyle,
                                                            maxLines: 1,
                                                          ),
                                                        ],
                                                      )),
                                                  Transform.translate(
                                                    offset: Offset(-23, 0),
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      width: AppScreenUtil()
                                                          .screenWidth(100),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                            calculationLeft[index],
                                                            style:
                                                            clearDataAlertNoButtonLabelStyle,
                                                            maxLines: 1,
                                                          ),
                                                          Text(
                                                            calculationRight[index],
                                                            style:
                                                            clearDataAlertNoButtonLabelStyle,
                                                            maxLines: 1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Transform.translate(
                                                    offset: Offset(-5, 0),
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            monthly[index],
                                                            style:
                                                            clearDataAlertNoButtonLabelStyle,
                                                            maxLines: 1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Transform.translate(
                                                    offset: Offset(-43, 0),
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      width: AppScreenUtil()
                                                          .screenWidth(125),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            yearly[index],
                                                            style:
                                                            clearDataAlertNoButtonLabelStyle,
                                                            maxLines: 1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          MySeparator(
                                            color: subDividerColor.withOpacity(0.3),
                                          ),
                                        ],
                                      );
                                    })),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(9),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    bottom: 1,
                                    left: 4,
                                    right: 4,
                                  ),
                                  height: AppScreenUtil().screenHeight(17),
                                  width: double.infinity,
                                  color: tableTotalHeadDataColor[
                                  index % tableTotalHeadDataColor.length],
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(110),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'TOTAL',
                                                style:
                                                taxCreateEnterAPassWordLabelStyle,
                                                maxLines: 1,
                                              ),
                                            ],
                                          )),
                                      Transform.translate(
                                        offset: Offset(11, 0),
                                        child: Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(100),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '',
                                                style:
                                                clearDataAlertNoButtonLabelStyle,
                                                maxLines: 1,
                                              ),
                                              Text(
                                                '',
                                                style:
                                                clearDataAlertNoButtonLabelStyle,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(7, 0),
                                        child: Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(90),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '10000.00',
                                                style:
                                                taxCreateEnterAPassWordLabelStyle,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(145),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '12000.00',
                                              style:
                                              taxCreateEnterAPassWordLabelStyle,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ));
        })));
  }
}
