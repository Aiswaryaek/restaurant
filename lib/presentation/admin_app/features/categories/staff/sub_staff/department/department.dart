// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/product_table.dart';

class Department extends StatefulWidget {
  const Department({super.key});

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  ScrollController departmentTableController = ScrollController();
  double departmentIndicatorPosition = 0.0;

  List<String> no = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11'
  ];
  List<String> departmentName = [
    'Name of Department',
    'Name of Department',
    'Name of Department',
    'Name of Department',
    'Name of Department',
    'Name of Department',
    'Name of Department',
    'Name of Department',
    'Name of Department',
    'Name of Department',
    'Name of Department'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: DefaultProductTable(
                visible: false,
                scrollController: departmentTableController,
                slidingIndicatorPosition: departmentIndicatorPosition,
                tableDataWidgets: List.generate(no.length, (index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(330),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Center(
                                      child: Text(
                                        no[index],
                                        style: dashBoardTextStyle,
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
                                        departmentName[index],
                                        style: dashBoardTextStyle,
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
                    ),
                    onTap: () {},
                  );
                }),
                tableRowWidth: 330,
                titleWidgets: [
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No.',
                          style: tableTitleLabelStyle,
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
                            'Department Name',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                ]),
          ),
        )
      ],
    );
  }
}
