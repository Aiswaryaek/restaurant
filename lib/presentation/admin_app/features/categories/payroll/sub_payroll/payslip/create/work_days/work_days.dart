// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../../styles/colors.dart';
import '../../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../widgets/colored_textfield.dart';

class WorkDays extends StatefulWidget {
  const WorkDays({super.key});

  @override
  State<WorkDays> createState() => _WorkDaysState();
}

class _WorkDaysState extends State<WorkDays> {
  final totalWorkingDaysController = TextEditingController();
  final paidDaysController = TextEditingController();
  final unPaidDaysController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: ColoredTextField(
                color: textFieldColor,
                controller: totalWorkingDaysController,
                title: 'Total Working Days'),),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(child: ColoredTextField(
                color: textFieldColor,
                controller: paidDaysController,
                title: 'Paid Days'),),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(18),
        ),
        Row(
          children: [
            Expanded(child: ColoredTextField(
                color: textFieldColor,
                controller: unPaidDaysController,
                title: 'Unpaid Days'),),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(child: Container(),),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(18),
        ),
        Divider(
          color: inventorySelectionColor,
          thickness: 1.5,
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(15),
        ),
      ],
    );
  }
}
