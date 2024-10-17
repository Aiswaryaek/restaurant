// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/shift_transfer_dialogue_table.dart';

import '../../../styles/colors.dart';
import '../../../styles/textstyles.dart';
import '../../../utiles/app_screen_util.dart';
import 'outlined_table.dart';

class HorizontalListViewDialog extends StatefulWidget {
  const HorizontalListViewDialog({super.key});

  @override
  State<HorizontalListViewDialog> createState() =>
      _HorizontalListViewDialogState();
}

class _HorizontalListViewDialogState extends State<HorizontalListViewDialog> {
  ScrollController dialogueController = ScrollController();
  List<String> shiftNo = [
    'SH0001',
    'SH0001',
    'SH0001',
  ];
  List<String> shiftStartDate = [
    '11-03-2022',
    '11-03-2022',
    '11-03-2022',
  ];
  List<String> shiftStartTime = [
    '05:39 PM',
    '05:39 PM',
    '05:39 PM',
  ];
  List<String> shiftEndDate = [
    '12-03-2022',
    '12-03-2022',
    '12-03-2022',
  ];

  List<String> shiftEndTime = [
    '05:39 AM',
    '05:39 AM',
    '05:39 AM',
  ];



  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0), // Set border radius here
      ),
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(  borderRadius: BorderRadius.circular(7.0),color: constantWhite,),
        // height: AppScreenUtil().screenHeight(191),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShiftTransferDialogueTable( visible: false,
                scrollController: dialogueController,
                tableHeight: 170,
                tableDataWidgets: List.generate(shiftNo.length, (index) {
                  return InkWell(
                    child: Container(
                      height: AppScreenUtil().screenHeight(38),
                      width: AppScreenUtil().screenWidth(500),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: searchTextColor.withOpacity(0.15)),
                          color: Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(18)),

                        ///scrolling row
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(70),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      shiftNo[index],
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(90),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(shiftStartDate[index],
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(shiftStartTime[index],
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(shiftEndDate[index],
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(shiftEndTime[index],
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                    },
                  );
                }),
                tableRowWidth: 500,
                titleWidgets: [
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Shift No.',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Shift Start Date',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(95),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Shift Start Time',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(95),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Shift End Date',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(95),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Shift End Time',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                ]),
            SizedBox(height: AppScreenUtil().screenHeight(8),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 83,
                    height: 24,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: blackColor)),
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Cancel',
                          style: categoryMenuTextStyle, textAlign: TextAlign.center),
                    )),
                SizedBox(width: AppScreenUtil().screenWidth(8),),
                Container(
                    width: 83,
                    height: 24,
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: blackColor)),
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Submit',
                          style: confirmTextStyle, textAlign: TextAlign.center),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
