

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class BranchSettingsTableLayout extends StatelessWidget {

  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;

 const BranchSettingsTableLayout(
      {super.key,

        required this.tableDataWidgets,
      required this.tableRowWidth,
      required this.titleWidgets});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: AppScreenUtil().screenWidth(2)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(28),
                      width: AppScreenUtil().screenWidth(tableRowWidth),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: constantWhite,
                      ),
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
              
          
           
            ],
          ),
        ),
      
            
      ],
    );
  }
}
