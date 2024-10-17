// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../../../../../../../../../styles/colors.dart';
import '../../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/dotted_line.dart';

class PosSpecialItemsList extends StatefulWidget {
  const PosSpecialItemsList({super.key});

  @override
  State<PosSpecialItemsList> createState() => _PosSpecialItemsListState();
}

class _PosSpecialItemsListState extends State<PosSpecialItemsList> {
  final List<String> categoryItems = [
    'Bonus',
    'Lorem',
  ];
  List<bool> status = [
    true,
    false,
    true,
  ];
  List<Color> tableDataAlternateColor = [
    confirmColor,
    employeeDashBoardAttendanceLabelColor,
    specialItemsLeftMenuColor,
  ];
  List<Color> tableDataColor = [
    posSpecialItems1Color,
    posSpecialItems2Color,
    posSpecialItem3Color,
  ];
  List<bool> isTappedList = List.generate(3, (index) => true);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30, bottom: 30, right: 30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (index) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      isTappedList[index] = !isTappedList[index];
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      height:  isTappedList[index]
                          ? AppScreenUtil().screenHeight(50)
                          : AppScreenUtil().screenHeight(190),
                      padding: EdgeInsets.only(left: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: tableDataAlternateColor[
                            index % tableDataAlternateColor.length],
                      ),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isTappedList[index] = !isTappedList[index];
                              // isTappedList[index] = isTappedToExpand;
                            });
                            // print('Inside Container ${isTappedList[index]}');
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            height:  isTappedList[index]
                                ? AppScreenUtil().screenHeight(50)
                                : AppScreenUtil().screenHeight(190),
                            padding: EdgeInsets.fromLTRB(20, 14, 15, 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                              color:
                                  tableDataColor[index % tableDataColor.length],
                            ),
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Friday Special',
                                          style: status[index] == false
                                              ? disabledTitleTextStyle
                                              : titleTextStyle,
                                        ),
                                        Row(
                                          children: [
                                            FlutterSwitch(
                                              width: 43,
                                              height: 18,
                                              toggleSize: 11.0,
                                              value: status[index],
                                              borderRadius: 30.0,
                                              padding: 2.0,
                                              toggleColor:
                                                  status[index] == false
                                                      ? blackColor
                                                      : greenColor,
                                              switchBorder: Border.all(
                                                color: status[index] == false
                                                    ? blackColor
                                                    : greenColor,
                                                width: 1,
                                              ),
                                              toggleBorder: Border.all(
                                                color: status[index] == false
                                                    ? blackColor
                                                    : greenColor,
                                                width: 1,
                                              ),
                                              activeColor: whiteColor,
                                              inactiveColor: whiteColor,
                                              onToggle: (val) {
                                                setState(() {
                                                  status[index] = val;
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              width: AppScreenUtil()
                                                  .screenWidth(6),
                                            ),
                                            Icon(
                                              Icons.delete,
                                              color: confirmColor,
                                              size: 21,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(9),
                                    ),
                                    MySeparator(
                                        color:
                                            subDividerColor.withOpacity(0.2)),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      'Chiken Burger',
                                      style: status[index] == false
                                          ? disabledSpecialItemsLabelStyle
                                          : specialItemsLabelStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      'Beef Burger',
                                      style: status[index] == false
                                          ? disabledSpecialItemsLabelStyle
                                          : specialItemsLabelStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      'Apple Juice',
                                      style: status[index] == false
                                          ? disabledSpecialItemsLabelStyle
                                          : specialItemsLineTroughLabelStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      'Pastha',
                                      style: status[index] == false
                                          ? disabledSpecialItemsLabelStyle
                                          : specialItemsLabelStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      'Chiken Biriyani',
                                      style: status[index] == false
                                          ? disabledSpecialItemsLabelStyle
                                          : specialItemsLineTroughLabelStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      'Mint Lime',
                                      style: status[index] == false
                                          ? disabledSpecialItemsLabelStyle
                                          : specialItemsLabelStyle,
                                    ),
                                  ],
                                )),
                          )),
                    ),
                  ));
            })));
  }
}
