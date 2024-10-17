// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:restaurant/presentation/admin_app/widgets/colored_dropdown.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_textfield.dart';
import 'package:restaurant/presentation/admin_app/widgets/settings_check_box_with_label.dart';

import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class TaxCreate extends StatefulWidget {
  const TaxCreate({super.key});

  @override
  State<TaxCreate> createState() => _TaxCreateState();
}

class _TaxCreateState extends State<TaxCreate> {
  String? _selectedItem;
  final List<String> _dropdownItems = ['01', '02', '03'];
  bool isChecked = false;
  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(14),
  );
  int _selectedRadio = 0;
  void _handleRadioValueChange(dynamic value) {
    setState(() {
      _selectedRadio = value;
    });
    print('Tapped radio: $_selectedRadio');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 60),
      child: Padding(
        padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColoredTextField(
                color: textFieldColor,
                controller: TextEditingController(),
                title: 'Tax Name'),
            SizedBox(height: AppScreenUtil().screenHeight(10),),
            ColoredDropDown(isVisible: true,
              dropDownItems: _dropdownItems,
              title: 'Tax Scop',
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
            ),
            SizedBox(height: AppScreenUtil().screenHeight(10),),
            ColoredDropDown(isVisible: true,
              dropDownItems: _dropdownItems,
              title: 'Tax Type',
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
            ),
            SizedBox(height: AppScreenUtil().screenHeight(20),),
            Row(
              children: [
                Text(
                'Included Price',
                  style: bookedTextStyle,
                ),
                SizedBox(width: AppScreenUtil().screenWidth(8)),
                InkWell(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      color: isChecked ? constantWhite : Colors.transparent,
                    ),
                    child: isChecked
                        ?Padding(
                      padding: const EdgeInsets.all(1),
                      child: SvgPicture.asset(ImageCons.imgCheckboxTikMark,width: 11.92,height: 9.13,),
                    )
                        : null,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(18),
            ),
            Text('Tax Computation',style: dialoguePasswordTextStyle,),
            SizedBox(
              height: AppScreenUtil().screenHeight(13),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      'Percentage Of Price',
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
                      'Group Of Taxes',
                      style: bookedTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            constHeight,
            ColoredDropDown(isVisible: true,
              dropDownItems: _dropdownItems,
              title: 'Tax Account',
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
            ),
            constHeight,
            ColoredTextField(
                color: textFieldColor,
                controller: TextEditingController(),
                title: 'Amount'),
            constHeight,
          ],
        ),
      ),
    );
  }
}
