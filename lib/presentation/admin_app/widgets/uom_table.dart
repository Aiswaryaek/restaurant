
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class UOMProductTable extends StatelessWidget {
  final ScrollController scrollController;
  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;
  final ScrollPhysics? tableScrollPhysics;
  bool visible;
  final double slidingIndicatorPosition;
   UOMProductTable(
      {super.key,
        required this.scrollController,
        required this.tableDataWidgets,
        required this.tableRowWidth,
        required this.titleWidgets,
        this.tableScrollPhysics,
        required this.visible,
        required this.slidingIndicatorPosition,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          child:Column(
            children: [
              SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child:  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///Table heading
                        Container(
                          height: AppScreenUtil().screenHeight(30),
                          width: AppScreenUtil().screenWidth(tableRowWidth),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color:   adminDashBoardTableAlternateColor.withOpacity(0.05),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(18)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: titleWidgets,
                            ),
                          ),
                        ),

                        Column(
                            children: tableDataWidgets
                        ),
                      ],
                    ),
                  )
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
                      color: adminDashBoardSlidingIndicatorColor.withOpacity(0.7)),
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
                      color: adminDashBoardSlidingIndicatorColor.withOpacity(0.7)),
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
