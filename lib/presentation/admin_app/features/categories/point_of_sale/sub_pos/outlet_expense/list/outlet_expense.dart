// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/product_table.dart';

class OutletExpensesList extends StatefulWidget {
  const OutletExpensesList({super.key});

  @override
  State<OutletExpensesList> createState() => _OutletExpensesListState();
}

class _OutletExpensesListState extends State<OutletExpensesList> {
  ScrollController outletExpenseTableController = ScrollController();
  double outletExpenseIndicatorPosition = 0.0;
  List<String> shiftId = [
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001'
  ];
  List<String> docNo = [
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01'
  ];

  List<String> expenseType = [
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence'
  ];
  List<String> date = [
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024'
  ];
  List<String> amount = [
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000'
  ];
  List<String> paidBy = [
    'cash',
    'cash',
    'cash',
    'cash',
    'cash',
    'cash',
    'cash',
    'cash',
    'cash',
    'cash',
    'cash'
  ];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    outletExpenseTableController.addListener(() {
      setState(() {
        outletExpenseIndicatorPosition = (outletExpenseTableController.offset /
            outletExpenseTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    outletExpenseTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 10,bottom: 40),child: Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: DefaultProductTable( visible: true,
                scrollController: outletExpenseTableController,
                slidingIndicatorPosition: outletExpenseIndicatorPosition,
                tableDataWidgets: List.generate(date.length, (index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(656),
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
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(
                                        shiftId[index],
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
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(docNo[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
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
                                        expenseType[index],
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(amount[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
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
                                      child: Text(paidBy[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                }),
                tableRowWidth: 656,
                titleWidgets: [
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Shift ID',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Doc No',
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
                            'Expense Type',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
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
                    width: AppScreenUtil().screenWidth(100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Amount',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Paid By',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        )
      ],
    ),);
  }
}
