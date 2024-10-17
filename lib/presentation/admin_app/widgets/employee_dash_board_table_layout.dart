// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class EmployeeDashBoardTableLayout extends StatelessWidget {
  final ScrollController scrollController;
  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;
  final ScrollPhysics? tableScrollPhysics;
  
  bool visible;
  final double slidingIndicatorPosition;

  EmployeeDashBoardTableLayout(
      {super.key,
      required this.scrollController,
      this.tableScrollPhysics,
   
      required this.visible,
      required this.slidingIndicatorPosition,
      required this.tableDataWidgets,
      required this.tableRowWidth,
      required this.titleWidgets});

  List<Color> tableDataAlternateColor = [
    constantWhite,
    adminDashBoardTableAlternateColor.withOpacity(0.05),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          child: Column(
            children: [
              SingleChildScrollView(
                physics:tableScrollPhysics?? ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                child: Padding(
                  padding:  EdgeInsets.only(right: AppScreenUtil().screenWidth(16)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ///Table heading
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenWidth(5)),
                        child: Container(
                          height: AppScreenUtil().screenHeight(20),
                          width: AppScreenUtil().screenWidth(tableRowWidth),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: constantWhite,
                          ),
                          child:
                           Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(18),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: titleWidgets,
                            ),
                          ),
                        ),
                      ),
          
                      Column(children: tableDataWidgets),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),

        ///Scrolling indicator

        visible == true
            ? Container(
                width: AppScreenUtil().screenWidth(150),
                height: AppScreenUtil().screenHeight(5),
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Center(
                      ///Line container
                      child: Container(
                        width: AppScreenUtil().screenWidth(150),
                        height: AppScreenUtil().screenHeight(0.5),
                        decoration: BoxDecoration(
                            color: adminDashBoardSlidingIndicatorColor),
                      ),
                    ),

                    ///Sliding container
                    Positioned(
                      left: slidingIndicatorPosition,
                      child: Container(
                        width: AppScreenUtil().screenWidth(40),
                        height: AppScreenUtil().screenHeight(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: adminDashBoardSlidingIndicatorColor),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
