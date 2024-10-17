import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../user_app/widgets/custom_button.dart';

class AdminDashBoardTableLayout extends StatelessWidget {
  final ScrollController scrollController;
  final num tableRowWidth;
  final String heading;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;
 
  final double slidingIndicatorPosition;
  AdminDashBoardTableLayout(
      {super.key,
      required this.heading,
      required this.scrollController,
    
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
        Padding(
          padding: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(15),
              right: AppScreenUtil().screenWidth(15),
              top: AppScreenUtil().screenHeight(15),
              bottom: AppScreenUtil().screenHeight(5)),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                heading,
                style: tableHeadingLabelStyle,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(15)),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.only(right: AppScreenUtil().screenWidth(15)),
              child: Column(
                children: [
                  ///Table heading
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(tableRowWidth),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: constantWhite,
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
                  ),

                  Column(
                    children: tableDataWidgets
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),

        ///Scrolling indicator

        Container(
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
                  decoration:
                      BoxDecoration(color: adminDashBoardSlidingIndicatorColor),
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
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(9),
        ),

        ///View more button
        Padding(
          padding: EdgeInsets.only(right: AppScreenUtil().screenWidth(15)),
          child: Align(
            alignment: Alignment.topRight,
            child: CustomButton(
              buttonHeight: AppScreenUtil().screenHeight(14),
              buttonWidth: AppScreenUtil().screenWidth(54),
              buttonColor: adminDashBoardTableAlternateColor,
              borderRadius: 7,
              buttonText: 'View More',
              buttonLabelStyle: adminDashBoardViewMoreButtonLabelStyle,
            ),
          ),
        ),
      ],
    );
  }
}
