// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/models/subcategories_model.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';
import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../widgets/dash_board_item_layout.dart';
import '../../../../widgets/dash_board_order_container.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final options = <Subcategories>[];
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    options.add(Subcategories(('  All  ')));
    options.add(Subcategories(('Processing')));
    options.add(Subcategories(('Preparing')));
    options.add(Subcategories((' Ready ')));
    options.add(Subcategories(('Completed')));
    options.add(Subcategories((' Paid ')));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: backGroundColor,
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(AppScreenUtil().screenWidth(25)),
                        topRight:
                            Radius.circular(AppScreenUtil().screenWidth(25))),
                    color: Colors.white),
                child:  SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    SizedBox(height: AppScreenUtil().screenHeight(25),),

                    ///Dashboard label
                    Text(
                      'Dashboard',
                      style: dashBoardBlackLabelTextStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(12),
                    ),

                    ///Top row
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(13)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DashBoardOrderContainer(
                              containerColor: dashBoardTotalSalesContainerColor,
                              iconColor: dashBoardTotalSalesIconColor,
                              iconPath: ImageCons.adminDashBoardTotalItem,
                              titleText: 'Today total sales'),
                          DashBoardOrderContainer(
                              containerColor:
                              dashBoardTotalOrdersContainerColor,
                              iconColor: dashBoardTotalOrdersIconColor,
                              iconPath: ImageCons.totalOrders,
                              titleText: 'Total Orders'),
                          DashBoardOrderContainer(
                              containerColor:
                              dashBoardTotalCancelContainerColor,
                              iconColor: dashBoardTotalCancelIconColor,
                              iconPath: ImageCons.totalCancel,
                              titleText: 'Total Cancel'),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: AppScreenUtil().screenHeight(
                          7,
                        )),

                    ///Bottom row
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(13)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DashBoardOrderContainer(
                              containerColor:
                              dashBoardTotalRefundContainerColor,
                              iconColor: dashBoardTotalRefundIconColor,
                              iconPath: ImageCons.totalRefund,
                              titleText: 'Total Refund'),
                          DashBoardOrderContainer(
                              containerColor: dashBoardTotalTipsContainerColor,
                              iconColor: dashBoardTotalTipsIconColor,
                              iconPath: ImageCons.totalTips,
                              titleText: 'Total Tips'),

                          ///This container is used only for spacing
                          Container(
                            height: AppScreenUtil().screenHeight(45),
                            width: AppScreenUtil().screenWidth(105),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        height: AppScreenUtil().screenHeight(
                          25,
                        )),

                    ///Latest 5 orders label text
                    Text(
                      'Latest 5 orders',
                      style: dashBoardBlackLabelTextStyle,
                    ),

                    SizedBox(
                        height: AppScreenUtil().screenHeight(
                          20,
                        )),

                    ///Dashboard tabs
                    Container(
                      padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(14)),
                      color: Colors.transparent,
                      height: 23,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: options.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            setState(() {
                              currentTabIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(9, 0, 9, 2),
                              decoration: BoxDecoration(
                                color: (currentTabIndex == index)
                                    ? dashBoardTabSelectedColor
                                    : subcategoriesColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  options[index].text!,
                                  style: (currentTabIndex == index)
                                      ? placeOrderingAndConfirmPaymentButtonLabelStyle
                                      : dashBoardTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox();
                        },
                      ),
                    ),

                    SizedBox(
                        height: AppScreenUtil().screenHeight(
                          20,
                        )),

                    /// Item layout
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Column(
                          children: [DashBoardItemLayout()],
                        )),

                    ///Sales overview label
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    Text(
                      'Sales Overview',
                      style: dashBoardBlackLabelTextStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(16),
                    ),

                    ///Sales overview chart
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(16)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(250),
                        color: Colors.transparent,
                        child: LineChart(
                          LineChartData(
                            minX: 1,
                            maxX: 12,
                            minY: 0,
                            maxY: 2000,
                            titlesData: FlTitlesData(
                              show: true,
                              // leftTitles: SideTitles(
                              //   showTitles: true,
                              //   getTextStyles: (value, _) =>
                              //   const TextStyle(fontSize: 6),
                              //   getTitles: (value) {
                              //     return value.toString();
                              //   },
                              // ),
                              // bottomTitles: SideTitles(
                              //   getTextStyles: (value, _) =>
                              //   const TextStyle(fontSize: 8),
                              //   showTitles: true,
                              //   getTitles: (value) {
                              //     switch (value.toInt()) {
                              //       case 1:
                              //         return 'Jan';
                              //       case 2:
                              //         return 'Feb';
                              //       case 3:
                              //         return 'Mar';
                              //       case 4:
                              //         return 'Apr';
                              //       case 5:
                              //         return 'May';
                              //       case 6:
                              //         return 'Jun';
                              //       case 7:
                              //         return 'Jul';
                              //       case 8:
                              //         return 'Aug';
                              //       case 9:
                              //         return 'Sep';
                              //       case 10:
                              //         return 'Oct';
                              //       case 11:
                              //         return 'Nov';
                              //       case 12:
                              //         return 'Dec';
                              //       default:
                              //         return '';
                              //     }
                              //   },
                              // ),
                              // topTitles: SideTitles(
                              //   showTitles: false,
                              // ),
                              // rightTitles: SideTitles(
                              //   showTitles: false,
                              // ),
                            ),
                            borderData: FlBorderData(
                              show: true,
                              border: Border(
                                left: BorderSide(
                                    color: dashBoardGraphBorderColor, width: 1),
                                bottom: BorderSide(
                                    color: dashBoardGraphBorderColor, width: 1),
                                top: BorderSide.none, // No top border
                                right: BorderSide.none, // No right border
                              ),
                            ),
                            gridData: FlGridData(
                              show: true,
                              drawVerticalLine: true,
                              drawHorizontalLine: true,
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(1, 500),
                                  FlSpot(2, 1200),
                                  FlSpot(3, 800),
                                  FlSpot(4, 1700),
                                  FlSpot(5, 300),
                                  FlSpot(6, 1500),
                                  FlSpot(7, 900),
                                  FlSpot(8, 1900),
                                  FlSpot(9, 1100),
                                  FlSpot(10, 600),
                                  FlSpot(11, 1300),
                                  FlSpot(12, 1800),
                                  // Add more spots based on your data
                                ],
                                isCurved: false,
                                color: dashBoardGraphLineColor,
                                barWidth: 1,
                                belowBarData: BarAreaData(show: false),
                                dotData: FlDotData(
                                  show: true,
                                  getDotPainter:
                                      (spot, percent, barData, index) =>
                                      FlDotCirclePainter(
                                        radius: 2,
                                        color:
                                        dashBoardGraphDotColor, 
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            )));
  }
}
