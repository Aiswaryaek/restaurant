// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class LoanList extends StatefulWidget {
  const LoanList({super.key});

  @override
  State<LoanList> createState() => _LoanListState();
}

class _LoanListState extends State<LoanList> {
  ScrollController loanTableController = ScrollController();
  double loanIndicatorPosition = 0.0;
  List<String> employee = [
    'EMp12 - VAISHAK',
    'EMp12 - VAISHAK',
    'EMp12 - VAISHAK',
    'EMp12 - VAISHAK',
    'EMp12 - VAISHAK',
    'EMp12 - VAISHAK',
    'EMp12 - VAISHAK',
    'EMp12 - VAISHAK',
    'EMp12 - VAISHAK',
  ];
  List<String> department = [
    'IT',
    'IT',
    'IT',
    'IT',
    'IT',
    'IT',
    'IT',
    'IT',
    'IT',
  ];
  List<String> designation = [
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
  ];
  List<String> mobile = [
    '9898989898',
    '9898989898',
    '9898989898',
    '9898989898',
    '9898989898',
    '9898989898',
    '9898989898',
    '9898989898',
    '9898989898',
  ];
  List<String> totalLoanAmount = [
    '10121',
    '10121',
    '10121',
    '10121',
    '10121',
    '10121',
    '10121',
    '10121',
    '10121',
  ];
  List<String> totalRepaid = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  List<String> status = [
    'Approved',
    'Pending',
    'Rejected',
    'Disbursement',
    'Approved',
    'Pending',
    'Rejected',
    'Disbursement',
    'Approved',
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final loanNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    loanTableController.addListener(() {
      setState(() {
        loanIndicatorPosition = (loanTableController.offset /
                loanTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    loanTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, bottom: 20),
          child: DefaultProductTable(
              visible: true,
              scrollController: loanTableController,
              slidingIndicatorPosition: loanIndicatorPosition,
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
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child: Text(department[index],
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
                                    child:  Text(designation[index],
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
                                    child: Text(mobile[index],
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
                                    child:  Text(totalLoanAmount[index],
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
                                    child:  Text(totalRepaid[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(110),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(bottom: 2),
                                        width: status[index] == 'Disbursement'
                                            ? AppScreenUtil().screenWidth(71)
                                            : AppScreenUtil().screenWidth(65),
                                        height:
                                            AppScreenUtil().screenHeight(18),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: status[index] == 'Approved'
                                              ? runningButtonColor
                                                  .withOpacity(0.7)
                                              : status[index] == 'Pending'
                                                  ? expiredButtonColor
                                                      .withOpacity(0.65)
                                                  : status[index] == 'Rejected'
                                                      ? cancelButtonColor
                                                          .withOpacity(0.7)
                                                      : disbursementButtonColor
                                                          .withOpacity(0.8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            status[index],
                                            style:
                                                inventoryCreateButtonLabelStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ))
                                  ],
                                )),
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
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
                      child: Center(
                        child:  Text(
                          'Department',
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
                        'Designation',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    )),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(100),
                    child: Center(
                      child: Text(
                        'Mobile',
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
                          'Total Loan amount',
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
                          'Total Repaid',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(110),
                    child: Center(
                      child: Text(
                        'Status',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    )),
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
