
// ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class CompanySettingsTable extends StatelessWidget {
  final dynamic tableHeight;
  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;

  final bool? scrollIndicatorVisibility;
  CompanySettingsTable(
      {super.key,
         this.tableHeight,
        this.scrollIndicatorVisibility = true,
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
          height: tableHeight,
          color: Colors.transparent,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                Column(
                  children: [
                    ///Table heading
                    Padding(
                      padding:
                      EdgeInsets.only(bottom: AppScreenUtil().screenWidth(1.5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(tableRowWidth),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: constantWhite,boxShadow: const [
                          BoxShadow(
                            color: searchTextColor,
                            offset: Offset(0, 0),
                            blurRadius: 1.8
                          ),
                        ],
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



              ],
            ),
          ),
        ),


      ],
    );
  }
}
