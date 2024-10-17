import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/instance_manager.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/sub_inventory.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_table_layout.dart';
import 'package:restaurant/presentation/admin_app/widgets/pay_slip_layout.dart';

import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class PaySlipTab extends StatefulWidget {
  const PaySlipTab({super.key});

  @override
  State<PaySlipTab> createState() => _PaySlipTabState();
}

class _PaySlipTabState extends State<PaySlipTab> {
  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(12),
  );

  final ManageEmployeeController manageEmployeCtrl =
      Get.put(ManageEmployeeController());

  ///Scrolling indicator and Scrolling controllers
  ScrollController payslipsTableController = ScrollController();
  double paySlipsTableIndicatorPosition = 0.0;
  @override
  void initState() {
    payslipsTableController.addListener(() {
      setState(() {
        paySlipsTableIndicatorPosition = (payslipsTableController.offset /
                payslipsTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    payslipsTableController.dispose();
    super.dispose();
  }

  ///These lists are used only for testing purpose
  List<String> transactionIdList = [
    '001',
    '001',
    '001',
    '001',
    '001',
    '001',
    '001',
    '001',
  ];
  List<String> monthList = [
    'April',
    'April',
    'April',
    'April',
    'April',
    'April',
    'April',
    'April',
  ];

  List<String> yearList = [
    '2024',
    '2024',
    '2024',
    '2024',
    '2024',
    '2024',
    '2024',
    '2024',
  ];
  List<String> netSalaryList = [
    '20000',
    '20000',
    '20000',
    '20000',
    '20000',
    '20000',
    '20000',
    '20000',
  ];
  List<String> dateList = [
    '14/10/2030',
    '14/10/2030',
    '14/10/2030',
    '14/10/2030',
    '14/10/2030',
    '14/10/2030',
    '14/10/2030',
    '14/10/2030',
  ];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(30)),
      child: Column(
        children: [
          ///Title
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(18)),
                child: Text(
                  'Payslip Summery',
                  style: leaveDetailsTitleLabelStyle,
                ),
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          ),
          Padding(
            padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(18)),
            child: EmployeeDashBoardTableLayout(
                visible: true,
                scrollController: payslipsTableController,
                slidingIndicatorPosition: paySlipsTableIndicatorPosition,
                tableDataWidgets:
                    List.generate(transactionIdList.length, (index) {
                  return InkWell(
                    onTap: () {
                      ///Bottom sheet layout
                      inventoryProductBottomSheet(context, viewOnTap: () {
                        ///Pay slip
                        showPaySlip();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(480),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: tableDataAlternateColor[
                              index % tableDataAlternateColor.length],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(18)),

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
                                      child:  Text(
                                        transactionIdList[index],
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
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Center(
                                      child:  Text(monthList[index],
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
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Center(child:  Text(
                                      yearList[index],
                                      style: dashBoardTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Center(
                                      child:  Text(netSalaryList[index],
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
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Center(
                                      child:  Text(dateList[index],
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
                  );
                }),
                tableRowWidth: 480,
                titleWidgets: [
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Transaction ID',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Month',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Year',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Net Salary',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(80),
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
                ]),
          ),
        ],
      ),
    );
  }

  ///Show payslip alert dialogue
  showPaySlip() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(15)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child:const PaySlipLayout()
               
              );
        });
  }
}
