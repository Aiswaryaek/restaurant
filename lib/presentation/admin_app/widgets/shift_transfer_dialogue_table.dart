// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class ShiftTransferDialogueTable extends StatelessWidget {
  final double tableHeight;
  final ScrollController scrollController;
  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;
  bool visible;
  final double? slidingIndicatorPosition;

  ShiftTransferDialogueTable(
      {super.key,
        required this.scrollController,
        required this.tableHeight,
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
        SingleChildScrollView(
          physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: scrollController,
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
                    borderRadius: BorderRadius.circular(7),
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
            )
        ),
      ],
    );
  }
}
