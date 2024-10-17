
import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class EditableTable extends StatelessWidget {
  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;

  EditableTable(
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
            child:  Padding(
              padding: EdgeInsets.only(right: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///Table heading
                  Container(
                    height: AppScreenUtil().screenHeight(25),
                    width: AppScreenUtil().screenWidth(tableRowWidth),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft:
                          Radius.circular(AppScreenUtil().screenWidth(6)),
                          topRight:
                          Radius.circular(AppScreenUtil().screenWidth(6))),
                      color: confirmColor,
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
    );
  }
}
