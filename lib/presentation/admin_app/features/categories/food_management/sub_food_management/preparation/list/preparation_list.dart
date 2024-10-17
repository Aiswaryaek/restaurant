// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class PreparationList extends StatefulWidget {
  const PreparationList({super.key});

  @override
  State<PreparationList> createState() => _PreparationListState();
}

class _PreparationListState extends State<PreparationList> {
  ScrollController preparationListTableController = ScrollController();
  List<String> name = [
    'MO0000006',
    'MO0000006',
  ];
  List<String> product = [
    'Product 181',
    'Product 181',
  ];
  List<String> qty = [
    '10',
    '10',
  ];
  List<String> billOfMaterial = [
    'BOM0000001',
    'BOM0000001',
  ];
  List<String> status = [
    'Draft',
    'Draft',
  ];

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(padding: EdgeInsets.only(left: 16,right: 16),child: Container(
            height: AppScreenUtil().screenHeight(36),
            width: AppScreenUtil().screenWidth(491),
            padding: EdgeInsets.fromLTRB(13, 5, 10, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: shiftContainerColor.withOpacity(0.7),
            ),
            child: Center(
              child: Align(alignment: Alignment.centerLeft,
                child: Text('Preparation',style: pangramMedium(size: 14.0,color: blackColor),),),
            )
        ),),
        Padding(padding: EdgeInsets.only(left: 16,bottom: 30),child: SingleChildScrollView(
          physics:ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: preparationListTableController,
          child: Padding(
            padding:  EdgeInsets.only(right: AppScreenUtil().screenWidth(16)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///Table heading
                Container(
                  height: AppScreenUtil().screenHeight(36),
                  width: AppScreenUtil().screenWidth(491),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: shiftTableFirstColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(18),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Center(
                                child: Text(
                                  'Name',
                                  style: dottedTextFieldInputTextStyle,
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(90),
                              child: Center(
                                child: Text(
                                  'Product',
                                  style: dottedTextFieldInputTextStyle,
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(90),
                              child: Center(
                                child:  Text(
                                  'Qty',
                                  style: dottedTextFieldInputTextStyle,
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(90),
                              child: Center(
                                child: Text(
                                  'Bill Of Material',
                                  style: dottedTextFieldInputTextStyle,
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(90),
                              child: Center(
                                child: Text(
                                  'Status',
                                  style: dottedTextFieldInputTextStyle,
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ///Table Contents
                Column(children: List.generate(name.length, (index) {
                  return InkWell(
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(491),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: shiftContainerColor.withOpacity(0.7),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(18)),

                        ///scrolling row
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      name[index],
                                      style: pangramMedium(size: 9.0, color: blackColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(product[index],
                                        style: pangramMedium(size: 9.0, color: blackColor),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(
                                      qty[index],
                                      style: pangramMedium(size: 9.0, color: blackColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(billOfMaterial[index],
                                        style: pangramMedium(size: 9.0, color: blackColor),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(90),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(bottom: 2),
                                        width: AppScreenUtil().screenWidth(37),
                                        height:
                                        AppScreenUtil().screenHeight(14.5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(1),
                                          color: preparationDraftButtonColor.withOpacity(0.8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            status[index],
                                            style:
                                            inventoryCreateButtonLabelStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ))
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                })),
              ],
            ),
          ),
        ),)
      ],
    );
  }
}
