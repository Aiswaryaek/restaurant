// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/image_constant.dart';
import '../../../../../../user_app/widgets/label_textfield.dart';
import '../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../widgets/inventory_tab_layout.dart';
import '../../../../../widgets/product_table.dart';

class StaffDashboard extends StatefulWidget {
  const StaffDashboard({super.key});

  @override
  State<StaffDashboard> createState() => _StaffDashboardState();
}

class _StaffDashboardState extends State<StaffDashboard> {
  List<double> get yValues => const [1, 2, 3, 4, 5, 150, 1];

  List<String> get weekDays =>
      const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  late double touchedValue;
  bool fitInsideBottomTitle = true;
  bool fitInsideLeftTitle = false;
  ScrollController staffDashboardTableScrollController = ScrollController();
  double staffDashboardTableIndicatorPosition = 0.0;
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
final timeController = TextEditingController();
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final isTouched = value == touchedValue;
    final style = TextStyle(
      color: isTouched
          ? adminDashBoardDateDropDownContainerBoxShadowColor
          : blackColor,
      fontWeight: FontWeight.bold,
    );

    if (value % 1 != 0) {
      return Container();
    }
    return SideTitleWidget(
      space: 4,
      axisSide: meta.axisSide,
      fitInside: fitInsideBottomTitle
          ? SideTitleFitInsideData.fromTitleMeta(meta, distanceFromEdge: 0)
          : SideTitleFitInsideData.disable(),
      child: Text(
        weekDays[value.toInt()],
        style: staffLeftLabelStyle,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    if (value % 1 != 0) {
      return Container();
    }
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1:
        text = '20';
        break;
      case 2:
        text = '40';
        break;
      case 3:
        text = '60';
        break;
      case 4:
        text = '80';
        break;
      case 5:
        text = '100';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 6,
      fitInside: fitInsideLeftTitle
          ? SideTitleFitInsideData.fromTitleMeta(meta)
          : SideTitleFitInsideData.disable(),
      child:
          Text(text, style: staffLeftLabelStyle, textAlign: TextAlign.center),
    );
  }

  List<String> no = [
    '01',
    '01',
    '01',
    '01',
    '01',
    '01',
  ];
  List<String> employeeId = [
    'EMP-W2200',
    'EMP-W2200',
    'EMP-W2200',
    'EMP-W2200',
    'EMP-W2200',
    'EMP-W2200',
  ];
  List<String> name = [
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
  ];
  List<String> inTime = [
    '9:00 AM',
    '9:00 AM',
    '9:00 AM',
    '9:00 AM',
    '9:00 AM',
    '9:00 AM',
  ];
  List<String> outTime = [
    '6.00 PM',
    '6.00 PM',
    '6.00 PM',
    '6.00 PM',
    '6.00 PM',
    '6.00 PM',
  ];
  List<String> totalWorkHours = [
    '9 Hours',
    '9 Hours',
    '9 Hours',
    '9 Hours',
    '9 Hours',
    '9 Hours',
  ];
  List<String> breakIn = [
    '12:00 PM',
    '12:00 PM',
    '12:00 PM',
    '12:00 PM',
    '12:00 PM',
    '12:00 PM',
  ];

  List<String> breakOut = [
    '3:00 PM',
    '3:00 PM',
    '3:00 PM',
    '3:00 PM',
    '3:00 PM',
    '3:00 PM',
  ];
  List<String> totalBreakHours = [
    '4 Hours',
    '4 Hours',
    '4 Hours',
    '4 Hours',
    '4 Hours',
    '4 Hours',
  ];
  List<String> date = [
    '09-12-2022',
    '09-12-2022',
    '09-12-2022',
    '09-12-2022',
    '09-12-2022',
    '09-12-2022',
  ];
  List<String> leave = [
    '20',
    '20',
    '20',
    '20',
    '20',
    '20',
  ];
  List<String> view = [
    ImageCons.imgVisibility,
    ImageCons.imgVisibility,
    ImageCons.imgVisibility,
    ImageCons.imgVisibility,
    ImageCons.imgVisibility,
    ImageCons.imgVisibility,
  ];
  List<String> status = [
    'Status',
    'Status',
    'Status',
    'Status',
    'Status',
    'Status',
  ];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  List<Color> notificationAlternateColor = [
    confirmColor.withOpacity(0.6),
    leftContainerNotificationColor.withOpacity(0.5),
    leftContainerNotification3Color.withOpacity(0.5)
  ];

  @override
  void initState() {
    super.initState();
    touchedValue = -1;
    timeController.text = "";
    fromDateController.text='';
    toDateController.text='';
    staffDashboardTableScrollController.addListener(() {
      setState(() {
        staffDashboardTableIndicatorPosition =
            (staffDashboardTableScrollController.offset /
                    staffDashboardTableScrollController
                        .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }
  Future<void> timeSelection( {required TextEditingController controller}) async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                // Using 12-Hour format
                  alwaysUse24HourFormat: false),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        controller.text = result.format(context);
      });
    }
  }

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

  @override
  void dispose() {
    staffDashboardTableScrollController.dispose();

    super.dispose();
  }
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 1.3),
                    height: AppScreenUtil().screenHeight(12),
                    width: AppScreenUtil().screenWidth(54),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: confirmColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageCons.imgStaffCalender,
                          color: whiteColor,
                          height: 6,
                        ),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(5),
                        ),
                        Text(
                          '04/03/2024',
                          style: staffDashboardDateTextStyle,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(5),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 1.3),
                    height: AppScreenUtil().screenHeight(12),
                    width: AppScreenUtil().screenWidth(54),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: confirmColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageCons.imgStaffClock,
                          color: whiteColor,
                          height: 6,
                        ),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(5),
                        ),
                        Text(
                          '10.32 AM',
                          style: staffDashboardDateTextStyle,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: AppScreenUtil().screenHeight(83),
                    width: AppScreenUtil().screenWidth(90),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: whiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color:
                              adminDashBoardDateDropDownContainerBoxShadowColor,
                          offset: Offset(1, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 5, 8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: confirmColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  AppScreenUtil().screenWidth(15)),
                              topRight: Radius.circular(
                                  AppScreenUtil().screenWidth(15)),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                ImageCons.imgStaffEmployee,
                                height: AppScreenUtil().screenHeight(25),
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(5),
                              ),
                              Text(
                                'Total Employees',
                                style:
                                    clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(3),
                        ),
                        Text(
                          '256',
                          style: staffExpenseContainerStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: AppScreenUtil().screenHeight(83),
                    width: AppScreenUtil().screenWidth(90),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: whiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color:
                              adminDashBoardDateDropDownContainerBoxShadowColor,
                          offset: Offset(1, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 12, 5, 8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: confirmColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  AppScreenUtil().screenWidth(15)),
                              topRight: Radius.circular(
                                  AppScreenUtil().screenWidth(15)),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                ImageCons.imgStaffDepartmentIcon,
                                height: AppScreenUtil().screenHeight(22),
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(6),
                              ),
                              Text(
                                'Total Departments',
                                style:
                                    clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(3),
                        ),
                        Text(
                          '5',
                          style: staffExpenseContainerStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: AppScreenUtil().screenHeight(83),
                    width: AppScreenUtil().screenWidth(90),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: whiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color:
                              adminDashBoardDateDropDownContainerBoxShadowColor,
                          offset: Offset(1, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 12, 5, 8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: confirmColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  AppScreenUtil().screenWidth(15)),
                              topRight: Radius.circular(
                                  AppScreenUtil().screenWidth(15)),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                ImageCons.imgStaffExpenses,
                                height: AppScreenUtil().screenHeight(22),
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(6),
                              ),
                              Text(
                                'Total Expense',
                                style:
                                    clearDataAlertEnterPasswordSubmitButtonLabelStyle,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(3),
                        ),
                        Text(
                          '10',
                          style: staffExpenseContainerStyle,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Container(
                height: AppScreenUtil().screenHeight(185),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: adminDashBoardTotalRevenueGraphContainerColor
                            .withOpacity(0.65),
                        width: 0.14),
                    borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(AppScreenUtil().screenWidth(10)),
                        topRight:
                            Radius.circular(AppScreenUtil().screenWidth(10))),
                    color: adminDashBoardTotalRevenueGraphContainerColor
                        .withOpacity(0.65)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: AppScreenUtil().screenHeight(170),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                AppScreenUtil().screenWidth(10)),
                            topRight: Radius.circular(
                                AppScreenUtil().screenWidth(10))),
                        color: adminDashBoardIconWhiteColor.withOpacity(0.98)),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(9, 15, 9, 9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Expenses',
                                  style: searchBranchTextStyle,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 7, 5, 7),
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: searchTextColor,
                                          offset: Offset(0, 0),
                                          blurRadius: 1,
                                        ),
                                      ]),
                                  height: AppScreenUtil().screenHeight(24),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Transform.translate(
                                        offset: Offset(0, -2),
                                        child: Text(
                                          'Today',
                                          style: floorCreateTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(3),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        width: AppScreenUtil().screenWidth(1),
                                        color: confirmColor,
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(3),
                                      ),
                                      Transform.translate(
                                        offset: Offset(0, -1),
                                        child: Text(
                                          'Week',
                                          style: floorCreateTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(3),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        width: AppScreenUtil().screenWidth(1),
                                        color: confirmColor,
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(3),
                                      ),
                                      Transform.translate(
                                        offset: Offset(0, -1),
                                        child: Text(
                                          'Month',
                                          style: floorCreateTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(13),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 300,
                                  height: 113,
                                  child: LineChart(
                                    LineChartData(
                                      gridData: FlGridData(
                                        show: false,
                                      ),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        topTitles: const AxisTitles(
                                          sideTitles:
                                              SideTitles(showTitles: false),
                                        ),
                                        rightTitles: const AxisTitles(
                                          sideTitles:
                                              SideTitles(showTitles: false),
                                        ),
                                        leftTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            // reservedSize: 40,
                                            getTitlesWidget: leftTitleWidgets,
                                          ),
                                        ),
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            // reservedSize: 40,
                                            getTitlesWidget: bottomTitleWidgets,
                                          ),
                                        ),
                                      ),
                                      borderData: FlBorderData(show: false),
                                      minY: 0,
                                      lineBarsData: [
                                        LineChartBarData(
                                          spots:
                                              yValues.asMap().entries.map((e) {
                                            return FlSpot(
                                                e.key.toDouble(), e.value);
                                          }).toList(),
                                          isCurved: false,
                                          color:
                                              adminDashBoardTotalItemContainerColor
                                                  .withOpacity(0.5),
                                          barWidth: 1.2,
                                          dotData: FlDotData(
                                            show: true,
                                            getDotPainter: (spot, percent,
                                                    barData, index) =>
                                                FlDotCirclePainter(
                                                    radius: 3,
                                                    color:
                                                        adminDashBoardTotalItemContainerColor // Set dot color here
                                                    ),
                                          ),
                                          belowBarData: BarAreaData(
                                            show: true,
                                            color:
                                                adminDashBoardTotalItemContainerColor
                                                    .withOpacity(0.1),
                                            // gradientColorStops: [0.2, 1.0],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 15, 15),
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: adminDashBoardDateDropDownContainerBoxShadowColor,
                      offset: Offset(0, 0),
                      blurRadius: 6,
                    ),
                  ],
                ),
                width: double.infinity,
                height: AppScreenUtil().screenHeight(102),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notice Board',
                      style: dottedTextFieldColoredInputTextStyle,
                    ),
                    GestureDetector(
                      child: Container(
                          padding: EdgeInsets.only(bottom: 1),
                          height: AppScreenUtil().screenHeight(19),
                          width: AppScreenUtil().screenWidth(59),
                          color: confirmColor,
                          child: Center(
                            child: Text(
                              'Add Board',
                              style: dineInTextStyle,
                            ),
                          )),
                      onTap: () {
                        addNote(context);
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Employee',
                    style: employeeButtonLabelStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      notification(context);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: const [
                            BoxShadow(
                              color:
                                  adminDashBoardDateDropDownContainerBoxShadowColor,
                              offset: Offset(0, 0),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        height: AppScreenUtil().screenHeight(19),
                        width: AppScreenUtil().screenWidth(59),
                        child: Center(
                            child: Text(
                          'Notification',
                          style: notificationTextStyle,
                        ))),
                  )
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(30),
              ),
              SizedBox(
                height: 150,
                child: PieChart(PieChartData(
                    centerSpaceRadius: 75,
                    centerSpaceColor: whiteColor,
                    borderData: FlBorderData(show: false),
                    sections: [
                      PieChartSectionData(
                        value: 0.8,
                        color: whiteColor,
                        radius: 25,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                          value: 90,
                          color: confirmColor,
                          radius: 25,
                          showTitle: false),
                      // PieChartSectionData(value: 20, color: Colors.amber, radius: 35),
                    ])),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(40),
              ),
              Row(
                children: [
                  Container(
                    color: dashBoardChartMonthLabelColor,
                    height: AppScreenUtil().screenHeight(16),
                    width: AppScreenUtil().screenWidth(16),
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(8),
                  ),
                  Text(
                    'Female',
                    style: whatsTextStyle,
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(15),
                  ),
                  Container(
                    color: confirmColor,
                    height: AppScreenUtil().screenHeight(16),
                    width: AppScreenUtil().screenWidth(16),
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(8),
                  ),
                  Text(
                    'Male',
                    style: whatsTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
              Text(
                'Attendance',
                style: tableHeadingLabelStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 40),
          child: DefaultProductTable(
              visible: true,
              scrollController: staffDashboardTableScrollController,
              slidingIndicatorPosition: staffDashboardTableIndicatorPosition,
              tableDataWidgets: List.generate(no.length, (index) {
                return GestureDetector(
                  onTap: () {
                    bottomBar(context);
                  },
                  child: Container(
                    height: AppScreenUtil().screenHeight(36),
                    width: AppScreenUtil().screenWidth(1142),
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child: Text(
                                    no[index],
                                    style: posSettingsDropDownStyle,
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
                              Container( color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(90),child: Center(
                                  child:  Text(employeeId[index],
                                      style: posSettingsDropDownStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child: Text(name[index],
                                      style: posSettingsDropDownStyle,
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child: Text(inTime[index],
                                      style: posSettingsDropDownStyle,
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child:  Text(outTime[index],
                                      style: posSettingsDropDownStyle,
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
                                  child:  Text(totalWorkHours[index],
                                      style: posSettingsDropDownStyle,
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child:  Text(breakIn[index],
                                      style: posSettingsDropDownStyle,
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child:  Text(breakOut[index],
                                      style: posSettingsDropDownStyle,
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
                                  child: Text(totalBreakHours[index],
                                      style: posSettingsDropDownStyle,
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child:  Text(date[index],
                                      style: posSettingsDropDownStyle,
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child: Text(leave[index],
                                      style: posSettingsDropDownStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              )
                            ],
                          ),
                          Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(90),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 3),
                                    width: AppScreenUtil().screenWidth(60),
                                    height: AppScreenUtil().screenHeight(18),
                                    color: greenColor,
                                    child: Text(
                                      status[index],
                                      style: cartSelectedTabLabelTextStyle,
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
                );
              }),
              tableRowWidth: 1142,
              titleWidgets: [
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Employee ID',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Name',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'In',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Out',
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
                        'Total Work Hours',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Break In',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Break Out',
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
                        'Total Break Hours',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
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
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Leave',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
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
    );
  }void bottomBar(BuildContext context) {
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
                        iconPath: ImageCons.imgDisabledEdit,
                        iconWidth: 15.29),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.84,
                        iconPath: ImageCons.imgDisabledDelete,
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


  void addNote(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                // borderRadius:
                //     BorderRadius.circular(25), // Set border radius here
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(18, 15, 18, 20),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(6),
                  color: constantWhite,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Board',
                      style: tableNoLabelStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(15),
                    ),
                    LabelTextField(
                      radius: 4,
                      labelText: 'Title',
                      controller: titleController,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(20),
                    ),
                    LabelTextField(
                      maxLines: 4,
                      textFieldSize: 60,
                      labelText: 'Note',
                      radius: 4,
                      controller: noteController,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(20),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 37,
                          child: TextField(  readOnly: true,
                            onTap: () {
                              dateSelection(controller: fromDateController);
                            },
                            style: labelTextInputTextStyle,
                            controller: fromDateController,
                            decoration: InputDecoration(isDense: true,
                              suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                child: SvgPicture.asset(
                                  ImageCons.imgColoredCalender,
                                  height: 13,
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'From Date',
                              labelStyle: addReservationLabelTextStyle,
                              contentPadding: EdgeInsets.all(10), suffixIconConstraints: const BoxConstraints(
                                minWidth: 30,
                                minHeight: 25,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                            ),
                          ),
                        )),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(10),
                        ),
                        Expanded(
                            child: SizedBox(
                          height: 37,
                          child: TextField(  readOnly: true,
                            onTap: () {
                              dateSelection(controller: toDateController);
                            },
                            style: labelTextInputTextStyle,
                            controller: toDateController,
                            decoration: InputDecoration(isDense: true,
                              suffixIconConstraints: const BoxConstraints(
                                minWidth: 30,
                                minHeight: 25,
                              ),
                              suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                child: SvgPicture.asset(
                                  ImageCons.imgColoredCalender,
                                  height: 13,
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'To Date',
                              labelStyle: addReservationLabelTextStyle,
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(20),
                    ),
                    SizedBox(
                      height: 37,
                      child: TextField(
                        onTap: () {
                          timeSelection(controller: timeController);
                        },
                        style: labelTextInputTextStyle,
                        controller: timeController,  readOnly: true,
                        decoration: InputDecoration(isDense: true,
                          suffixIcon: Padding(
                            padding:
                            const EdgeInsets.only(top: 12, bottom: 12),
                            child: SvgPicture.asset(
                              ImageCons.imgEmployeeDashBoardClock,color: confirmColor,
                              height: 13,
                            ),
                          ),
                          floatingLabelBehavior:
                          FloatingLabelBehavior.always,
                          labelText: 'Time',
                          labelStyle: addReservationLabelTextStyle,
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                color: labelTextFieldBorderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                color: labelTextFieldBorderColor),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                color: labelTextFieldBorderColor),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                color: labelTextFieldBorderColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: AppScreenUtil().screenWidth(70),
                            height: AppScreenUtil().screenHeight(20),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: blackColor)),
                            child: Center(
                              child: Text('Cancel',
                                  style: categoryMenuTextStyle,
                                  textAlign: TextAlign.center),
                            )),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(8),
                        ),
                        InkWell(
                          child: Container(
                              width: AppScreenUtil().screenWidth(70),
                              height: AppScreenUtil().screenHeight(20),
                              decoration: BoxDecoration(
                                  color: confirmColor,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: confirmColor)),
                              child: Center(
                                child: Text('Submit',
                                    style: confirmTextStyle,
                                    textAlign: TextAlign.center),
                              )),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void notification(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                // borderRadius:
                //     BorderRadius.circular(10), // Set border radius here
              ),
              child: Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(6),
                  color: constantWhite,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18, right: 18, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Notifications',
                            style: tableNoLabelStyle,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 6, 5, 6),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                boxShadow: const [
                                  BoxShadow(
                                    color: searchTextColor,
                                    offset: Offset(-1, 1),
                                    blurRadius: 5,
                                  ),
                                ]),
                            height: AppScreenUtil().screenHeight(22.5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Transform.translate(
                                  offset: Offset(0, -2),
                                  child: Text(
                                    'Today',
                                    style: floorCreateTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(3),
                                ),
                                Container(
                                  height: double.infinity,
                                  width: AppScreenUtil().screenWidth(1),
                                  color: confirmColor,
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(3),
                                ),
                                Transform.translate(
                                  offset: Offset(0, -1),
                                  child: Text(
                                    'Week',
                                    style: floorCreateTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(3),
                                ),
                                Container(
                                  height: double.infinity,
                                  width: AppScreenUtil().screenWidth(1),
                                  color: confirmColor,
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(3),
                                ),
                                Transform.translate(
                                  offset: Offset(0, -1),
                                  child: Text(
                                    'Month',
                                    style: floorCreateTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(15),
                    ),
                  Column(
                    children:   List.generate(4, (index) {
                      return Container(
                        height: AppScreenUtil().screenHeight(41),
                        color:  notificationAlternateColor[
                        index % notificationAlternateColor.length],
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                            padding: EdgeInsets.only(left: 12,right: 12),
                            color: whiteColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Job Application Mail',
                                      style: staffNotificationTitleLabelStyle,
                                    ),
                                    SizedBox(height: AppScreenUtil().screenHeight(6),),
                                    Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting',
                                      overflow: TextOverflow.ellipsis,style: staffDashboardSubtitleStyle,
                                    ),

                                  ],
                                ),),
                                SizedBox(width: AppScreenUtil().screenWidth(8),),
                                Text('10 min ago',style: staffNotificationLabelStyle,),
                              ],
                            )
                        ),
                      );},
                  )),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(10),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
