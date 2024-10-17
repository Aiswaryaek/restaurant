import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_bottom_sheet_item_layout.dart';

import 'package:restaurant/presentation/admin_app/widgets/product_table.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class StaffExpensesList extends StatefulWidget {
  const StaffExpensesList({super.key});

  @override
  State<StaffExpensesList> createState() => _StaffExpensesListState();
}

class _StaffExpensesListState extends State<StaffExpensesList> {
  ScrollController staffExpenseTableController = ScrollController();
  double staffExpenseIndicatorPosition = 0.0;
  List<String> expenseList = [
    'Salary',
    'Salary',
    'Salary',
    'Salary',
    'Salary',
    'Salary',
    'Salary',
    'Salary',
    'Salary',
    'Salary',
    'Salary'
  ];
  List<String> employeNameList = [
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee'
  ];

  List<String> dateList = [
    '12/12/24',
    '12/12/24',
    '12/12/24',
    '12/12/24',
    '12/12/24',
    '12/12/24',
    '12/12/24',
    '12/12/24',
    '12/12/24',
    '12/12/24',
    '12/12/24'
  ];
  List<String> amountList = [
    '15000',
    '15000',
    '15000',
    '15000',
    '15000',
    '15000',
    '15000',
    '15000',
    '15000',
    '15000',
    '15000'
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  @override
  void initState() {
    staffExpenseTableController.addListener(() {
      setState(() {
        staffExpenseIndicatorPosition = (staffExpenseTableController.offset /
                staffExpenseTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    staffExpenseTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(16)),
      child: Column(
        children: [
          ///Scrolling layout

          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(16),
              ),
              child: DefaultProductTable(
                  scrollController: staffExpenseTableController,
                  slidingIndicatorPosition: staffExpenseIndicatorPosition,
                  tableDataWidgets: List.generate(expenseList.length, (index) {
                    return InkWell(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenWidth(5)),
                        child: Container(
                          height: AppScreenUtil().screenHeight(30),
                          width: AppScreenUtil().screenWidth(445),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: tableDataAlternateColor[
                                index % tableDataAlternateColor.length],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(5)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          expenseList[index],
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
                                      width: AppScreenUtil().screenWidth(105),
                                      child: Center(
                                        child: Text(employeNameList[index],
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
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child:  Text(
                                          dateList[index],
                                          style: dashBoardTextStyle,
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
                                          amountList[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                )
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
                  tableRowWidth: 445,
                  visible: true,
                  titleWidgets: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Expense',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(105),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Employee Name',
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
                              'Date',
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
                              'Amount',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  ///Table data widget ontap bottombar
  void bottomBar(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: AppScreenUtil().screenHeight(100),
          decoration: const BoxDecoration(
            color: confirmColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              ///Divider layout
              SizedBox(
                width: AppScreenUtil().screenWidth(50),
                child: const Center(
                  child: Divider(
                    color: whiteColor,
                    thickness: 3,
                  ),
                ),
              ),

              ///Bottomsheet item layout
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InventoryBottomSheetItemLayout(
                        iconHeight: 13.09,
                        iconPath: ImageCons.imgVisibility,
                        iconWidth: 20.53
                        
                        ),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.edit,
                        iconWidth: 15.29
                        ),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.84,
                        iconPath: ImageCons.imgDelete,
                        iconWidth: 13.91
                        ),
                        
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

