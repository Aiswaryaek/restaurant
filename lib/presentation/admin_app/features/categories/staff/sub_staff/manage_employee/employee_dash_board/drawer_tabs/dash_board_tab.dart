import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/chart_indication_container_layout.dart';
import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_category_container.dart';
import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_date_and_time_layout.dart';
import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_leave_details_container_layout.dart';
import 'package:restaurant/presentation/admin_app/widgets/upcoming_holidays_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class DashBoardTab extends StatefulWidget {
  const DashBoardTab({super.key});

  @override
  State<DashBoardTab> createState() => _DashBoardTabState();
}

class _DashBoardTabState extends State<DashBoardTab> {
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
    return  Padding(
           padding:  EdgeInsets.only(top: AppScreenUtil().screenHeight(16), left: AppScreenUtil().screenWidth(18),
                right: AppScreenUtil().screenWidth(18),),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmployeeDashBoardDateAndTimeLayout(
                    containerColor: employeeDashBoardDateContainerColor,
                    data: '12/12/2012',
                    iconPath: ImageCons.imgEmployeeDashBoardCalender),
                SizedBox(
                  width: AppScreenUtil().screenWidth(10),
                ),
                EmployeeDashBoardDateAndTimeLayout(
                    containerColor: employeeDashBoardTimeContainerColor,
                    data: '12:45 pm',
                    iconPath: ImageCons.imgEmployeeDashBoardClock)
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(20),
            ),
           
            ///Category layout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EmployeeDashBoardCategoryContainer(
                    arrowColor: totalSalaryPaidLabelColor,
                    containerColor: employeeDashBoardCategoryContainerColor,
                    iconPath: ImageCons.imgTotalSalaryPaid,
                    subTitle: 'Total Salary Paid',
                    title: '200',
                    subTitleColor: totalSalaryPaidLabelColor,
                    titleColor: totalSalaryPaidLabelColor),
                EmployeeDashBoardCategoryContainer(
                    arrowColor: totalAttendanceLabelColor,
                    containerColor: totalAttendanceContainerColor,
                    iconPath: ImageCons.imgTotalAttendance,
                    subTitle: 'Total Attendance',
                    title: '200',
                    subTitleColor: totalAttendanceLabelColor,
                    titleColor: totalAttendanceLabelColor),
                EmployeeDashBoardCategoryContainer(
                    arrowColor: totalLeaveLabelColor,
                    containerColor: totalLeaveContainerColor,
                    iconPath: ImageCons.imgTotalLeaves,
                    subTitle: 'Total Leave',
                    title: '200',
                    subTitleColor: totalLeaveLabelColor,
                    titleColor: totalLeaveLabelColor)
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(19),
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EmployeeDashBoardCategoryContainer(
                    arrowColor: totalTransferLabelColor,
                    containerColor: totalTransferContainerColor,
                    iconPath: ImageCons.imgTotalTransfer,
                    subTitle: 'Total Transfer',
                    title: '200',
                    subTitleColor: totalTransferLabelColor,
                    titleColor: totalTransferLabelColor),
                EmployeeDashBoardCategoryContainer(
                    arrowColor: totalCommissionLabelColor,
                    containerColor: totalCommissionContainerColor,
                    iconPath: ImageCons.imgTotalCommission,
                    subTitle: 'Total Commission',
                    title: '200',
                    subTitleColor: totalCommissionLabelColor,
                    titleColor: totalCommissionLabelColor),
           
                ///This Sizedbox is used only for spacing arrangement
                SizedBox(
                  width: AppScreenUtil().screenWidth(98.91),
                  height: AppScreenUtil().screenHeight(79.05),
                )
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(19),
            ),
           
            /// Salary, Attendance & Leave Chart Layout
            Container(
              height: AppScreenUtil().screenHeight(200.3),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 7,
                        color: employeeDashBoardChartBoxShadowColor)
                  ],
                  color: whiteColor),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppScreenUtil().screenWidth(14),
                    vertical: AppScreenUtil().screenHeight(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Salary, Attendance & Leave Chart',
                              style: employeeDashBoardChartTitleLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(7),
                            ),
                            Container(
                              height: AppScreenUtil().screenHeight(19),
                              width: AppScreenUtil().screenWidth(60),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: dashBoardChartMonthContainerColor),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: AppScreenUtil().screenWidth(9),
                                    right: AppScreenUtil().screenWidth(6)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Month',
                                      style:
                                          employeeDashBoardChartMonthLabelStyle,
                                    ),
                                    SvgPicture.asset(ImageCons.imgChartMonthDropDownArrow,height:3.83 ,width:6.32,)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
           
                        ///Indication containers
                        Container(
                          width: AppScreenUtil().screenWidth(65),
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              const ChartIndicationContainerLayout(
                                  containerColor: salaryIndicationContainerColor,
                                  label: 'Salary'),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(3.4),
                              ),
                              const ChartIndicationContainerLayout(
                                  containerColor:
                                      attendanceIndicationContainerColor,
                                  label: 'Attendance'),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(3.4),
                              ),
                              const ChartIndicationContainerLayout(
                                  containerColor: leavesIndicationContainerColor,
                                  label: 'Leave'),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(19),
            ),
           
            ///Leave details label
            Text(
              'Leave Details',
              style: employeeDashBoardLeaveDetailsLabelStyle,
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(12),
            ),
           
            ///Leave containers layout
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
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(20),
            ),
           
            ///Leave details table layout
            Column(
              children: [
                Column(
                  children: [
                    ///Table heading
                    Container(
                      height: AppScreenUtil().screenHeight(23),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              topRight: Radius.circular(7)),
                          color: employeeDashBoardTableHeadingColor,
                          boxShadow: [
                            BoxShadow(
                                color: employeeDashBoardTableBoxShadowColor,
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(20)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Leave Type',
                                    style:
                                        tableTitleLabelStyleForEmployeeDashBoard,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(45),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Used',
                                    style:
                                        tableTitleLabelStyleForEmployeeDashBoard,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(70),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Available',
                                    style:
                                        tableTitleLabelStyleForEmployeeDashBoard,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
           
                    Column(
                        children: List.generate(
                            leaveTypeList.length,
                            (index) => Container(
                                  height: AppScreenUtil().screenHeight(23),
                                  width: double.infinity,
                                  color: whiteColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppScreenUtil().screenWidth(20)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(80),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(leaveTypeList[index],
                                                  style: tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(45),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(usedList[index],
                                                  style: tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(70),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(availableList[index],
                                                  style: tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(25),
            ),
           
            ///Upcoming holidays layout
            Container(
              // height: AppScreenUtil().screenHeight(133),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: const [
                    BoxShadow(
                        color: employeeDashBoardTableBoxShadowColor,
                        offset: Offset(0, 3),
                        blurRadius: 6)
                  ]),
              child: Padding(
                padding: EdgeInsets.only(
                    left: AppScreenUtil().screenWidth(12),
                    right: AppScreenUtil().screenWidth(15),
                    top: AppScreenUtil().screenHeight(8),
                    bottom: AppScreenUtil().screenHeight(13)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upcoming Holidays',
                      style: upcomingHolidaysLabelStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(10),
                    ),
           
                    ///Upcoming holidays data layout
                    Column(
                      children: List.generate(
                          upcomingHolidayDayList.length,
                          (index) => UpcomingHolidaysLayout(
                              containerColor:
                                  upcomingHolidaysContainerColors[index],
                              dateReminderLabel:
                                  upcomingHolidayDateRemainingList[index],
                              day: upcomingHolidayDayList[index],
                              holidayMainLabel: 'Public Holiday',
                              labelColor: upcomingHolidaysLabelColors[index],
                              month: upcomingHolidayMonthList[index])),
                    )
                  ],
                ),
              ),
            )],),
         );
  }
}