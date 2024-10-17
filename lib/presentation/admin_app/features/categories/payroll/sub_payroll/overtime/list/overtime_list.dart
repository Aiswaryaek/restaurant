// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/product_table.dart';

class OvertimeList extends StatefulWidget {
  const OvertimeList({super.key});

  @override
  State<OvertimeList> createState() => _OvertimeListState();
}

class _OvertimeListState extends State<OvertimeList> {
  ScrollController leaveTableController = ScrollController();
  double leaveIndicatorPosition = 0.0;
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  List<String> employee = [
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
  ];
  List<String> date = [
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
  ];
  List<String> overtimeType = [
    'Normal',
    'Holiday',
    'Normal',
    'Holiday',
    'Normal',
    'Holiday',
    'Normal',
    'Holiday',
    'Normal',
  ];
  List<String> duration = [
    '10',
    '2',
    '10',
    '2',
    '10',
    '2',
    '10',
    '2',
    '10',
  ];
  List<String> unitType = [
    'Hour',
    'Day',
    'Hour',
    'Day',
    'Hour',
    'Day',
    'Hour',
    'Day',
    'Hour',
  ];
  List<String> amount = [
    '10.00',
    '20.00',
    '10.00',
    '20.00',
    '10.00',
    '20.00',
    '10.00',
    '20.00',
    '10.00',
  ];
  List<String> overtimeAmount = [
    '100.00',
    '200.00',
    '100.00',
    '200.00',
    '100.00',
    '200.00',
    '100.00',
    '200.00',
    '100.00',
  ];

  @override
  void initState() {
    leaveTableController.addListener(() {
      setState(() {
        leaveIndicatorPosition = (leaveTableController.offset /
            leaveTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    leaveTableController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, bottom: 40),
      child: DefaultProductTable(
          visible: true,
          scrollController: leaveTableController,
          slidingIndicatorPosition: leaveIndicatorPosition,
          tableDataWidgets: List.generate(employee.length, (index) {
            return InkWell(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: AppScreenUtil().screenWidth(5)),
                child: Container(
                  height: AppScreenUtil().screenHeight(36),
                  width: AppScreenUtil().screenWidth(758),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: tableDataAlternateColor[
                    index % tableDataAlternateColor.length],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(5)),

                    ///scrolling row
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(110),
                            child: Center(
                              child: Text(
                                employee[index],
                                style: dashBoardTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child: Text(date[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
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
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child: Text(overtimeType[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
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
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child: Text(duration[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
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
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child:  Text(unitType[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
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
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child:  Text(amount[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
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
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child: Text(overtimeAmount[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {},
            );
          }),
          tableRowWidth: 758,
          titleWidgets: [
            Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(110),
                child: Center(
                  child: Text(
                    'Employee',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Center(
                    child: Text(
                      'Date',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
            Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(100),
                child: Center(
                  child: Text(
                    'OverTime Type',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),
                )),
            Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(100),
                child: Center(
                  child: Text(
                    'Duration',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Center(
                    child:  Text(
                      'Unit Type',
                      style: tableTitleLabelStyle,
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
                      'Amount',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
            Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(100),
                child: Center(
                  child: Text(
                    'Overtime Amount',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),
                )),
          ]),
    );
  }
}
