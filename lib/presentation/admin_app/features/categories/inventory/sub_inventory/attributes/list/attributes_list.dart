// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/product_table.dart';

class AttributesList extends StatefulWidget {
  const AttributesList({super.key});

  @override
  State<AttributesList> createState() => _AttributesListState();
}

class _AttributesListState extends State<AttributesList> {
  ScrollController attributesTableController = ScrollController();
  double attributesIndicatorPosition = 0.0;

  List<String> name = [
    'Size',
    'Size',
    'Size',
    'Size',
    'Size',
    'Size',
    'Size',
    'Size',
    'Size',
    'Size',
    'Size'
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    attributesTableController.addListener(() {
      setState(() {
        attributesIndicatorPosition = (attributesTableController.offset /
                attributesTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    attributesTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: DefaultProductTable( visible: false,
                scrollController: attributesTableController,
                slidingIndicatorPosition: attributesIndicatorPosition,
                tableDataWidgets: List.generate(name.length, (index) {
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
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        name[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )),
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(130),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: whiteColor,
                                          border:
                                              Border.all(color: blackColor)),
                                      child: Text(
                                        'S',
                                        style: largeTextStyle,
                                      ),
                                    ),
                                    SizedBox(width: AppScreenUtil().screenWidth(3),),
                                    Container(
                                      padding:
                                      EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: whiteColor,
                                          border:
                                          Border.all(color: blackColor)),
                                      child: Text(
                                        'M',
                                        style: largeTextStyle,
                                      ),
                                    ),
                                    SizedBox(width: AppScreenUtil().screenWidth(3),),
                                    Container(
                                      padding:
                                      EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: whiteColor,
                                          border:
                                          Border.all(color: blackColor)),
                                      child: Text(
                                        'L',
                                        style: largeTextStyle,
                                      ),
                                    ),
                                    SizedBox(width: AppScreenUtil().screenWidth(3),),
                                    Container(
                                      padding:
                                      EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: whiteColor,
                                          border:
                                          Border.all(color: blackColor)),
                                      child: Text(
                                        'XL',
                                        style: largeTextStyle,
                                      ),
                                    )
                                  ],
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
                          'Attribute Name',
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
                            'Value',
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
