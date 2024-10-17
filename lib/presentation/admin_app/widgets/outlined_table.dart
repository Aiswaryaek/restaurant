// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class OutLinedTable extends StatelessWidget {
  final double? tableHeight;
  final ScrollController scrollController;
  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;
  bool visible;
  final double? slidingIndicatorPosition;

  OutLinedTable(
      {super.key,
      required this.scrollController,
       this.tableHeight,
      required this.visible,
      this.slidingIndicatorPosition,
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
          height: tableHeight,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///Table heading
                        Container(
                          height: AppScreenUtil().screenHeight(38),
                          width: AppScreenUtil().screenWidth(tableRowWidth),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: searchTextColor,
                                  offset: Offset(0.15, 0.15),
                                  blurRadius: 1.2),
                            ],border: Border.all(
                              color: searchTextColor.withOpacity(0.15)),
                            borderRadius: BorderRadius.circular(8),
                            color: constantWhite,
                          ),
                          child: Padding(
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

                        Column(children: tableDataWidgets),
                      ],
                    ),
                  )
                ),
              ],
            ),
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
