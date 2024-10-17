// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';

class Contract extends StatefulWidget {
  const Contract({super.key});

  @override
  State<Contract> createState() => _ContractState();
}

class _ContractState extends State<Contract> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final durationFrom = TextEditingController();
  final durationTo = TextEditingController();
  final referenceController = TextEditingController();

  dateSelection({required TextEditingController controller}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        controller.text = formattedDate;
      });
    } else {
      if (kDebugMode) {
        print("Date is not selected");
      }
    }
  }

  int durationType = 1;

  void incrementHours() {
    setState(() {
      durationType = (durationType + 1) % 3;
    });
  }

  void decrementHours() {
    setState(() {
      durationType = (durationType - 1) % 3;
      if (durationType < 0) {
        durationType = 3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'CONTR/2023/10/0001',
              style: billTextStyle,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(8),
          ),
          Row(
            children: [
              Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Employee',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Department',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              )),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Row(
            children: [
              Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Designation',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Contract Type',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              )),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Row(
            children: [
              Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Sponsor',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
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
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Row(
            children: [
              Expanded(
                  child: CustomTextFieldWithDate(
                controller: durationFrom,
                title: 'Duration From',
                onTap: () async {
                  dateSelection(controller: durationFrom);
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CustomTextFieldWithDate(
                controller: durationTo,
                title: 'Duration To',
                onTap: () async {
                  dateSelection(controller: durationTo);
                },
              )),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Row(
            children: [
              Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Duration',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Duration Type',
                    style: bookedTextStyle,
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(8),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: whiteColor,
                        boxShadow: const [
                          BoxShadow(
                            color: searchTextColor,
                            offset: Offset(0, 0),
                            blurRadius: 1,
                          ),
                        ]),
                    child: SizedBox(
                      height: 37,
                      child: TextField(
                        style: searchInputTextStyle,
                        controller: TextEditingController(
                            text: durationType == 1
                                ? 'Day'
                                : durationType == 2
                                    ? 'Month'
                                    : 'Year'),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            suffixIcon: GestureDetector(
                                onTap: incrementHours,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 1,
                                  ),
                                  child: Column(
                                    children: [
                                      InkWell(
                                          onTap: incrementHours,
                                          child: Transform.translate(
                                            offset: Offset(0, 3),
                                            child: Icon(
                                              Icons.arrow_drop_up,
                                              size: 18,
                                              color: blackColor,
                                            ),
                                          )),
                                      InkWell(
                                          onTap: decrementHours,
                                          child: Transform.translate(
                                            offset: Offset(0, -2),
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              size: 18,
                                              color: blackColor,
                                            ),
                                          ))
                                    ],
                                  ),
                                )),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: whiteColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: whiteColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: whiteColor),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: whiteColor),
                            ),
                            labelText: ""),
                        readOnly: true,
                      ),
                    ),
                  )
                ],
              )),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Text(
            'Reference',
            style: bookedTextStyle,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(8),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: searchTextColor,
                    offset: Offset(0, 0),
                    blurRadius: 1.5,
                  ),
                ]),
            child: SizedBox(
                height: 89,
                child: TextField(
                  controller: referenceController,
                  maxLines: 10,
                  style: searchInputTextStyle,
                  textAlign: TextAlign.center,
                  cursorColor: whiteColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    hintStyle: placeholderTextStyle,
                    fillColor: blackColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Divider(
            color: inventorySelectionColor,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
