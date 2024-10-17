// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';

class PosTables extends StatefulWidget {
  const PosTables({super.key});

  @override
  State<PosTables> createState() => _PosTablesState();
}

class _PosTablesState extends State<PosTables> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: 40, right: 20, top: 20),
      child: Wrap(alignment: WrapAlignment.center,
        direction: Axis.horizontal,
        runSpacing: 22,
        children: List<Widget>.generate(10,
                (int index) {
              return Padding(padding: EdgeInsets.only(right: 15),child: Container(
                height: AppScreenUtil().screenHeight(61.75),
                width: AppScreenUtil().screenWidth(61.72),
                decoration: BoxDecoration(
                    border:Border.all(color: userPostColor),color: whiteColor
                ),
                child: Center(
                  child: Text('T03',style: pangramMedium(
                      size: 10.0, color: blackColor),),
                ),
              ),);
            }).toList(),
      ),
    );
  }
}
