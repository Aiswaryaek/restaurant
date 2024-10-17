// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/shift/add_shift/add_shift.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/shift/shift_reopens/shift_reopens.dart';
import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../utiles/image_constant.dart';
import '../../../../../widgets/colored_textfield.dart';
import '../../../../../widgets/default_check_box.dart';
import '../../../../../widgets/settings_check_box_with_label.dart';
import 'add_shift/auto_shift/auto_shift.dart';
import 'add_shift/manual_shift/manual_shift.dart';

class Shift extends StatefulWidget {
  const Shift({super.key});

  @override
  State<Shift> createState() => _ShiftState();
}

class _ShiftState extends State<Shift> {
  bool tappedTab1 = true;
  bool tappedTab2 = false;
  String tab1 = 'Add Shift';
  String tab2 = 'Shift Reopen';
  dynamic item = 'Add Shift';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      color: tappedTab1 == true ? blackColor : whiteColor,
                      borderRadius: BorderRadius.circular(11)),
                  height: 24,
                  width: 101,
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(tab1,
                        style: tappedTab1 == true
                            ? cartSelectedTabLabelTextStyle
                            : categoryMenuTextStyle,
                        textAlign: TextAlign.center),
                  )),
              onTap: () {
                setState(() {
                  item = tab1;
                  tappedTab1 = true;
                  tappedTab2 = false;
                });
              },
            ),
            SizedBox(
              width: AppScreenUtil().screenWidth(2),
            ),
            InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      color: tappedTab2 == true ? blackColor : whiteColor,
                      borderRadius: BorderRadius.circular(11)),
                  height: 24,
                  width: 101,
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(tab2,
                        style: tappedTab2 == true
                            ? cartSelectedTabLabelTextStyle
                            : categoryMenuTextStyle,
                        textAlign: TextAlign.center),
                  )),
              onTap: () {
                setState(() {
                  item = tab2;
                  tappedTab1 = false;
                  tappedTab2 = true;
                });
              },
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Transform.translate(
              offset: Offset(0, -9),
              child: Padding(
                padding: EdgeInsets.only(left: 70, right: 70),
                child: Divider(
                  color: blackColor,
                  thickness: 1.5,
                ),
              )),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(5),
        ),
        item == 'Add Shift'
            ? Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 60),
          child: AddShift(),
        )
            : ShiftReOpens(),
      ],
    );
  }
}
