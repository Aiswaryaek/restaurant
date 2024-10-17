
import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class POSTable extends StatelessWidget {
  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;

  POSTable(
      {super.key,
        required this.tableDataWidgets,
        required this.tableRowWidth,
        required this.titleWidgets});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///Table heading
                Container(
                  height: AppScreenUtil().screenHeight(35),
                  width: AppScreenUtil().screenWidth(tableRowWidth),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft:
                        Radius.circular(AppScreenUtil().screenWidth(6)),
                        topRight:
                        Radius.circular(AppScreenUtil().screenWidth(6))),
                    color: inventorySelectionColor.withOpacity(0.4),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(20)),
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
          ),
        ],
      ),
    );
  }
}
