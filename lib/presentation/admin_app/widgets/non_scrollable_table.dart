import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class TaxTableLayout extends StatelessWidget {
  final dynamic tableHeight;
  final num tableRowWidth;
  final List<Widget> titleWidgets;
  final List<Widget> tableDataWidgets;

  TaxTableLayout(
      {super.key,
      required this.tableHeight,
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
      padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(20)),
      child: Column(
        children: [
          Container(
            height: tableHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow:const [BoxShadow(
                blurRadius: 3,
                offset: Offset(0, 0),
                color: taxScreenTableBoxShadowColor
              )],
              color: Colors.transparent,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
               physics:const ClampingScrollPhysics(), 
              child: Stack(
                children: [
                  Column(
                    children: [
                    
              SizedBox(height: AppScreenUtil().screenHeight(34),),
                      Column(children: tableDataWidgets),
                    ],
                  ),
                  ///Table Heading
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          height: AppScreenUtil().screenHeight(36),
                          width: AppScreenUtil().screenWidth(tableRowWidth),
                          
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: constantWhite,
                              boxShadow: const [
                                BoxShadow(
                                    color: taxScreenTableBoxShadowColor,
                                    offset: Offset(0, 0),
                                    blurRadius: 5)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: titleWidgets,
                            ),
                          ),
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
