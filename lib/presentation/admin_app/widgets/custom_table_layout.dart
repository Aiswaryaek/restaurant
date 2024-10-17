
import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class CustomTableLayout extends StatelessWidget {
  final ScrollController scrollController;
  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;
  final Color tableTitleColor;
 
  final double slidingIndicatorPosition;
  final bool scrollIndicatorVisibility;
  final ScrollPhysics horizontalScrollPhysics;
  CustomTableLayout(
      {super.key,
      required this.scrollController,
    required this.tableTitleColor,
    this.scrollIndicatorVisibility = true,
    this.horizontalScrollPhysics = const AlwaysScrollableScrollPhysics(),
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
    return Padding(
      padding:  EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
               
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  physics:horizontalScrollPhysics ,
                  child: Padding(
                    padding:  EdgeInsets.only(right: AppScreenUtil().screenWidth(16)),
                    child: Column(
                      children: [
                        ///Table heading
                        Container(
                          height: AppScreenUtil().screenHeight(23),
                          width: AppScreenUtil().screenWidth(tableRowWidth),
                          decoration: BoxDecoration(
                            borderRadius:const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                            color: tableTitleColor,
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
                  ),
                ),
                
            
             
              ],
            ),
          ),
          SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
              
                  ///Scrolling indicator
              
                  Visibility(
                    visible: scrollIndicatorVisibility,
                    child: Container(
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
                               const   BoxDecoration(color: salesReportTableColor),
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
                  ),
              
        ],
      ),
    );
  }
}
