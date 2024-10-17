
import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class InventoryTableLayoutWithoutScroll extends StatelessWidget {
  final dynamic tableHeight;
  final ScrollController? scrollController;
  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;
 
  final double? slidingIndicatorPosition;
  final bool? scrollIndicatorVisibility;
  InventoryTableLayoutWithoutScroll(
      {super.key,
       this.scrollController,
     this.tableHeight,
    this.scrollIndicatorVisibility = true,
       this.slidingIndicatorPosition,
        required this.tableDataWidgets,
      required this.tableRowWidth,
      required this.titleWidgets});

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
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: AppScreenUtil().screenWidth(2)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(33),
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
                
            
             
              ],
            ),
          ),
        ),
      
            
      ],
    );
  }
}
