// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/product_table.dart';

class UOMList extends StatefulWidget {
  const UOMList({super.key});

  @override
  State<UOMList> createState() => _UOMListState();
}

class _UOMListState extends State<UOMList> {
  ScrollController uomTableController = ScrollController();
  double uomIndicatorPosition = 0.0;

  List<String> uomCategory = [
    'Service',
    'Working Time',
    'Volume',
    'Surface',
    'Service',
    'Working Time',
    'Volume',
    'Surface',
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    uomTableController.addListener(() {
      setState(() {
        uomIndicatorPosition = (uomTableController.offset /
                uomTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    uomTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: DefaultProductTable(
                visible: false,
                scrollController: uomTableController,
                slidingIndicatorPosition: uomIndicatorPosition,
                tableDataWidgets: List.generate(uomCategory.length, (index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(330),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: tableDataAlternateColor[
                              index % tableDataAlternateColor.length],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(5)),

                          ///scrolling row
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                    padding: EdgeInsets.only(left: 20),
                                    color: Colors.transparent,
                                    // width: AppScreenUtil().screenWidth(90),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          uomCategory[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.only(top: 10.5, bottom: 10.5),
                                  color: Colors.transparent,
                                  // width: AppScreenUtil().screenWidth(130),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 1),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: whiteColor,
                                                border: Border.all(
                                                    color: blackColor)),
                                            child: Center(
                                              child: Text(
                                                'Service Unit',
                                                overflow: TextOverflow.ellipsis,
                                                style: uomTextStyle,
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(3),
                                      ),
                                      Expanded(
                                        child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 1),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: whiteColor,
                                                border: Border.all(
                                                    color: blackColor)),
                                            child: Center(
                                              child: Text(
                                                'Activity',
                                                overflow: TextOverflow.ellipsis,
                                                style: uomTextStyle,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                }),
                tableRowWidth: 330,
                titleWidgets: [
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(90),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'UOM Category',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(130),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'UOM',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                ]),
          ),
        )
      ],
    );
  }
}
