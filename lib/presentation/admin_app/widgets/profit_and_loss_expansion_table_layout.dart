import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class ProfitAndLossExpansionTableLayout extends StatefulWidget {
  final dynamic tableOnTap;
  final double tableHeight;
  final String dataTitle;
  final String valueTitle;
  final Color? tableColor;
  final double opacity;
  final List<String> dataList;
  final List<String> valueList;
  final BorderRadiusGeometry? borderRadius;

  const ProfitAndLossExpansionTableLayout(
      {super.key,
      required this.dataList,
      required this.dataTitle,
      required this.opacity,
      required this.tableHeight,
      required this.tableOnTap,
      required this.valueList,
      this.tableColor,
      required this.valueTitle,
      this.borderRadius});

  @override
  State<ProfitAndLossExpansionTableLayout> createState() =>
      _ProfitAndLossExpansionTableLayoutState();
}

class _ProfitAndLossExpansionTableLayoutState
    extends State<ProfitAndLossExpansionTableLayout> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tableOnTap,

      ///Main container
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        decoration: BoxDecoration(
            borderRadius: widget.borderRadius, color:widget.tableColor?? Colors.transparent),
        height: widget.tableHeight,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ///Title container
              Container(
                height: AppScreenUtil().screenHeight(23),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: widget.borderRadius,
                    color: profitAndLossTableColor,
                    border: const Border(
                        bottom: BorderSide(color: whiteColor, width: 0.5))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.dataTitle,
                        style: profitAndLossTableSubLabelStyle(
                            labelColor: whiteColor),
                      ),
                      Text(
                        widget.valueTitle,
                        style: profitAndLossTableSubLabelStyle(
                            labelColor: whiteColor),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppScreenUtil().screenWidth(14)),
                child: AnimatedOpacity(
                  opacity: widget.opacity,
                  duration: const Duration(milliseconds: 1000),
                  child: Column(
                    children: List.generate(
                        widget.dataList.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(
                                  top: AppScreenUtil().screenHeight(6)),
                              child: Container(
                                height: AppScreenUtil().screenHeight(17.5),
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: whiteColor,
                                    border: Border(
                                        bottom: BorderSide(
                                            color: profitAndLossTableColor,
                                            width: 0.5))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppScreenUtil().screenWidth(11)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.dataList[index],
                                        style: profitAndLossTableSubLabelStyle(
                                            labelColor: blackColor),
                                      ),
                                      Text(
                                        widget.valueList[index],
                                        style: profitAndLossTableSubLabelStyle(
                                            labelColor: blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
