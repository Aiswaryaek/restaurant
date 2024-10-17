import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class DefaultCheckBox extends StatefulWidget {
  final String checkBoxLabel;
  const DefaultCheckBox({super.key,required this.checkBoxLabel});

  @override
  State<DefaultCheckBox> createState() => _DefaultCheckBoxState();
}

class _DefaultCheckBoxState extends State<DefaultCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return  Row(
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
              border: Border.all(color: blackColor,width: 1.5),
              color: isChecked ? constantWhite : Colors.transparent,
            ),
            child: isChecked
                ?Padding(
              padding: const EdgeInsets.all(2),
              child: Center(child: SvgPicture.asset(ImageCons.imgCheckboxTikMark,width: 10,height: 7,)),
            )
                : null,
          ),
        ),
        SizedBox(width: AppScreenUtil().screenWidth(8)),
        Text(
          widget.checkBoxLabel,
          style: subCompanySettingsTextStyle,
        ),
      ],
    );
  }
}