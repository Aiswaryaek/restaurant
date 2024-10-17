import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import 'auto_shift/auto_shift.dart';
import 'manual_shift/manual_shift.dart';

class AddShift extends StatefulWidget {
  const AddShift({super.key});

  @override
  State<AddShift> createState() => _AddShiftState();
}

class _AddShiftState extends State<AddShift> {
  int _selectedRadio = 0;
  void _handleRadioValueChange(dynamic value) {
    setState(() {
      _selectedRadio = value;
    });
    print('Tapped radio: $_selectedRadio');
  }
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  activeColor: blackColor,
                  focusColor: blackColor,
                  value: 0,
                  materialTapTargetSize:
                  MaterialTapTargetSize.shrinkWrap,
                  groupValue: _selectedRadio,
                  visualDensity: VisualDensity.compact,
                  onChanged: _handleRadioValueChange,
                ),
                Text(
                  'Auto Shift',
                  style: bookedTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  activeColor: blackColor,
                  focusColor: blackColor,
                  value: 1,
                  materialTapTargetSize:
                  MaterialTapTargetSize.shrinkWrap,
                  groupValue: _selectedRadio,
                  visualDensity: VisualDensity.compact,
                  onChanged: _handleRadioValueChange,
                ),
                Text(
                  'Manual Shift',
                  style: bookedTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  activeColor: blackColor,
                  focusColor: blackColor,
                  value: 2,
                  materialTapTargetSize:
                  MaterialTapTargetSize.shrinkWrap,
                  groupValue: _selectedRadio,
                  visualDensity: VisualDensity.compact,
                  onChanged: _handleRadioValueChange,
                ),
                Text(
                  'None',
                  style: bookedTextStyle,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: blackColor, width: 1.5),
                      color: isChecked
                          ? constantWhite
                          : Colors.transparent,
                    ),
                    child: isChecked
                        ? Padding(
                      padding: const EdgeInsets.all(2),
                      child: Center(
                          child: SvgPicture.asset(
                            ImageCons.imgCheckboxTikMark,
                            width: 10,
                            height: 7,
                          )),
                    )
                        : null,
                  ),
                ),
                SizedBox(width: AppScreenUtil().screenWidth(8)),
                Text(
                  'Denomination',
                  style: subCompanySettingsTextStyle,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: AppScreenUtil().screenHeight(15),),
        _selectedRadio == 0?AutoShift():_selectedRadio == 1?ManualShift():SizedBox(),
        SizedBox(height: AppScreenUtil().screenHeight(30),),
      ],
    );
  }
}
