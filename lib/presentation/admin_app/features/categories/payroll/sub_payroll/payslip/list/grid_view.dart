// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';

class PayslipGridView extends StatefulWidget {
  const PayslipGridView({super.key});

  @override
  State<PayslipGridView> createState() => _PayslipGridViewState();
}

class _PayslipGridViewState extends State<PayslipGridView> {
  List<Color> tableDataAlternateColor = [
    Colors.blue.withOpacity(0.35),
    Colors.pink.withOpacity(0.35),
    Colors.orange.withOpacity(0.35)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15, bottom: 30, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 25,
                    childAspectRatio: 3 / 1.65),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(left: 5.5),
                    decoration: BoxDecoration(
                      color: tableDataAlternateColor[
                          index % tableDataAlternateColor.length],
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Container(
                        padding: EdgeInsets.fromLTRB(23, 23, 23, 23),
                        decoration: BoxDecoration(
                          color: backGroundColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EMPLOYEE',
                                  style: payrollTitleStyle,
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(4),
                                ),
                                Text(
                                  'Name of Employee',
                                  style: payslipSubtitleStyle,
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(20),
                                ),
                                Text(
                                  'BRANCH',
                                  style: payrollTitleStyle,
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(4),
                                ),
                                Text(
                                  'DUBAI',
                                  style: payslipSubtitleStyle,
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(20),
                                ),
                                Text(
                                  'DESIGNATION',
                                  style: payrollTitleStyle,
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(4),
                                ),
                                Text(
                                  'ACCOUNTANT',
                                  style: payslipSubtitleStyle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PERIOD',
                                  style: payrollTitleStyle,
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(4),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '01/10/2023',
                                      style: payslipSubtitleStyle,
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(35),
                                    ),
                                    Text(
                                      '02/09/2023',
                                      style: payslipSubtitleStyle,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(20),
                                ),
                                Text(
                                  'CONTRACT',
                                  style: payrollTitleStyle,
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(4),
                                ),
                                Text(
                                  'ACCOUNTANT CONTARCT',
                                  style: payslipSubtitleStyle,
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(20),
                                ),
                                Text(
                                  'DEPARTMENT',
                                  style: payrollTitleStyle,
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(4),
                                ),
                                Text(
                                  'FINANCE',
                                  style: payslipSubtitleStyle,
                                ),
                              ],
                            ),
                          ],
                        )),
                  );
                },
              ),
            )
          ],
        ));
  }
}
