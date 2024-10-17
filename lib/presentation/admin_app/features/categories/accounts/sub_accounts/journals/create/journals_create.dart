// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';

class Journal extends StatefulWidget {
  const Journal({super.key});

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  String? _selectedItem;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final journalNameController = TextEditingController();
  final shortCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: journalNameController, title: 'Journal Name')),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Type',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ))
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Branch',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: shortCodeController, title: 'Short Code'))
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          SizedBox(width: AppScreenUtil().screenWidth(150),child: CommonDropDownWithTitle(
            dropDownItems: _dropdownItems,
            title: 'Default Account',
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
            },
          ),),
        ],
      ),
    );
  }
}
