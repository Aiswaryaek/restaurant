import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class SettingsCheckBoxWithLabel extends StatefulWidget {
  final String checkBoxLabel;
  const SettingsCheckBoxWithLabel({super.key,required this.checkBoxLabel});

  @override
  State<SettingsCheckBoxWithLabel> createState() => _SettingsCheckBoxWithLabelState();
}

class _SettingsCheckBoxWithLabelState extends State<SettingsCheckBoxWithLabel> {
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
                    width: 21.26,
                    height: 21.26,
                    decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      color: isChecked ? constantWhite : Colors.transparent,
                    ),
                    child: isChecked
                        ?Padding(
                          padding: const EdgeInsets.all(3),
                          child: SvgPicture.asset(ImageCons.imgCheckboxTikMark,width: 11.92,height: 9.13,),
                        )
                        : null,
                  ),
                ),
                SizedBox(width: AppScreenUtil().screenWidth(15)),
                Text(
                  widget.checkBoxLabel,
                  style: settingsCheckBoxLabelStyle,
                ),
              ],
            );
  }
}