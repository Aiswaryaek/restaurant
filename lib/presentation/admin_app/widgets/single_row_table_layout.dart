import 'package:flutter/material.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class SingleRowTableLayout extends StatelessWidget {
  final Color tableColor;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final String title;
  final String value;

  const SingleRowTableLayout({super.key,this.borderRadius,this.border,required this.tableColor,required this.title,required this.value});
  @override
  Widget build(BuildContext context) {
    return     Container(
                height: AppScreenUtil().screenHeight(23),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: tableColor,
                    border: border),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style:profitAndLossTableLabelStyle,
                      ),
                      Text(
                       value,
                        style:profitAndLossTableLabelStyle,
                      )
                    ],
                  ),
                ),
              );
  }
}