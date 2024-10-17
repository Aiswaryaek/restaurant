import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/Custom_drop_down_button.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_check_box.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class CustomCheckBoxAndDropDown extends StatefulWidget {
  final String checkboxTitle;
  final String dropDownTitle;
  final String? value;
  final List<String> dropdownItems;
  final Function(String?)? onChanged;
  const CustomCheckBoxAndDropDown({super.key,required this.checkboxTitle,required this.dropDownTitle,required this.dropdownItems,required this.onChanged,required this.value});

  @override
  State<CustomCheckBoxAndDropDown> createState() => _CustomCheckBoxAndDropDownState();
}

class _CustomCheckBoxAndDropDownState extends State<CustomCheckBoxAndDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: AppScreenUtil().screenHeight(15),
      
      bottom: AppScreenUtil().screenHeight(15)),
      child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonCheckBox(
                  borderColor: blackColor,
                  borderRadius: BorderRadius.circular(1),
                ),
                SizedBox(
                  width: AppScreenUtil().screenWidth(16),
                ),
                Text(
                  widget.checkboxTitle,
                  style: posSettingsTitleStyle,
                ),
             
              ],
            ),
               SizedBox(
                  height: AppScreenUtil().screenHeight(24),
                ),
                CustomDropDownButton(
                  titleLabelStyle: posSettingsSubTitleStyle(null),
                  title: widget.dropDownTitle,
                  value: widget.value,
                  dropdownItems: widget.dropdownItems,
                  onChanged: widget.onChanged
                ),
      ],),
    );
  }
}