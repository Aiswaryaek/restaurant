// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';

class SponsorList extends StatefulWidget {
  const SponsorList({super.key});

  @override
  State<SponsorList> createState() => _SponsorListState();
}

class _SponsorListState extends State<SponsorList> {
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
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 1.29),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.only(left: 5.5),
                      decoration: BoxDecoration(
                        color:sponsorLeftColor.withOpacity(0.7),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(
                            AppScreenUtil().screenWidth(18)),bottomRight:  Radius.circular(
                            AppScreenUtil().screenWidth(18))),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                        decoration: BoxDecoration(
                          color: payslipGridContainerColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(
                              AppScreenUtil().screenWidth(18)),bottomRight:  Radius.circular(
                              AppScreenUtil().screenWidth(18))),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Leeyet Techno Hub',overflow: TextOverflow.ellipsis,
                              style: rolesAndPermissionModuleAccessTabLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(15),
                            ),
                            Text(
                              '10100',overflow: TextOverflow.ellipsis,
                              style: rolesAndPermissionModuleAccessTabLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(15),
                            ),
                            Text(
                              '03/01/2023',
                              style: rolesAndPermissionModuleAccessTabLabelStyle,
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
