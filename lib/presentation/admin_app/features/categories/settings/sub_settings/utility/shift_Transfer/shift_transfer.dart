// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../widgets/colored_textfield.dart';
import '../../../../../../widgets/shift_transfer_dialogue.dart';

class ShiftTransfer extends StatefulWidget {
  const ShiftTransfer({super.key});

  @override
  State<ShiftTransfer> createState() => _ShiftTransferState();
}

class _ShiftTransferState extends State<ShiftTransfer> {
  final passwordController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  bool buttonTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: buttonTapped == true?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shift Transfer',
            style: tableDetailHeadTextStyle,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          ColoredDropDown(
            dropDownItems: _dropdownItems,
            title: 'Branch',
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
            },
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          ColoredDropDown(
            dropDownItems: _dropdownItems,
            title: 'Type',
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
            },
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Text(
            'Transfer Document',
            style: bookedTextStyle,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(8),
          ),
          Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              height: 41,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: textFieldColor),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                    width: 83,
                    height: 20,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(11)),
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Search Document',
                          style: searchDocumentTextStyle,
                          textAlign: TextAlign.center),
                    )),
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Text(
            'Transfer To',
            style: bookedTextStyle,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(8),
          ),
          Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              height: 41,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: textFieldColor),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Container(
                      width: 71,
                      height: 20,
                      decoration: BoxDecoration(
                          color: searchShiftColor.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(11)),
                      padding: EdgeInsets.only(bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Search Shift',
                            style: rolesAndPermissionSelectedTabLabelStyle,
                            textAlign: TextAlign.center),
                      )),
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return HorizontalListViewDialog();
                      },
                    );
                  },
                ),
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    width: 83,
                    height: 24,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: blackColor)),
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Cancel',
                          style: categoryMenuTextStyle, textAlign: TextAlign.center),
                    )),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(8),),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    width: 83,
                    height: 24,
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: blackColor)),
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Submit',
                          style: confirmTextStyle, textAlign: TextAlign.center),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          ),
        ],
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter Password',
            style: tableDetailHeadTextStyle,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          ColoredTextField(
              color: textFieldColor,
              controller: passwordController,
              title: 'Password'),
          SizedBox(
            height: AppScreenUtil().screenHeight(12),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              child: Container(
                  width: 83,
                  height: 24,
                  decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(11)),
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Submit',
                        style: confirmTextStyle,
                        textAlign: TextAlign.center),
                  )),
              onTap: (){
                setState(() {
                  buttonTapped = true;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
