import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/sub_inventory.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_leave_details_container_layout.dart';
import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_table_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../user_app/widgets/custom_button.dart';

class LeaveDetailsTab extends StatefulWidget {
  const LeaveDetailsTab({super.key});

  @override
  State<LeaveDetailsTab> createState() => _LeaveDetailsTabState();
}

class _LeaveDetailsTabState extends State<LeaveDetailsTab> {
  String? _selectedItem;

  final List<String> _dropdownItems = ['01', '02', '03'];
  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(12),
  );
  final dateinput = TextEditingController();
  dateSelection({required TextEditingController controller}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        controller.text = formattedDate;
      });
    } else {
      if (kDebugMode) {
        print("Date is not selected");
      }
    }
  }

  final ManageEmployeeController manageEmployeCtrl =
      Get.put(ManageEmployeeController());
  ScrollController leaveDetailsTableController = ScrollController();
  double leaveDetailsIndicatorPosition = 0.0;
  @override
  void initState() {
    leaveDetailsTableController.addListener(() {
      setState(() {
        leaveDetailsIndicatorPosition = (leaveDetailsTableController.offset /
                leaveDetailsTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    leaveDetailsTableController.dispose();
    super.dispose();
  }

  List<String> leaveTypeList = [
    'Leave Type',
    'Leave Type',
    'Leave Type',
    'Leave Type',
    'Leave Type',
    'Leave Type',
    'Leave Type',
    'Leave Type',
  ];
  List<String> dateFromList = [
    '15/10/2023',
    '15/10/2023',
    '15/10/2023',
    '15/10/2023',
    '15/10/2023',
    '15/10/2023',
    '15/10/2023',
    '15/10/2023',
  ];

  List<String> dateToList = [
    '25/10/2023',
    '25/10/2023',
    '25/10/2023',
    '25/10/2023',
    '25/10/2023',
    '25/10/2023',
    '25/10/2023',
    '25/10/2023',
  ];
  List<String> daysList = [
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
  ];
  List<String> appliedOnList = [
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
      padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(24)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: AppScreenUtil().screenWidth(18),
                left: AppScreenUtil().screenWidth(18)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  EmployeeDashBoardLeaveDetailsContainerLayout(
                    containerColor: paidLeaveContainerColor,
                    subTitle: '15 / 365',
                    subTitleColor: paidLeaveLabelColor,
                    title: 'Paid Leave',
                    titleColor: paidLeaveLabelColor),
                 EmployeeDashBoardLeaveDetailsContainerLayout(
                    containerColor: sickLeaveContainerColor,
                    subTitle: '4.5 / 10',
                    subTitleColor: sickLeaveLabelColor,
                    title: 'Sick leave',
                    titleColor: sickLeaveLabelColor),
                 EmployeeDashBoardLeaveDetailsContainerLayout(
                    containerColor: unPaidLeaveContainerColor,
                    subTitle: '5 / 365',
                    subTitleColor: unPaidLeaveLabelColor,
                    title: 'Unpaid leave',
                    titleColor: unPaidLeaveLabelColor),
               ],),
                GestureDetector(
                  onTap: () {
                    manageEmployeCtrl.manageEmployeeDrawerTappedItem.value =
                        'Apply for Leave';
                  },
                  child: CustomButton(
                      buttonHeight: AppScreenUtil().screenHeight(18),
                      buttonWidth: AppScreenUtil().screenWidth(89),
                      buttonColor: redColor,
                      borderRadius: 4,
                      buttonText: 'Apply for Leave',
                      buttonLabelStyle:
                          employeeDashBoardPersonalInfoTabUpdateButtonLabelStyle),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(18)),
                child: Text(
                  'Leave Summery',
                  style: leaveDetailsTitleLabelStyle,
                ),
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          ),
          ///Leave details table layout
          Padding(
            padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(18)),
            child: EmployeeDashBoardTableLayout(
                visible: true,
                scrollController: leaveDetailsTableController,
                slidingIndicatorPosition: leaveDetailsIndicatorPosition,
                tableDataWidgets: List.generate(leaveTypeList.length, (index) {
                  return InkWell(
                    onTap: () {
                      inventoryProductBottomSheet(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(560),
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
                                      child: Text(
                                        leaveTypeList[index],
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
                                      child: Text(dateFromList[index],
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
                                      child: Text(
                                        dateToList[index],
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
                                      child:   Text(daysList[index],
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
                                      child:  Text(appliedOnList[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(80),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(top: 3),
                                        width: AppScreenUtil().screenWidth(60),
                                        height:
                                            AppScreenUtil().screenHeight(18),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color:
                                                leaveDetailsTableStatusButtonLabelStyle),
                                        child: Text(
                                          'Approved',
                                          style: leaveDetailsTableButtonLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                tableRowWidth: 560,
                titleWidgets: [
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Leave Type',
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
                          'Date From',
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
                            'Date To',
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
                            'Days',
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
                            'Applied On',
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
                          'Status',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
