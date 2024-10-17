// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant/presentation/admin_app/widgets/admin_dash_board_main_container.dart';
import 'package:restaurant/presentation/admin_app/widgets/admin_dashboard_table_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../home/controller/home_controller.dart';

class AdminDashBoard extends StatefulWidget {
  AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  ScrollController recentSalesScrollController = ScrollController();
  ScrollController creditDetailScrollController = ScrollController();
  double recentSalesIndicatorPosition = 0.0;
  double creditDetailsIndicatorPosition = 0.0;
  ScrollController staffExpiredDocumentsScrollController = ScrollController();
  double staffExpiredDocumentsIndicatorPosition = 0.0;
  List<Color> tableDataAlternateColor = [
    constantWhite,
    backGroundColor.withOpacity(0.5),
  ];

  ///These lists are used only for testing purpose
  ///
  List<String> branchList = ['Kollam', 'Kollam', 'Kollam', 'Kollam'];
  List<String> employList = [
    'Employee1',
    'Employee2',
    'Employee3',
    'Employee4'
  ];
  List<String> employIdList = [
    'GDSKN145445',
    'GDSKN145434',
    'GDSKN145436',
    'GDSKN145450'
  ];
  List<String> orderIdList = ['WOP434', 'WOP438', 'WOP441', 'WOP450'];
  List<String> documentsList = ['Voter ID', 'Voter ID', 'Voter ID', 'Voter ID'];

  List<String> dateList = ['26-04-23', '27-04-23', '28-04-23', '15-04-23'];

  List<String> customerNameList = ['Anshad', 'Anshad', 'Anshad', 'Anshad'];

  List<String> itemQuantityList = ['5', '4', '3', '8', '3'];

  List<String> amountList = ['500', '400', '300', '800', '300'];
  final List<String> categoryItems = [
    'Week',
    'Month',
    'Year',
  ];
  String? selectedCategory = 'Week';

  @override
  void initState() {
    super.initState();
    recentSalesScrollController.addListener(() {
      setState(() {
        recentSalesIndicatorPosition = (recentSalesScrollController.offset /
                recentSalesScrollController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    staffExpiredDocumentsScrollController.addListener(() {
      setState(() {
        staffExpiredDocumentsIndicatorPosition =
            (staffExpiredDocumentsScrollController.offset /
                    staffExpiredDocumentsScrollController
                        .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
    creditDetailScrollController.addListener(() {
      setState(() {
        creditDetailsIndicatorPosition = (creditDetailScrollController.offset /
                creditDetailScrollController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
  }

  final AdminHomeController adminHomeController =
      Get.put(AdminHomeController());
  List<String> name = [
    'Mike Wheeler',
    'Jim Hopper',
    'Jonathan Byers',
    'Billy Butcher',
    'Hughie Campbell',
    'Jonas Kahnwald',
    'Hannah Kahnwald',
    'Peter Doppler',
  ];
  List<String> topName = [
    'Mike Wheeler',
    'Jim Hopper',
    'Jonathan Byers',
    'Billy Butcher',
    'Hughie Campbell',
    'Jonas Kahnwald',
    'Hannah Kahnwald',
    'Peter Doppler',
  ];
  List<String> orders = [
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
  ];
  List<String> topOrders = [
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
  ];
  List<String> amount = [
    '25420.00',
    '85420.00',
    '6580.00',
    '658.00',
    '58458.00',
    '96320.00',
    '10000.00',
    '7500.00',
  ];
  List<String> topAmount = [
    '25420.00',
    '85420.00',
    '6580.00',
    '658.00',
    '58458.00',
    '96320.00',
    '10000.00',
    '7500.00',
  ];

  @override
  void dispose() {
    recentSalesScrollController.dispose();
    creditDetailScrollController.dispose();
    staffExpiredDocumentsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppScreenUtil().screenHeight(25),
          ),

          ///Dashboard label
          Align(
            alignment: Alignment.center,
            child: Text(
              'Dashboard',
              style: btnTextStyle,
            ),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(17),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: AppScreenUtil().screenHeight(23),
                  width: AppScreenUtil().screenWidth(126),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: dashboardGraphShadowColor,
                        offset: Offset(0, 0),
                        blurRadius: 13,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: AppScreenUtil().screenHeight(15),
                      ),
                      Text(
                        'Sales',
                        style: pangramRegular(size: 9.0, color: blackColor),
                      ),
                      SizedBox(
                        width: AppScreenUtil().screenWidth(17),
                      ),
                      Text(
                        'AED 254000.00',
                        style: pangramMedium(
                            size: 7.0, color: dashboardGraphMainGreenColor),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: AdminDashBoardGraph()),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                Container(
                  height: AppScreenUtil().screenHeight(23),
                  width: AppScreenUtil().screenWidth(126),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: dashboardGraphShadowColor,
                        offset: Offset(0, 0),
                        blurRadius: 13,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: AppScreenUtil().screenHeight(20),
                      ),
                      Text(
                        'Top Selling Products',
                        style: pangramRegular(size: 9.0, color: blackColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      child: SizedBox(
                        height: AppScreenUtil().screenHeight(227.59),
                        width: AppScreenUtil().screenWidth(524.82),
                        child: BarChart(
                          BarChartData(
                            titlesData: FlTitlesData(
                              // bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                              // leftTitles: AxisTitles(sideTitles: _leftTitles),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: false,
                                ),
                              ),
                              rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            gridData: FlGridData(
                              horizontalInterval: 100,
                              verticalInterval: 10,
                              drawVerticalLine: true,
                            ),
                            minY: 0,
                            maxY: 1000,
                            borderData: FlBorderData(
                              border: const Border(
                                top: BorderSide.none,
                                right: BorderSide.none,
                                left: BorderSide(
                                    width: 1, color: invoiceGraphBorderColor),
                                bottom: BorderSide(
                                    width: 1, color: invoiceGraphBorderColor),
                              ),
                            ),
                            // groupsSpace: 10,
                            // add bars
                            barGroups: [
                              BarChartGroupData(
                                x: 10,
                                barRods: [
                                  BarChartRodData(
                                    toY: 620,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 20,
                                barRods: [
                                  BarChartRodData(
                                    toY: 920,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 30,
                                barRods: [
                                  BarChartRodData(
                                    toY: 790,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 40,
                                barRods: [
                                  BarChartRodData(
                                    toY: 400,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 50,
                                barRods: [
                                  BarChartRodData(
                                    toY: 300,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 60,
                                barRods: [
                                  BarChartRodData(
                                    toY: 630,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 70,
                                barRods: [
                                  BarChartRodData(
                                    toY: 980,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                      
                              BarChartGroupData(
                                x: 80,
                                barRods: [
                                  BarChartRodData(
                                    toY: 790,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 90,
                                barRods: [
                                  BarChartRodData(
                                    toY: 400,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 100,
                                barRods: [
                                  BarChartRodData(
                                    toY: 640,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 100,
                                barRods: [
                                  BarChartRodData(
                                    toY: 400,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 120,
                                barRods: [
                                  BarChartRodData(
                                    toY: 150,
                                    width: 17.94,
                                    color: dashboardGraphMainGreenColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: AppScreenUtil().screenHeight(20),
                ),
                Container(
                  height: AppScreenUtil().screenHeight(23),
                  width: AppScreenUtil().screenWidth(126),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: dashboardGraphShadowColor,
                        offset: Offset(0, 0),
                        blurRadius: 13,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: AppScreenUtil().screenHeight(20),
                      ),
                      Text(
                        'Top Customers',
                        style: pangramRegular(size: 9.0, color: blackColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(10),
                ),
                Container(
                  height: AppScreenUtil().screenHeight(26),
                  width: AppScreenUtil().screenWidth(342),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: dashboardGraphMainGreenColor),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(5)),

                    ///scrolling row
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(90),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Name',
                                  style: pangramRegular(
                                      size: 10.0, color: whiteColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
                                  'Orders',
                                  style: pangramRegular(
                                      size: 10.0, color: whiteColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
                                  style: pangramRegular(
                                      size: 10.0, color: whiteColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: List.generate(topName.length, (index) {
                    return Container(
                      height: AppScreenUtil().screenHeight(23),
                      width: AppScreenUtil().screenWidth(342),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(90),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      topName[index],
                                      style: pangramRegular(
                                          size: 8.0, color: blackColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                                      topOrders[index],
                                      style: pangramRegular(
                                          size: 8.0, color: blackColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                                      topAmount[index],
                                      style: pangramRegular(
                                          size: 8.0, color: blackColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                ///Top Credit Customers
                SizedBox(
                  height: AppScreenUtil().screenHeight(25),
                ),
                Container(
                  height: AppScreenUtil().screenHeight(23),
                  width: AppScreenUtil().screenWidth(126),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: dashboardGraphShadowColor,
                        offset: Offset(0, 0),
                        blurRadius: 13,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: AppScreenUtil().screenHeight(20),
                      ),
                      Text(
                        'Top Credit Customers',
                        style: pangramRegular(size: 9.0, color: blackColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(10),
                ),
                Container(
                  height: AppScreenUtil().screenHeight(26),
                  width: AppScreenUtil().screenWidth(342),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: dashboardGraphMainGreenColor),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(5)),

                    ///scrolling row
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(90),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Name',
                                  style: pangramRegular(
                                      size: 10.0, color: whiteColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
                                  'Orders',
                                  style: pangramRegular(
                                      size: 10.0, color: whiteColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
                                  style: pangramRegular(
                                      size: 10.0, color: whiteColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: List.generate(name.length, (index) {
                    return Container(
                      height: AppScreenUtil().screenHeight(23),
                      width: AppScreenUtil().screenWidth(342),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(90),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      name[index],
                                      style: pangramRegular(
                                          size: 8.0, color: blackColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                                      orders[index],
                                      style: pangramRegular(
                                          size: 8.0, color: blackColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                                      amount[index],
                                      style: pangramRegular(
                                          size: 8.0, color: blackColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(30),
                ),

                ///FlowCharts
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       InkWell(child:  Container(
                         decoration: BoxDecoration(
                             color: whiteColor,
                             borderRadius: BorderRadius.circular(4),
                             border: Border.all(
                                 color: dashBoardPurchaseLeftColor,
                                 width: 1.3)),
                         height: AppScreenUtil().screenHeight(18.11),
                         width: AppScreenUtil().screenWidth(67.88),
                         child: Center(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SvgPicture.asset(
                                 ImageCons.imgDashboardPurchasePo,
                                 color: dashBoardPurchaseLeftColor,
                                 height: AppScreenUtil().screenHeight(8),
                                 width: AppScreenUtil().screenWidth(8),
                               ),
                               SizedBox(
                                 width: AppScreenUtil().screenWidth(2),
                               ),
                               Text(
                                 'Purchase W/PO',
                                 style: pangramMedium(
                                     size: 6.0,
                                     color: dashBoardPurchaseLeftColor),
                               )
                             ],
                           ),
                         ),
                       ),onTap: (){},),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                          height: AppScreenUtil().screenHeight(95),
                          width: AppScreenUtil().screenWidth(1.5),
                          decoration: BoxDecoration(
                            color: flowChartArrowColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: flowChartArrowColor,
                            size: 20,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8.5),
                          child: InkWell(child: Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: dashBoardPurchaseBottomColor,
                                    width: 1.3)),
                            height: AppScreenUtil().screenHeight(18.11),
                            width: AppScreenUtil().screenWidth(67.88),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageCons.imgDashboardPurchasePayment,
                                    color: dashBoardPurchaseBottomColor,
                                    height: AppScreenUtil().screenHeight(8),
                                    width: AppScreenUtil().screenWidth(8),
                                  ),
                                  SizedBox(
                                    width: AppScreenUtil().screenWidth(4),
                                  ),
                                  Text(
                                    'Payment',
                                    style: pangramMedium(
                                        size: 6.0,
                                        color: dashBoardPurchaseBottomColor),
                                  )
                                ],
                              ),
                            ),
                          ),onTap: (){},)
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.translate(
                              offset: Offset(8, 0),
                              child: Icon(
                                Icons.arrow_left_outlined,
                                color: flowChartArrowColor,
                                size: 20,
                              ),
                            ),
                            Container(
                              height: AppScreenUtil().screenHeight(1.5),
                              width: AppScreenUtil().screenWidth(150),
                              decoration: BoxDecoration(
                                color: flowChartArrowColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(-8, 0),
                              child: Icon(
                                Icons.arrow_right,
                                color: flowChartArrowColor,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                        Transform.translate(
                          offset: Offset(0, -9),
                          child: Container(
                            height: AppScreenUtil().screenHeight(42),
                            width: AppScreenUtil().screenWidth(1.5),
                            decoration: BoxDecoration(
                              color: flowChartArrowColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -9),
                          child: InkWell(child: Container(
                            height: AppScreenUtil().screenHeight(40.83),
                            width: AppScreenUtil().screenWidth(67.88),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    dashboardPurchase1GradientColor,
                                    dashboardPurchase2GradientColor
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                'PURCHASE',
                                style:
                                pangramMedium(size: 8.0, color: whiteColor),
                              ),
                            ),
                          ),onTap: (){},)
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(35),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.translate(
                                offset: Offset(8, 0),
                                child: Icon(
                                  Icons.arrow_left_outlined,
                                  color: flowChartArrowColor,
                                  size: 20,
                                ),
                              ),
                              Container(
                                height: AppScreenUtil().screenHeight(1.5),
                                width: AppScreenUtil().screenWidth(37),
                                decoration: BoxDecoration(
                                  color: flowChartArrowColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                              ),
                              SizedBox(
                                width: AppScreenUtil().screenWidth(5),
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: flowChartArrowColor,
                                          width: 1.3)),
                                  height: AppScreenUtil().screenHeight(18.11),
                                  width: AppScreenUtil().screenWidth(67.88),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          ImageCons.imgDashboardPurchaseBill,
                                          color: flowChartArrowColor,
                                          height: AppScreenUtil().screenHeight(8),
                                          width: AppScreenUtil().screenWidth(8),
                                        ),
                                        SizedBox(
                                          width: AppScreenUtil().screenWidth(2),
                                        ),
                                        Text(
                                          'Bill',
                                          style: pangramMedium(
                                              size: 6.0,
                                              color: flowChartArrowColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ),onTap: (){},
                              ),
                              SizedBox(
                                width: AppScreenUtil().screenWidth(5),
                              ),
                              Container(
                                height: AppScreenUtil().screenHeight(1.5),
                                width: AppScreenUtil().screenWidth(37),
                                decoration: BoxDecoration(
                                  color: flowChartArrowColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(-8, 0),
                                child: Icon(
                                  Icons.arrow_right,
                                  color: flowChartArrowColor,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: flowChartArrowColor, width: 1.3)),
                            height: AppScreenUtil().screenHeight(18.11),
                            width: AppScreenUtil().screenWidth(67.88),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageCons.imgDashboardPurchaseRfq,
                                    color: flowChartArrowColor,
                                    height: AppScreenUtil().screenHeight(8),
                                    width: AppScreenUtil().screenWidth(8),
                                  ),
                                  SizedBox(
                                    width: AppScreenUtil().screenWidth(2),
                                  ),
                                  Text(
                                    'RFQ',
                                    style: pangramMedium(
                                        size: 6.0, color: flowChartArrowColor),
                                  )
                                ],
                              ),
                            ),
                          ),onTap: (){},
             ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                          height: AppScreenUtil().screenHeight(29),
                          width: AppScreenUtil().screenWidth(1.5),
                          decoration: BoxDecoration(
                            color: flowChartArrowColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: flowChartArrowColor,
                            size: 20,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8.5),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: flowChartArrowColor, width: 1.3)),
                              height: AppScreenUtil().screenHeight(18.11),
                              width: AppScreenUtil().screenWidth(67.88),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ImageCons.imgDashboardPurchaseOrder,
                                      color: flowChartArrowColor,
                                      height: AppScreenUtil().screenHeight(8),
                                      width: AppScreenUtil().screenWidth(8),
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(4),
                                    ),
                                    Text(
                                      'Purchase Order',
                                      style: pangramMedium(
                                          size: 6.0, color: flowChartArrowColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: (){},
                          )
                        ),
                        Container(
                          height: AppScreenUtil().screenHeight(29),
                          width: AppScreenUtil().screenWidth(1.5),
                          decoration: BoxDecoration(
                            color: flowChartArrowColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: flowChartArrowColor,
                            size: 20,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8.5),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: flowChartArrowColor, width: 1.3)),
                              height: AppScreenUtil().screenHeight(18.11),
                              width: AppScreenUtil().screenWidth(67.88),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ImageCons.imgDashboardPurchaseGrn,
                                      color: flowChartArrowColor,
                                      height: AppScreenUtil().screenHeight(8),
                                      width: AppScreenUtil().screenWidth(8),
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(4),
                                    ),
                                    Text(
                                      'GRN',
                                      style: pangramMedium(
                                          size: 6.0, color: flowChartArrowColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: (){},
                          )
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(12),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: const [
                        BoxShadow(
                          color:
                          adminDashBoardDateDropDownContainerBoxShadowColor,
                          offset: Offset(0, 0),
                          blurRadius: 6,
                        ),
                      ],
                      color: whiteColor),
                  height: AppScreenUtil().screenHeight(5),
                  width: double.infinity,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(17),
                ),
                ///FlowCharts
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       InkWell(child:  Container(
                         decoration: BoxDecoration(
                             color: whiteColor,
                             borderRadius: BorderRadius.circular(4),
                             border: Border.all(
                                 color: dashBoardSalesLeftColor, width: 1.3)),
                         height: AppScreenUtil().screenHeight(18.11),
                         width: AppScreenUtil().screenWidth(67.88),
                         child: Center(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SvgPicture.asset(
                                 ImageCons.imgDashboardSalesPo,
                                 color: dashBoardSalesLeftColor,
                                 height: AppScreenUtil().screenHeight(8),
                                 width: AppScreenUtil().screenWidth(8),
                               ),
                               SizedBox(
                                 width: AppScreenUtil().screenWidth(2),
                               ),
                               Text(
                                 'Sales W/PO',
                                 style: pangramMedium(
                                     size: 6.0,
                                     color: dashBoardSalesLeftColor),
                               )
                             ],
                           ),
                         ),
                       ),onTap: (){},),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                          height: AppScreenUtil().screenHeight(95),
                          width: AppScreenUtil().screenWidth(1.5),
                          decoration: BoxDecoration(
                            color: flowChartBottomSalesArrowColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: flowChartBottomSalesArrowColor,
                            size: 20,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8.5),
                          child: InkWell(child: Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: flowChartBottomSalesColor
                                        .withOpacity(0.7),
                                    width: 1.3)),
                            height: AppScreenUtil().screenHeight(18.11),
                            width: AppScreenUtil().screenWidth(67.88),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageCons.imgDashboardSalesReceipt,
                                    color: flowChartBottomSalesColor
                                        .withOpacity(0.7),
                                    height: AppScreenUtil().screenHeight(8),
                                    width: AppScreenUtil().screenWidth(8),
                                  ),
                                  SizedBox(
                                    width: AppScreenUtil().screenWidth(4),
                                  ),
                                  Text(
                                    'Receipt',
                                    style: pangramMedium(
                                        size: 6.0,
                                        color: flowChartBottomSalesColor
                                            .withOpacity(0.7)),
                                  )
                                ],
                              ),
                            ),
                          ),onTap: (){},)
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.translate(
                              offset: Offset(8, 0),
                              child: Icon(
                                Icons.arrow_left_outlined,
                                color: flowChartBottomSalesArrowColor,
                                size: 20,
                              ),
                            ),
                            Container(
                              height: AppScreenUtil().screenHeight(1.5),
                              width: AppScreenUtil().screenWidth(150),
                              decoration: BoxDecoration(
                                color: flowChartBottomSalesArrowColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(-8, 0),
                              child: Icon(
                                Icons.arrow_right,
                                color: flowChartBottomSalesArrowColor,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                        Transform.translate(
                          offset: Offset(0, -9),
                          child: Container(
                            height: AppScreenUtil().screenHeight(42),
                            width: AppScreenUtil().screenWidth(1.5),
                            decoration: BoxDecoration(
                              color: flowChartBottomSalesArrowColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -9),
                          child: InkWell(child: Container(
                            height: AppScreenUtil().screenHeight(40.83),
                            width: AppScreenUtil().screenWidth(67.88),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    dashboardSales1GradientColor
                                        .withOpacity(0.85),
                                    dashboardSales2GradientColor
                                  ],
                                  stops: [0.5, 2.5],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                'SALES',
                                style:
                                pangramMedium(size: 8.0, color: whiteColor),
                              ),
                            ),
                          ),onTap: (){},)
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(35),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.translate(
                                offset: Offset(8, 0),
                                child: Icon(
                                  Icons.arrow_left_outlined,
                                  color: flowChartBottomSalesArrowColor,
                                  size: 20,
                                ),
                              ),
                              Container(
                                height: AppScreenUtil().screenHeight(1.5),
                                width: AppScreenUtil().screenWidth(37),
                                decoration: BoxDecoration(
                                  color: flowChartBottomSalesArrowColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                              ),
                              SizedBox(
                                width: AppScreenUtil().screenWidth(5),
                              ),
                              InkWell(child: Container(
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: flowChartBottomSalesArrowColor,
                                        width: 1.3)),
                                height: AppScreenUtil().screenHeight(18.11),
                                width: AppScreenUtil().screenWidth(67.88),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        ImageCons.imgDashboardSalesInvoice,
                                        color: flowChartBottomSalesArrowColor,
                                        height: AppScreenUtil().screenHeight(8),
                                        width: AppScreenUtil().screenWidth(8),
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(2),
                                      ),
                                      Text(
                                        'Invoice',
                                        style: pangramMedium(
                                            size: 6.0,
                                            color:
                                            flowChartBottomSalesArrowColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),onTap: (){},),
                              SizedBox(
                                width: AppScreenUtil().screenWidth(5),
                              ),
                              Container(
                                height: AppScreenUtil().screenHeight(1.5),
                                width: AppScreenUtil().screenWidth(37),
                                decoration: BoxDecoration(
                                  color: flowChartBottomSalesArrowColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(-8, 0),
                                child: Icon(
                                  Icons.arrow_right,
                                  color: flowChartBottomSalesArrowColor,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(child: Container(
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: flowChartBottomSalesArrowColor,
                                  width: 1.3)),
                          height: AppScreenUtil().screenHeight(18.11),
                          width: AppScreenUtil().screenWidth(67.88),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImageCons.imgDashboardSalesQuotation,
                                  color: flowChartBottomSalesArrowColor,
                                  height: AppScreenUtil().screenHeight(8),
                                  width: AppScreenUtil().screenWidth(8),
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(2),
                                ),
                                Text(
                                  'Quotation',
                                  style: pangramMedium(
                                      size: 6.0,
                                      color: flowChartBottomSalesArrowColor),
                                )
                              ],
                            ),
                          ),
                        ),onTap: (){},),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                          height: AppScreenUtil().screenHeight(29),
                          width: AppScreenUtil().screenWidth(1.5),
                          decoration: BoxDecoration(
                            color: flowChartBottomSalesArrowColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: flowChartBottomSalesArrowColor,
                            size: 20,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8.5),
                          child: InkWell(child: Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: flowChartBottomSalesArrowColor,
                                    width: 1.3)),
                            height: AppScreenUtil().screenHeight(18.11),
                            width: AppScreenUtil().screenWidth(67.88),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageCons.imgDashboardSalesOrder,
                                    color: flowChartBottomSalesArrowColor,
                                    height: AppScreenUtil().screenHeight(8),
                                    width: AppScreenUtil().screenWidth(8),
                                  ),
                                  SizedBox(
                                    width: AppScreenUtil().screenWidth(4),
                                  ),
                                  Text(
                                    'Sales Order',
                                    style: pangramMedium(
                                        size: 6.0,
                                        color: flowChartBottomSalesArrowColor),
                                  )
                                ],
                              ),
                            ),
                          ),onTap: (){},)
                        ),
                        Container(
                          height: AppScreenUtil().screenHeight(29),
                          width: AppScreenUtil().screenWidth(1.5),
                          decoration: BoxDecoration(
                            color: flowChartBottomSalesArrowColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: flowChartBottomSalesArrowColor,
                            size: 20,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -8.5),
                          child: InkWell(child: Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: flowChartBottomSalesArrowColor,
                                    width: 1.3)),
                            height: AppScreenUtil().screenHeight(18.11),
                            width: AppScreenUtil().screenWidth(67.88),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageCons.imgDashboardSalesDelivery,
                                    color: flowChartBottomSalesArrowColor,
                                    height: AppScreenUtil().screenHeight(8),
                                    width: AppScreenUtil().screenWidth(8),
                                  ),
                                  SizedBox(
                                    width: AppScreenUtil().screenWidth(4),
                                  ),
                                  Text(
                                    'Delivery',
                                    style: pangramMedium(
                                        size: 6.0,
                                        color: flowChartBottomSalesArrowColor),
                                  )
                                ],
                              ),
                            ),
                          ),onTap: (){},)
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(30),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Pro 1';
              break;
            case 2:
              text = 'Pro 2';
              break;
            case 3:
              text = 'Pro 3';
              break;
            case 4:
              text = 'Pro 4';
              break;
            case 5:
              text = 'Pro 5';
              break;
            case 6:
              text = 'Pro 6';
              break;
            case 7:
              text = 'Pro 7';
              break;
            case 8:
              text = 'Pro 8';
              break;
            case 9:
              text = 'Pro 9';
              break;
            case 10:
              text = 'Pro 10';
              break;
            case 11:
              text = 'Pro 11';
              break;
            case 12:
              text = 'Pro 12';
              break;
          }

          return Text(
            text,
            style: pangramRegular(size: 7.0, color: blackColor),
          );
        },
      );

  SideTitles get _leftTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = '0';
              break;
            case 2:
              text = '100';
              break;
            case 3:
              text = '200';
              break;
            case 4:
              text = '300';
              break;
            case 5:
              text = '400';
              break;
            case 6:
              text = '500';
              break;
            case 7:
              text = '600';
              break;
            case 8:
              text = '700';
              break;
            case 9:
              text = '800';
              break;
            case 10:
              text = '900';
              break;
            case 11:
              text = '1000';
              break;
            case 12:
              text = '1100';
              break;
            case 13:
              text = '1200';
              break;
          }

          return Text(
            text,
            style: pangramRegular(size: 7.0, color: blackColor),
          );
        },
      );
}

class AdminDashBoardGraph extends StatelessWidget {
  const AdminDashBoardGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 492.73,
      height: 220,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(
              border: const Border(
            bottom: BorderSide(color: overtimeNetPayColor, width: 0.3),
          )),
          gridData: FlGridData(
              horizontalInterval: 2,
              verticalInterval: 20,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: overtimeNetPayColor,
                  strokeWidth: 0.3,
                );
              }),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            leftTitles: AxisTitles(sideTitles: _leftTitles,),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          // minX: 0,
          // Set the starting x-value
          maxX: 13,
          minY: 0,
          maxY: 22,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 0),
                FlSpot(1.1, 4),
                FlSpot(1.5, 3),
                FlSpot(2, 6),
                FlSpot(3, 2),
                FlSpot(4, 12),
                FlSpot(5, 10),
                FlSpot(7, 20),
                FlSpot(9, 14),
                FlSpot(11, 22),
                FlSpot(12, 22),
              ],
              isCurved: false,
              color: dashboardGraphMainGreenColor,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                        radius: 3,
                        color:
                            dashboardGraphMainGreenColor // Set dot color here
                        ),
              ),
              belowBarData: BarAreaData(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      adminDashBoardLineGraphGradient1Color.withOpacity(0.45),
                      adminDashBoardLineGraphGradient2Color,
                      adminDashBoardLineGraphGradient3Color,
                      adminDashBoardLineGraphGradient4Color
                    ]),
                show: true,
                color: dashboardGraphMainGreenColor.withOpacity(0.18),
                // gradientColorStops: [0.2, 1.0],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Jan';
              break;
            case 2:
              text = 'Feb';
              break;
            case 3:
              text = 'Mar';
              break;
            case 4:
              text = 'Apr';
              break;
            case 5:
              text = 'May';
              break;
            case 6:
              text = 'Jun';
              break;
            case 7:
              text = 'Jul';
              break;
            case 8:
              text = 'Aug';
              break;
            case 9:
              text = 'Sep';
              break;
            case 10:
              text = 'Oct';
              break;
            case 11:
              text = 'Nov';
              break;
            case 12:
              text = 'Dec';
              break;
          }

          return Text(
            text,
            style: pangramRegular(size: 7.0, color: blackColor),
          );
        },
      );

  SideTitles get _leftTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = '0M';
              break;
            case 2:
              text = '2M';
              break;
            case 3:
              text = '4M';
              break;
            case 4:
              text = '6M';
              break;
            case 5:
              text = '8M';
              break;
            case 6:
              text = '10M';
              break;
            case 7:
              text = '12M';
              break;
            case 8:
              text = '14M';
              break;
            case 9:
              text = '16M';
              break;
            case 10:
              text = '18M';
              break;
            case 11:
              text = '20M';
              break;
            case 12:
              text = '22M';
              break;
            case 13:
              text = '24M';
              break;
          }

          return Text(
            text,
            style: pangramRegular(size: 7.0, color: blackColor),
          );
        },
      );
}
