// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';

class AttendanceList extends StatefulWidget {
  const AttendanceList({super.key});

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  List<Color> tableDataAlternateColor = [
    leftPayslipFirstColor.withOpacity(0.8),
    leftLoanEligibilitySecondColor.withOpacity(0.8),
    leftLoanEligibilityThirdColor.withOpacity(0.8),
    leftLoanEligibilityFourColor.withOpacity(0.8),
    leftLoanEligibilityFiveColor.withOpacity(0.8),
    leftLoanEligibilitySixColor.withOpacity(0.8),
    leftLoanEligibilitySevenColor.withOpacity(0.8),
    leftLoanEligibilityEightColor.withOpacity(0.8),
  ];
  List<Color> tableDataColor = [
    loanFirstContainerCardColor,
    loanSecondContainerCardColor,
    loanThirdContainerCardColor,
    loanFourContainerCardColor,
    loanFiveContainerCardColor,
    loanSixContainerCardColor,
    loanSevenContainerCardColor,
    loanEightContainerCardColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 45, bottom: 30, right: 45),
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
                    childAspectRatio: 3 / 1.54),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.only(left: 5.5),
                      decoration: BoxDecoration(
                        color:   leftPayslipFirstColor.withOpacity(0.8),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(23, 14, 23, 15),
                        decoration: BoxDecoration(
                          color: loanFirstContainerCardColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EMP125-Vaisak',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(15),
                            ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     'Check In',
                                     style: payrollTitleStyle,
                                   ),
                                   SizedBox(
                                     height: AppScreenUtil().screenHeight(4),
                                   ),
                                   Text(
                                     '12/4/2023 8:00:00',
                                     style: subTitleTextStyle,
                                   ),
                                 ],
                               ),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     'Check Out',
                                     style: payrollTitleStyle,
                                   ),
                                   SizedBox(
                                     height: AppScreenUtil().screenHeight(4),
                                   ),
                                   Text(
                                     '12/4/2023 18:00:00',
                                     style: subTitleTextStyle,
                                   ),
                                 ],
                               ),
                             ],
                           ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(16),
                            ),
                            Text(
                              'Duration(Hours)',
                              style: payrollTitleStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(4),
                            ),
                            Text(
                              '10:00:00 AM',
                              style: subTitleTextStyle,
                            ),
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }
}
