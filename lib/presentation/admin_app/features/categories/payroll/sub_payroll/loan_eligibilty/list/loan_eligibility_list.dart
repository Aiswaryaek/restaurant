// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';

class LoanEligibilityList extends StatefulWidget {
  const LoanEligibilityList({super.key});

  @override
  State<LoanEligibilityList> createState() => _LoanEligibilityListState();
}

class _LoanEligibilityListState extends State<LoanEligibilityList> {
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
                    childAspectRatio: 3 / 1.79),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.only(left: 5.5),
                      decoration: BoxDecoration(
                        color: tableDataAlternateColor[
                        index % tableDataAlternateColor.length],
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(23, 14, 23, 15),
                        decoration: BoxDecoration(
                          color: tableDataColor[
                          index % tableDataColor.length],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Department',
                              style: uomTextStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(4),
                            ),
                            Text(
                              'ACCOUNTS',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(14),
                            ),
                            Text(
                              'Minimum salary',
                              style: uomTextStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(4),
                            ),
                            Text(
                              '20000.00',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(14),
                            ),
                            Text(
                              'Outstanding amount',
                              style: uomTextStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(4),
                            ),
                            Text(
                              '12000.00',
                              style: taxCreateEnterAPassWordLabelStyle,
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
