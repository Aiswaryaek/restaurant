// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../widgets/colored_dropdown.dart';
import '../../../../../widgets/inventory_table_layout_without_scroll.dart';
import '../../../../../widgets/reason_textfield.dart';
import '../../../../../widgets/settings_check_box_with_label.dart';

class SmsSettings extends StatefulWidget {
  const SmsSettings({super.key});

  @override
  State<SmsSettings> createState() => _SmsSettingsState();
}

class _SmsSettingsState extends State<SmsSettings> {
  String tab1 = 'Add SMS Header';
  String tab2 = 'Add SMS Template';
  dynamic item = 'Add SMS Header';
  bool tappedTab1 = true;
  bool tappedTab2 = false;
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  List<Color> tableDataAlternateColor = [
    textFieldColor,
    whiteColor,
  ];
  List<String>headerName=[
    'Munshid',
    'Munshid',
    'Munshid'
  ];
  List<String>status=[
    'Approved',
    'Approved',
    'Approved'
  ];
  int _selectedRadio = 0;
  void _handleRadioValueChange(dynamic value) {
    setState(() {
      _selectedRadio = value;
    });
  }
  final templateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 8, 25, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                    decoration: BoxDecoration(
                        color: tappedTab1 == true
                            ? blackColor
                            : whiteColor,
                        borderRadius: BorderRadius.circular(11)),
                    height: 24,
                    width: 105,
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(tab1,
                          style: tappedTab1 == true
                              ? placeOrderingAndConfirmPaymentButtonLabelStyle
                              : subCompanySettingsTextStyle,
                          textAlign: TextAlign.center),
                    )),
                onTap: (){
                  setState(() {
                    item = tab1;
                    tappedTab1 = true;
                    tappedTab2 = false;
                  });
                },
              ),
              SizedBox(width: AppScreenUtil().screenWidth(2),),
              InkWell(
                child: Container(
                    decoration: BoxDecoration(
                        color: tappedTab2 == true
                            ? blackColor
                            : whiteColor,
                        borderRadius: BorderRadius.circular(11)),
                    height: 24,
                    width: 105,
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(tab2,
                          style: tappedTab2 == true
                              ? placeOrderingAndConfirmPaymentButtonLabelStyle
                              : subCompanySettingsTextStyle,
                          textAlign: TextAlign.center),
                    )),
                onTap: (){
                  setState(() {
                    item = tab2;
                    tappedTab1 = false;
                    tappedTab2 = true;
                  });
                },
              )
            ],
          ),
          Transform.translate(
              offset: Offset(0, -9),
              child: Padding(
                padding: EdgeInsets.only(left: 60, right: 60),
                child: Divider(
                  color: blackColor,
                  thickness: 1.5,
                ),
              )),
          SizedBox(height: AppScreenUtil().screenHeight(10),),
          item =='Add SMS Header'?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColoredDropDown(isVisible: true,
                dropDownItems: _dropdownItems,
                title: 'Provider',
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
                'Header Name',
                style: bookedTextStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(8),
              ),
              Container(
                height: 41,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all(color: subDividerColor),
                    borderRadius: BorderRadius.circular(8),
                    color: whiteColor),
                child: DropdownButton<String>(style: searchInputTextStyle,
                  padding: const EdgeInsets.only(
                      left: 10, right: 10),
                  value: _selectedItem,
                  items: _dropdownItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: subTitleTextStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: blackColor,
                  ),
                  iconSize: 20,
                  isExpanded: true,
                  underline:
                  const SizedBox(), // Removes the default underline
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              InventoryTableLayoutWithoutScroll(
                  scrollIndicatorVisibility: false,
                  // tableHeight: MediaQuery.of(context).size.height/2,
                  tableDataWidgets: List.generate(headerName.length, (index) {
                    return InkWell(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenWidth(5)),
                        child: Container(
                          height: AppScreenUtil().screenHeight(36),
                          width: AppScreenUtil().screenWidth(350),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: tableDataAlternateColor[
                            index % tableDataAlternateColor.length],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(18)),

                            ///scrolling row
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(80),
                                      child: Center(
                                        child: Text(
                                          headerName[index],
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(bottom: 2),
                                          width: AppScreenUtil().screenWidth(65),
                                          height:
                                          AppScreenUtil().screenHeight(18),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(3),
                                            color: postedButtonColor
                                                .withOpacity(0.9),
                                          ),
                                          child: Center(
                                            child: Text(
                                              status[index],
                                              style:
                                              inventoryCreateButtonLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {},
                    );
                  }),
                  tableRowWidth: 350,
                  titleWidgets: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Header Name',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(90),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Status',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                  ]),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
            ],
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingsCheckBoxWithLabel(checkBoxLabel: 'Billing'),
                      SizedBox(height: AppScreenUtil().screenHeight(10),),
                      SettingsCheckBoxWithLabel(checkBoxLabel: 'Credit'),
                      SizedBox(height: AppScreenUtil().screenHeight(10),),
                      SettingsCheckBoxWithLabel(checkBoxLabel: 'Offer'),
                      SizedBox(height: AppScreenUtil().screenHeight(10),),
                      SettingsCheckBoxWithLabel(checkBoxLabel: 'Festival'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingsCheckBoxWithLabel(checkBoxLabel: 'Rewards'),
                      SizedBox(height: AppScreenUtil().screenHeight(10),),
                      SettingsCheckBoxWithLabel(checkBoxLabel: 'Staff Expired Documents'),
                      SizedBox(height: AppScreenUtil().screenHeight(10),),
                      SettingsCheckBoxWithLabel(checkBoxLabel: 'Loan'),
                      SizedBox(height: AppScreenUtil().screenHeight(10),),
                      SettingsCheckBoxWithLabel(checkBoxLabel: 'Leave'),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
              ColoredDropDown(isVisible: true,
                dropDownItems: _dropdownItems,
                title: 'Template',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(5),
              ),
              Transform.translate(offset: Offset(-14,0),child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 0,
                        activeColor: blackColor,
                        focusColor: blackColor,
                        groupValue: _selectedRadio,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'English',
                        style: bookedTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(75),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 0,
                        activeColor: blackColor,
                        focusColor: blackColor,
                        groupValue: _selectedRadio,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'English',
                        style: bookedTextStyle,
                      ),
                    ],
                  ),
                ],
              ),),
              SizedBox(
                height: AppScreenUtil().screenHeight(10),
              ),
              Text(
                'Template',
                style: bookedTextStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(8),
              ),
              Container(
                // width: widget.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: whiteColor,border: Border.all(color: whiteColor,width: 0.2)),
                child: SizedBox(
                  height: 80,
                  child: Transform.translate(offset: const Offset(0,-3),child: TextField(maxLines: 10,
                    controller: templateController,
                    style: searchInputTextStyle,textAlign: TextAlign.center,
                    cursorColor: whiteColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      isDense: true,
                      hintStyle: placeholderTextStyle,
                      fillColor: blackColor,focusColor: blackColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blackColor,width:0.7),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:blackColor,width: 0.7),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blackColor,width: 0.7),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blackColor,width: 0.7,)
                      ),
                    ),
                  )),),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
            ],
          ),
        ],
      )
    );
  }
}
