// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';

class BatchPayslipList extends StatefulWidget {
  const BatchPayslipList({super.key});

  @override
  State<BatchPayslipList> createState() => _BatchPayslipListState();
}

class _BatchPayslipListState extends State<BatchPayslipList> {
  List<Color> tableDataAlternateColor = [
    leftPayslipFirstColor.withOpacity(0.7),
    leftPayslipSecondColor.withOpacity(0.7),
    leftPayslipThirdColor.withOpacity(0.7),
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
                    childAspectRatio: 3 / 1.37),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.only(left: 5.5),
                      decoration: BoxDecoration(
                        color: tableDataAlternateColor[
                        index % tableDataAlternateColor.length],
                        borderRadius: BorderRadius.only(topRight: Radius.circular(
                            AppScreenUtil().screenWidth(13)),bottomRight:  Radius.circular(
                            AppScreenUtil().screenWidth(13))),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(23, 14, 23, 15),
                        decoration: BoxDecoration(
                          color: payslipGridContainerColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(
                              AppScreenUtil().screenWidth(13)),bottomRight:  Radius.circular(
                              AppScreenUtil().screenWidth(13))),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NAME',
                              style: uomTextStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                            Text(
                              'Jan Batcpayslip for alkhore branch',
                              style: rolesAndPermissionModuleAccessTabLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(19),
                            ),
                            Text(
                              'PERIOD',
                              style: uomTextStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text(
                                 '01/10/2023',
                                 style: rolesAndPermissionModuleAccessTabLabelStyle,
                               ),
                               SizedBox(
                                 width: AppScreenUtil().screenWidth(35),
                               ),
                               Text(
                                 '02/09/2023',
                                 style: rolesAndPermissionModuleAccessTabLabelStyle,
                               ),
                             ],
                           )
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
