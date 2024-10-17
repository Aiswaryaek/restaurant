// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class PayslipListView extends StatefulWidget {
  const PayslipListView({super.key});

  @override
  State<PayslipListView> createState() => _PayslipListViewState();
}

class _PayslipListViewState extends State<PayslipListView> {
  ScrollController payrollListViewController = ScrollController();
  double payrollIndicatorPosition = 0.0;
  List<String> employee = [
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
  ];
  List<String> branch = [
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
  ];
  List<String> periodFrom = [
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
  ];
  List<String> periodTo = [
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
    '23/04/2023',
  ];
  List<String> contract = [
    'Accountant Contract',
    'Accountant Contract',
    'Accountant Contract',
    'Accountant Contract',
    'Accountant Contract',
    'Accountant Contract',
    'Accountant Contract',
    'Accountant Contract',
    'Accountant Contract',
    'Accountant Contract',
  ];
  List<String> designation = [
    'Accountant',
    'Accountant',
    'Accountant',
    'Accountant',
    'Accountant',
    'Accountant',
    'Accountant',
    'Accountant',
    'Accountant',
    'Accountant',
  ];
  List<String> department = [
    'Finance',
    'Finance',
    'Finance',
    'Finance',
    'Finance',
    'Finance',
    'Finance',
    'Finance',
    'Finance',
    'Finance',
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  @override
  void initState() {
    payrollListViewController.addListener(() {
      setState(() {
        payrollIndicatorPosition = (payrollListViewController.offset /
            payrollListViewController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    payrollListViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15,bottom: 20),
          child: DefaultProductTable( visible: true,
              scrollController: payrollListViewController,
              slidingIndicatorPosition: payrollIndicatorPosition,
              tableDataWidgets: List.generate(employee.length, (index) {
                return InkWell(
                  child: Padding(
                    padding:
                    EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///Product id data
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
                              )
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child: Text(branch[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child: Text(periodFrom[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              )
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(90),
                              child: Center(
                                child: Text(periodTo[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              )
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(120),
                              child:Center(
                                child:  Text(contract[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              )
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child: Text(designation[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              )
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child: Text(department[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    bottomBar(context);
                  },
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
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
                      child: Center(
                        child: Text(
                          'Branch',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
                      child: Center(
                        child: Text(
                          'Period From',
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
                      width: AppScreenUtil().screenWidth(90),
                      child: Center(
                        child:  Text(
                          'Period To',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(120),
                  child: Center(
                    child: Text(
                      'Contract',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  )
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Center(
                    child: Text(
                      'Designation',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  )
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Department',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ]),
        )
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
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.edit,
                        iconWidth: 15.29),
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
