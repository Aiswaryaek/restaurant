import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/drawer_tabs/bank_details_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/drawer_tabs/company_info_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/drawer_tabs/dash_board_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/drawer_tabs/document_details_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/drawer_tabs/inner_pages/apply_leave_screen.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/drawer_tabs/inner_pages/apply_loan_screen.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/drawer_tabs/leave_details_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/drawer_tabs/loan_details_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/drawer_tabs/pay_slips_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/drawer_tabs/personal_info_tab.dart';

import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_attendance_and_leave_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../user_app/widgets/common_image_view.dart';
import '../controller/manage_employee_controller.dart';

class EmployeeDashBoard extends StatefulWidget {
  const EmployeeDashBoard({
    super.key,
  });

  @override
  State<EmployeeDashBoard> createState() => _EmployeeDashBoardState();
}

class _EmployeeDashBoardState extends State<EmployeeDashBoard> {
  ///Sample Lists - These lists are used only for testing purpose
  List<String> leaveTypeList = ['Paid Leave', 'Sick Leave', 'Unpaid Leave'];
  List<String> usedList = ['15', '30', '33'];
  List<String> availableList = ['50', '130', '150'];
  List<Color> upcomingHolidaysContainerColors = [
    upComingHolidaysColor1.withOpacity(0.12),
    upComingHolidaysColor2.withOpacity(0.12),
    upComingHolidaysColor3.withOpacity(0.12),
    upComingHolidaysColor4.withOpacity(0.12),
  ];
  List<Color> upcomingHolidaysLabelColors = [
    upComingHolidaysColor1,
    upComingHolidaysColor2,
    upComingHolidaysColor3,
    upComingHolidaysColorThick4,
  ];
  List<String> upcomingHolidayDayList = ['5', '7', '13', '15'];
  List<String> upcomingHolidayMonthList = ['Jan', 'Feb', 'Mar', 'Dec'];
  List<String> upcomingHolidayDateRemainingList = [
    '13 Days left',
    '08 Days left',
    '05 Days left',
    '15 Days left'
  ];
  final ManageEmployeeController manageEmployeCtrl =
      Get.put(ManageEmployeeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(18)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(18),
              right: AppScreenUtil().screenWidth(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                            true;
                      },
                      child: SvgPicture.asset(ImageCons.imgDrawer,
                          height: 16.11, width: 24.1),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Profile pic
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppScreenUtil().screenHeight(16.5)),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: whiteColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 6,
                                      color: taxScreenTableBoxShadowColor)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: ClipOval(
                                child: CircleAvatar(
                                  radius: 53,
                                  backgroundColor: Colors.red,
                                  child: CommonImageView(
                                    url:
                                        'https://media.gqindia.com/wp-content/uploads/2021/05/Mohanlal.jpeg',
                                    height: double.infinity,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(8),
                        ),

                        ///Employee name layout
                        Text(
                          'Employee Name',
                          style: employeeDashBoardEmployeeNameLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(3),
                        ),

                        ///Designation layout
                        Text(
                          'Chef',
                          style: employeeDashBoardDesignationLabelStyle,
                        )
                      ],
                    ),

                    ///Vertical divider
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppScreenUtil().screenHeight(25)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(100),
                        width: AppScreenUtil().screenWidth(1.5),
                        color: employeeDashBoardDividerColor,
                      ),
                    ),

                    ///Attendance layout
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppScreenUtil().screenHeight(19)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          EmployeeDashBoardAttendanceAndLeaveLayout(
                              data: '25/31',
                              dataContainerColor:
                                  employeeDashBoardAttendanceDataContainerColor,
                              subData: 'January',
                              title: 'Attendance',
                              dataLabelStyle:
                                  employeeDashBoardAttendanceDateLabelStyle,
                              subDataLabelStyle:
                                  employeeDashBoardAttendanceMonthDateLabelStyle,
                              titleLabelStyle:
                                  employeeDashBoardAttendanceLabelStyle),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(9),
                          ),

                          ///Leave layout
                          EmployeeDashBoardAttendanceAndLeaveLayout(
                              data: '10/60',
                              dataContainerColor:
                                  employeeDashBoardLeaveDataContainerColor,
                              subData: '2023',
                              title: 'Leave',
                              dataLabelStyle:
                                  employeeDashBoardLeaveDateLabelStyle,
                              subDataLabelStyle:
                                  employeeDashBoardLeaveYearDateLabelStyle,
                              titleLabelStyle:
                                  employeeDashBoardLeaveLabelStyle),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          ///Tabs layout
          Obx(() => manageEmployeCtrl.manageEmployeeDrawerTappedItem.value ==
                  'Dashboard'
              ? const DashBoardTab()
              : manageEmployeCtrl.manageEmployeeDrawerTappedItem.value ==
                      'Personal Info'
                  ? const PersonalInfoTab()
                  : manageEmployeCtrl.manageEmployeeDrawerTappedItem.value ==
                          'Company Info'
                      ? const CompanyInfoTab()
                      : manageEmployeCtrl
                                  .manageEmployeeDrawerTappedItem.value ==
                              'Bank Details'
                          ? const BankDetailsTab()
                          : manageEmployeCtrl
                                      .manageEmployeeDrawerTappedItem.value ==
                                  'Loan Details'
                              ? const LoanDetailsTab()
                              : manageEmployeCtrl.manageEmployeeDrawerTappedItem
                                          .value ==
                                      'Leave Details'
                                  ? const LeaveDetailsTab()
                                  : manageEmployeCtrl
                                              .manageEmployeeDrawerTappedItem
                                              .value ==
                                          'Payslips'
                                      ? const PaySlipTab()
                                      : manageEmployeCtrl
                                                  .manageEmployeeDrawerTappedItem
                                                  .value ==
                                              'Apply for Loan'
                                          ? const ApplyLoanScreen()
                                          : manageEmployeCtrl
                                                      .manageEmployeeDrawerTappedItem
                                                      .value ==
                                                  'Apply for Leave'
                                              ? const ApplyLeaveScreen()
                                              : const DocumentsDetailsTab())
        ],
      ),
    );
  }
}
