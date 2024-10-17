// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final nameController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final stateController = TextEditingController();
  final addressController = TextEditingController();
  final wareHouseController = TextEditingController();
  final shortCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child:
                      CustomTextFieldWithTitle(
                          controller: nameController, title: 'Name'),
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                      child:
                      CustomTextFieldWithTitle(
                          controller: addressController, title: 'Address'),
                    )
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child:
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Branch',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                      child:
                      CustomTextFieldWithTitle(
                          controller: wareHouseController, title: 'Warehouse'),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child:
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Location Type',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                      child:
                      CustomTextFieldWithTitle(
                          controller: shortCodeController, title: 'Short Code'),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
              ],
            )),
      ],
    );
  }
}
