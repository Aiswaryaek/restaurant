
import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class InventoryTableLayout extends StatelessWidget {
  final ScrollController scrollController;
  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;
 final double tableHeadingRowHeight;
  final double slidingIndicatorPosition;
  final bool scrollIndicatorVisibility;
  final ScrollPhysics horizontalScrollPhysics;
  InventoryTableLayout(
      {super.key,
      required this.scrollController,
    this.scrollIndicatorVisibility = true,
    this.tableHeadingRowHeight = 36,
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
      padding:  EdgeInsets.only(bottom: AppScreenUtil().screenHeight(20)),
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
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                          child: Container(
                            height: AppScreenUtil().screenHeight(tableHeadingRowHeight),
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
                  ),
              
        ],
      ),
    );
  }
}
